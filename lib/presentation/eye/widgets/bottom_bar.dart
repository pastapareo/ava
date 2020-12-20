import 'package:ava/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
    @required this.onCaptureTap,
    @required this.eyeMode,
    @required this.onEyeModeChanged,
  }) : super(key: key);

  final Function onCaptureTap;
  final ValueNotifier<EyeModes> eyeMode;
  final Function onEyeModeChanged;

  @override
  Widget build(BuildContext context) {
    print(eyeMode);
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          print('Hello');
        },
        /*     onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            print('Swipe right');
          } else if (details.delta.dx < 0) {
            print('Swipe left');
          }
        },*/
        onHorizontalDragEnd: (dragEndDetails) {
          if (dragEndDetails.primaryVelocity > 0) {
            // Page forwards
            print('Move page forwards');
            eyeMode.value = nextMode(eyeMode.value);
            onEyeModeChanged?.call();
            // _goForward();
          } else if (dragEndDetails.primaryVelocity < 0) {
            // Page backwards
            print('Move page backwards');
            eyeMode.value = previousMode(eyeMode.value);
            onEyeModeChanged?.call();
            // _goBack();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Stack(
                children: [
                  Container(
                    color: Colors.black12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.cake,
                              size: 32.0,
                              color: eyeMode.value == EyeModes.OCR
                                  ? Colors.pink
                                  : Colors.blue),
                          Icon(Icons.zoom_out,
                              size: 32.0,
                              color: eyeMode.value == EyeModes.OBJECT
                                  ? Colors.pink
                                  : Colors.blue),
                          Icon(Icons.party_mode,
                              size: 32.0,
                              color: eyeMode.value == EyeModes.MONEY
                                  ? Colors.pink
                                  : Colors.blue),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
              child: Stack(
                children: [
                  Container(
                    color: Colors.pink,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.cake,
                            size: 24.0,
                          ),
                          Icon(
                            Icons.zoom_out,
                            size: 24.0,
                          ),
                          Icon(
                            Icons.party_mode,
                            size: 24.0,
                          ),
                          Icon(
                            Icons.mouse,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
