import 'package:ava/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
    @required this.onCaptureTap,
    @required this.onEyeModeChanged,
    @required this.eyeMode,
    @required this.ocrText,
  }) : super(key: key);

  final Function onCaptureTap;
  final Function onEyeModeChanged;
  final ValueNotifier<EyeModes> eyeMode;
  final String ocrText;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
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
                  // Container(
                  //    color: Colors.black12,
                  //  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: eyeMode.value == EyeModes.OCR ? 90.0 : 60.0,
                            height: eyeMode.value == EyeModes.OCR ? 90.0 : 60.0,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Icon(LineAwesomeIcons.font,
                                size: eyeMode.value == EyeModes.OCR ? 56.0 : 24.0,
                                color: eyeMode.value == EyeModes.OCR
                                    ? Theme.of(context).accentColor
                                    : Theme.of(context).primaryColor),
                          ),
                          Container(
                            width: eyeMode.value == EyeModes.OBJECT ? 90.0 : 60.0,
                            height: eyeMode.value == EyeModes.OBJECT ? 90.0 : 60.0,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Icon(LineAwesomeIcons.barcode,
                                size: eyeMode.value == EyeModes.OBJECT ? 56.0 : 24.0,
                                color: eyeMode.value == EyeModes.OBJECT
                                    ? Theme.of(context).accentColor
                                    : Theme.of(context).primaryColor),
                          ),
                          Container(
                            width: eyeMode.value == EyeModes.CART ? 90.0 : 60.0,
                            height: eyeMode.value == EyeModes.CART ? 90.0 : 60.0,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Icon(LineAwesomeIcons.shopping_cart,
                                size: eyeMode.value == EyeModes.CART ? 56.0 : 24.0,
                                color: eyeMode.value == EyeModes.CART
                                    ? Theme.of(context).accentColor
                                    : Theme.of(context).primaryColor),
                          ),
                          Container(
                            width: eyeMode.value == EyeModes.MONEY ? 90.0 : 60.0,
                            height: eyeMode.value == EyeModes.MONEY ? 90.0 : 60.0,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Icon(LineAwesomeIcons.money_bill,
                                size: eyeMode.value == EyeModes.MONEY ? 56.0 : 24.0,
                                color: eyeMode.value == EyeModes.MONEY
                                    ? Theme.of(context).accentColor
                                    : Theme.of(context).primaryColor),
                          ),
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
                    color: Colors.black12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            ocrText,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.white70),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
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
