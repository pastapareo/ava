import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image/image.dart' as imgUtils;

import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ValueNotifier<Size> _photoSize = ValueNotifier(null);
  ValueNotifier<Sensors> _sensor = ValueNotifier(Sensors.BACK);
  ValueNotifier<CaptureModes> _captureMode = ValueNotifier(CaptureModes.PHOTO);

  PictureController _pictureController = new PictureController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SafeArea(
            bottom: false,
            child: CameraAwesome(
              captureMode: _captureMode,
              photoSize: _photoSize,
              sensor: _sensor,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FlatButton(
              onPressed: () => {},
              color: Colors.transparent,
              padding: EdgeInsets.all(10.0),
              child: Column(
                // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  GestureDetector(
                    onTap: _takePhoto,
                    child: Icon(
                      Icons.camera,
                      color: Colors.cyan,
                    ),
                  ),
                  Text("Add")
                ],
              ),
            ),
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
    final img = imgUtils.decodeImage(file.readAsBytesSync());
    print("==> img.width : ${img.width} | img.height : ${img.height}");
    print("----------------------------------");
  }
}
