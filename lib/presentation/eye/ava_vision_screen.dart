import 'dart:async';
import 'dart:typed_data';

import 'package:ava/data/data.dart';
import 'package:ava/presentation/core/app_theme.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
      _mockAddItem();
    } else if (_eyeMode.value == EyeModes.BANK_NOTE) {
      _eyeMode.value = EyeModes.BANK_NOTE;
      _speak('Scan bank note');
      _mockBankNote();
    } else if (_eyeMode.value == EyeModes.DOCUMENT) {
      _eyeMode.value = EyeModes.DOCUMENT;
      _speak('Checkout cart');
      _mockCart();
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
      _speak('\$20.00');
    });
  }

  _mockAddItem() async {
    _stopScanning = true;

    Timer(const Duration(seconds: 4), () async {
      _speak(swiss_miss_barcode);

      Timer(const Duration(seconds: 3), () async {
        Alert(
          context: context,
          type: AlertType.none,
          title: 'Add to cart',
          content: Column(
            children: [
              Image.asset('assets/swissmiss.png'),
              SizedBox(
                height: 20,
              ),
              Text(
                swiss_miss_text,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          alertAnimation: FadeAlertAnimation,
          style: cartStyle,
          buttons: [
            DialogButton(
              child: Text(
                "No",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {},
              width: 120,
            ),
            DialogButton(
              child: Text(
                "Yes",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => {},
              width: 120,
            )
          ],
        ).show();

        Timer(const Duration(seconds: 5), () async {
          _speak(add_to_cart);

          Timer(const Duration(seconds: 5), () async {
            Navigator.pop(context);
            _mockAddToCart(context);
          });
        });
      });
    });
  }

  _mockAddToCart(context) {
    _speak(swiss_miss_add_to_cart);

    Timer(const Duration(seconds: 4), () async {
      Alert(
        context: context,
        type: AlertType.success,
        title: 'Added to cart',
        alertAnimation: FadeAlertAnimation,
        style: cartStyle,
        buttons: [
          DialogButton(
            child: Text(
              "No",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {},
            width: 120,
          ),
          DialogButton(
            child: Text(
              "Yes",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => {},
            width: 120,
          )
        ],
      ).show();

      Timer(const Duration(seconds: 7), () async {
        Navigator.pop(context);
      });
    });
  }

  _mockCart() async {
    _stopScanning = true;

    Timer(const Duration(seconds: 4), () async {
      _speak(checkout_cart_speak);

      Alert(
        context: context,
        type: AlertType.none,
        title: 'Your Cart',
        content: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset('assets/qrcode.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              checkout_cart_text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        alertAnimation: FadeAlertAnimation,
        style: cartStyle,
        buttons: [
          DialogButton(
            child: Text(
              "No",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {},
            width: 120,
          ),
          DialogButton(
            child: Text(
              "Yes",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => {},
            width: 120,
          )
        ],
      ).show();

      Timer(const Duration(seconds: 10), () async {
        Navigator.pop(context);
        _speak(checkout_success);
      });
    });
  }

  Widget FadeAlertAnimation(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return Align(
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }

  var cartStyle = AlertStyle(
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: true,
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: Colors.blueGrey,
        ),
      ),
      backgroundColor: AppTheme.nearWhite,
      descStyle: TextStyle(
        color: AppTheme.charcoal,
        fontSize: 16.0,
      ),
      titleStyle: TextStyle(
        color: AppTheme.violet,
        fontSize: 25.0,
      ),

      // constraints: BoxConstraints.expand(width: 300),
      //First to chars "55" represents transparency of color
      // overlayColor: AppTheme.gray,
      alertElevation: 0,
      alertAlignment: Alignment.center);
}
