import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:ava/infrastructure/core/api.dart';
import 'package:ava/infrastructure/vision/models/line.dart';
import 'package:ava/infrastructure/vision/models/ocr_response.dart';
import 'package:ava/infrastructure/vision/models/region.dart';
import 'package:ava/infrastructure/vision/models/word.dart';
import 'package:ava/injection.dart';
import 'package:ava/presentation/eye/widgets/bottom_bar.dart';
import 'package:ava/utils/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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
  ValueNotifier<EyeModes> _eyeMode = ValueNotifier(EyeModes.OCR);

  PictureController _pictureController = new PictureController();

  StreamSubscription<Uint8List> previewStreamSub;
  Stream<Uint8List> previewStream;
  Uint8List imgData;

  bool isSpeaking = false;
  String _response = '';

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
                //  setState(() {
                //    previewStream = imageStream;
                //  });

                if (_eyeMode.value == EyeModes.OCR) {
                  imageStream.listen((Uint8List imageData) => _listen(imageData));
                }
              },
            ),
          ),
          BottomBar(
            onCaptureTap: _takePhoto,
            eyeMode: _eyeMode,
            onEyeModeChanged: () {
              if (_eyeMode.value == EyeModes.OCR) {
                _eyeMode.value = EyeModes.OCR;
              } else if (_eyeMode.value == EyeModes.OBJECT) {
                _eyeMode.value = EyeModes.OBJECT;
                // isSpeaking = false;
                _checkProduct();
              } else if (_eyeMode.value == EyeModes.MONEY) {
                _eyeMode.value = EyeModes.MONEY;
                isSpeaking = false;
                _checkMoney();
              } else if (_eyeMode.value == EyeModes.CART) {
                _eyeMode.value = EyeModes.CART;
                _showCart();
              }
              setState(() {});
              print(_eyeMode.value);
            },
            ocrText: _response,
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
    isSpeaking = true;
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
      print("----------------------------------");
      print('OCR RESPONSE: $responseText');
      print("----------------------------------");
      if (responseText.isNotEmpty) {
        await client.voice.speak(responseText);
      } else {
        isSpeaking = false;
      }
    }
  }

  _checkMoney() async {
    isSpeaking = true;
    final AvaApiClient client = await getIt.getAsync<AvaApiClient>();
    print('Start ${DateTime.now()}');
    Timer(const Duration(seconds: 2), () async {
      print('Speak ${DateTime.now()}');
      await client.voice.speak('\$100.00');
      setState(() {
        _response = '\$100.00';
      });
    });
  }

  _checkProduct() async {
    isSpeaking = false;
    final AvaApiClient client = await getIt.getAsync<AvaApiClient>();
    print('Start ${DateTime.now()}');
    Timer(const Duration(seconds: 1), () async {
      print('Speak ${DateTime.now()}');
      await client.voice.speak('Swiss Miss hot cocoa mix');
      setState(() {
        _response = 'Swiss Miss hot cocoa mix';
      });
      Timer(const Duration(seconds: 3), () async {
        print('Speak ${DateTime.now()}');
        await client.voice.speak('Swiss Miss Marshmallow 28 grams');
        setState(() {
          _response = 'Swiss Miss Marshmallow 28 grams';
        });
        Timer(const Duration(seconds: 2), () async {
          print('Speak ${DateTime.now()}');
          await client.voice.speak(
              'Swiss Miss hot cocoa mix was added to your cart. Your total balance is now \$2.45');
          setState(() {
            _response =
                'Swiss Miss hot cocoa mix was added to your cart. Your total balance is now \$2.45';
          });
        });
      });
    });
  }

  _showCart() async {
    isSpeaking = false;
    AwesomeDialog(
        context: context,
        animType: AnimType.LEFTSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.INFO,
        title: 'Your Cart',
        desc: 'You\'re about to pay \$2.44',
        body: Center(
          child: Column(
            children: [
              Text('Checkout two items for \$2.44'),
              Image.network('https://blog.minhazav.dev/images/post14_image1.png'),
            ],
          ),
        ),
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
        onDissmissCallback: () {
          debugPrint('Dialog Dissmiss from callback');
        })
      ..show();
    final AvaApiClient client = await getIt.getAsync<AvaApiClient>();
    await client.voice
        .speak('You\'re about to checkout 2 items with a total amount of \$2.44');
    setState(() {
      _response = 'You\'re about to checkout 2 items with a total amount of \$2.44';
    });

    // await client.ffdc.getBalance();
    // await client.ffdc.createPayment('0543123467001', '0543123467030', 'Peter Parker');
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
