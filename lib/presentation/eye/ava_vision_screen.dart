import 'dart:async';
import 'dart:typed_data';

import 'package:ava/data/data.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';

import '../../infrastructure/vision/models/line.dart';
import '../../infrastructure/vision/models/ocr_response.dart';
import '../../infrastructure/vision/models/region.dart';
import '../../infrastructure/vision/models/word.dart';
import '../../infrastructure/vision/vision.dart';
import '../../infrastructure/voice/voice.dart';
import '../../injection.dart';
import '../../utils/constants.dart';
import 'widgets/bottom_bar.dart';

class AvaVisionScreen extends StatefulWidget {
  AvaVisionScreen({Key key}) : super(key: key);

  @override
  _AvaVisionScreenState createState() => _AvaVisionScreenState();
}

class _AvaVisionScreenState extends State<AvaVisionScreen> {
  ValueNotifier<Size> _photoSize = ValueNotifier(null);
  ValueNotifier<Sensors> _sensor = ValueNotifier(Sensors.BACK);
  ValueNotifier<CaptureModes> _captureMode = ValueNotifier(CaptureModes.PHOTO);
  ValueNotifier<EyeModes> _eyeMode = ValueNotifier(EyeModes.TEXT);

  PictureController _pictureController = new PictureController();

  VisionApiClient visionClient;
  VoiceApiClient voiceClient;

  StreamSubscription<Uint8List> previewStreamSub;
  Stream<Uint8List> previewStream;
  Uint8List imgData;

  bool _stopScanning = false;
  String _response = '';

  @override
  void initState() {
    super.initState();
    _initializeApiClients();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          SafeArea(
            bottom: false,
            child: _camera(context),
          ),
          BottomBar(
            eyeMode: _eyeMode,
            onEyeModeChanged: () => _onEyeModeChanged(),
            ocrText: _response,
          ),
        ],
      ),
    );
  }

  _initializeApiClients() async {
    visionClient = await getIt.getAsync<VisionApiClient>();
    voiceClient = await getIt.getAsync<VoiceApiClient>();
  }

  _camera(BuildContext context) {
    return CameraAwesome(
      captureMode: _captureMode,
      photoSize: _photoSize,
      sensor: _sensor,
      imagesStreamBuilder: (imageStream) {
        imageStream.listen((Uint8List imageData) => _readText(imageData));
      },
    );
  }

  _onEyeModeChanged() {
    if (_eyeMode.value == EyeModes.TEXT) {
      _eyeMode.value = EyeModes.TEXT;
      _speak('Scan text');
    } else if (_eyeMode.value == EyeModes.OBJECT) {
      _eyeMode.value = EyeModes.OBJECT;
      _speak('Scan object');
      _mockProduct();
    } else if (_eyeMode.value == EyeModes.BANK_NOTE) {
      _eyeMode.value = EyeModes.BANK_NOTE;
      _speak('Scan bank note');
      _mockBankNote();
    } else if (_eyeMode.value == EyeModes.DOCUMENT) {
      _eyeMode.value = EyeModes.DOCUMENT;
      _speak('Scan document');
      //_showCart();
    }
    setState(() {});
    print(_eyeMode.value);
  }

  _readText(Uint8List imageData) async {
    if (DateTime.now().second % 3 == 0 &&
        DateTime.now().millisecond >= 500 &&
        DateTime.now().millisecond <= 600 &&
        !_stopScanning) {
      print("----------------------------------");
      print("...${DateTime.now()} NEW IMAGE RECEIVED: ${imageData.lengthInBytes} bytes");
      print("----------------------------------");

      _stopScanning = true;

      final String ocrText = await _processOcr(imageData);
      if (ocrText.isNotEmpty) {
        _speak(ocrText);
      } else {
        _stopScanning = false;
      }
    }
  }

  Future<String> _processOcr(imageData) async {
    final OcrResponse response = await visionClient.vision.ocr(imageData);

    String responseText = '';
    response.regions.forEach((Region r) {
      r.lines.forEach((Line l) {
        l.words.forEach((Word w) {
          responseText += ' ${w.text}';
        });
      });
    });

    // Remove letters -  for barcode
    if (_eyeMode.value == EyeModes.OBJECT) {
      print("-------------- BARCODE --------------------");
      responseText = responseText.replaceAll(new RegExp(r'[^0-9]'), '');
    }

    print("----------------------------------");
    print('OCR RESPONSE: $responseText');
    print("----------------------------------");

    return responseText;
  }

  _speak(String text) async {
    await voiceClient.tts.speak(text);

    setState(() {
      _response = text;
    });

    Timer(const Duration(seconds: 2), () async {
      _removeResponse();
    });
  }

  _removeResponse() {
    setState(() {
      _response = '';
    });
  }

  _mockBankNote() async {
    _stopScanning = true;

    Timer(const Duration(seconds: 3), () async {
      _speak('\$100');
    });
  }

  _mockProduct() async {
    _stopScanning = true;

    Timer(const Duration(seconds: 3), () async {
      _speak(swiss_miss);

      Timer(const Duration(seconds: 3), () async {
        _stopScanning = false;
      });
    });
  }

  /*
  _checkProduct() async {
    _stopScanning = false;
    final VisionApiClient visionClient = await getIt.getAsync<VisionApiClient>();
    final VoiceApiClient voiceClient = await getIt.getAsync<VoiceApiClient>();
    print('Start ${DateTime.now()}');
    Timer(const Duration(seconds: 1), () async {
      print('Speak ${DateTime.now()}');
      await voiceClient.tts.speak('Swiss Miss hot cocoa mix');
      setState(() {
        _response = 'Swiss Miss hot cocoa mix';
      });
      Timer(const Duration(seconds: 3), () async {
        print('Speak ${DateTime.now()}');
        await voiceClient.tts.speak('Swiss Miss Marshmallow 28 grams');
        setState(() {
          _response = 'Swiss Miss Marshmallow 28 grams';
        });
        Timer(const Duration(seconds: 2), () async {
          print('Speak ${DateTime.now()}');
          await voiceClient.tts.speak(
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
    _stopScanning = false;
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
    final VisionApiClient visionClient = await getIt.getAsync<VisionApiClient>();
    final VoiceApiClient voiceClient = await getIt.getAsync<VoiceApiClient>();
    await voiceClient.tts
        .speak('You\'re about to checkout 2 items with a total amount of \$2.44');
    setState(() {
      _response = 'You\'re about to checkout 2 items with a total amount of \$2.44';
    });

    // await client.ffdc.getBalance();
    // await client.ffdc.createPayment('0543123467001', '0543123467030', 'Peter Parker');
  } */
}
