import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:ava/infrastructure/core/api.dart';
import 'package:ava/infrastructure/core/vision/line.dart';
import 'package:ava/infrastructure/core/vision/ocr_response.dart';
import 'package:ava/infrastructure/core/vision/region.dart';
import 'package:ava/infrastructure/core/vision/word.dart';
import 'package:ava/injection.dart';
import 'package:ava/presentation/eye/widgets/bottom_bar.dart';
import 'package:ava/utils/constants.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as imgUtils;
import 'package:path_provider/path_provider.dart';

class EyeScreen extends StatefulWidget {
  EyeScreen({Key key}) : super(key: key);

  @override
  _EyeScreenState createState() => _EyeScreenState();
}

class _EyeScreenState extends State<EyeScreen> {
  ValueNotifier<Size> _photoSize = ValueNotifier(null);
  ValueNotifier<Sensors> _sensor = ValueNotifier(Sensors.BACK);
  ValueNotifier<CaptureModes> _captureMode = ValueNotifier(CaptureModes.PHOTO);

  PictureController _pictureController = new PictureController();

  StreamSubscription<Uint8List> previewStreamSub;
  Stream<Uint8List> previewStream;
  Uint8List imgData;

  EyeModes _eyeMode = EyeModes.OCR;

  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _buildPreviewStream();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          SafeArea(
            bottom: false,
            child: CameraAwesome(
              captureMode: _captureMode,
              photoSize: _photoSize,
              sensor: _sensor,
              imagesStreamBuilder: (imageStream) {
                /// listen for images preview stream
                /// you can use it to process AI recognition or anything else...
                print("-- init CamerAwesome images stream");
                setState(() {
                  previewStream = imageStream;
                });

                _eyeMode == EyeModes.OCR
                    ? imageStream.listen((Uint8List imageData) => _listen(imageData))
                    : null;
              },
            ),
          ),
          BottomBar(
            onCaptureTap: _takePhoto,
          ),
        ],
      ),
    );
  }

  _takePhoto() async {
    final Directory extDir = await getTemporaryDirectory();
    final testDir = await Directory('${extDir.path}/test').create(recursive: true);
    final String filePath =
        '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    await _pictureController.takePicture(filePath);
    // lets just make our phone vibrate
    HapticFeedback.mediumImpact();
    setState(() {});
    print("----------------------------------");
    print("TAKE PHOTO CALLED");
    final file = File(filePath);
    print("==> hastakePhoto : ${file.exists()} | path : $filePath");
    //final img = imgUtils.decodeImage(file.readAsBytesSync());
    final img = file.readAsBytesSync();
    //print("==> img.width : ${img.width} | img.height : ${img.height}");
    print("----------------------------------");
    final AvaApiClient client = await getIt.getAsync<AvaApiClient>();
    final OcrResponse response = await client.vision.ocr(img);
    String responseText = '';
    response.regions.forEach((Region r) {
      r.lines.forEach((Line l) {
        l.words.forEach((Word w) {
          responseText += ' ${w.text}';
        });
      });
    });
    print(responseText);
    client.voice.speak(responseText);
  }

  _listen(Uint8List imageData) async {
    //print("----------------------------------");
    // print(
    //     "...${DateTime.now().millisecond} NEW IMAGE RECEIVED: ${imageData.lengthInBytes} bytes");

    if (DateTime.now().second % 3 == 0 &&
        DateTime.now().millisecond >= 500 &&
        DateTime.now().millisecond <= 600 &&
        !isSpeaking) {
      // final img = imgUtils.decodeImage(imageData);
      print("----------------------------------");
      print("...${DateTime.now()} NEW IMAGE RECEIVED: ${imageData.lengthInBytes} bytes");
      // print("==> img.width : ${img.width} | img.height : ${img.height}");
      print("----------------------------------");
      isSpeaking = true;
      final AvaApiClient client = await getIt.getAsync<AvaApiClient>();
      final OcrResponse response = await client.vision.ocr(imageData);
      String responseText = '';
      response.regions.forEach((Region r) {
        r.lines.forEach((Line l) {
          l.words.forEach((Word w) {
            responseText += ' ${w.text}';
          });
        });
      });
      print(responseText);
      await client.voice.speak(responseText);

      // isSpeaking = false;
    }
  }

  Widget _buildPreviewStream() {
    if (previewStream == null) return Container();
    return Positioned(
      left: 32,
      bottom: 120,
      child: StreamBuilder(
        stream: previewStream.timeout(Duration(milliseconds: 1500)),
        builder: (context, snapshot) {
          print(snapshot);
          if (!snapshot.hasData || snapshot.data == null) return Container();
          List<Uint8List> data = snapshot.data;
          print(
              "...${DateTime.now()} new image received... ${data.last.lengthInBytes} bytes");
          return Image.memory(
            data.last,
            width: 120,
          );
        },
      ),
    );
  }
}
