import 'package:ava/presentation/core/app_theme.dart';
import 'package:ava/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
    @required this.onEyeModeChanged,
    @required this.eyeMode,
    @required this.ocrText,
  }) : super(key: key);

  final Function onEyeModeChanged;
  final ValueNotifier<EyeModes> eyeMode;
  final String ocrText;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (ocrText.isNotEmpty)
            SizedBox(
              height: 50,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
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
          SizedBox(
            height: 120,
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
                          width: eyeMode.value == EyeModes.TEXT ? 100.0 : 85.0,
                          height: eyeMode.value == EyeModes.TEXT ? 100.0 : 85.0,
                          decoration: BoxDecoration(
                            color: eyeMode.value == EyeModes.TEXT
                                ? AppTheme.fuchsia.shade700
                                : AppTheme.violet.shade700,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: GestureDetector(
                            child: Icon(LineAwesomeIcons.file,
                                size: eyeMode.value == EyeModes.TEXT ? 70.0 : 50.0,
                                color: Theme.of(context).backgroundColor),
                            onTap: () {
                              eyeMode.value = EyeModes.TEXT;
                              onEyeModeChanged?.call();
                            },
                          ),
                        ),
                        Container(
                          width: eyeMode.value == EyeModes.OBJECT ? 100.0 : 85.0,
                          height: eyeMode.value == EyeModes.OBJECT ? 100.0 : 85.0,
                          decoration: BoxDecoration(
                            color: eyeMode.value == EyeModes.OBJECT
                                ? AppTheme.fuchsia.shade700
                                : AppTheme.violet.shade700,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: GestureDetector(
                            child: Icon(LineAwesomeIcons.barcode,
                                size: eyeMode.value == EyeModes.OBJECT ? 70.0 : 50.0,
                                color: Theme.of(context).backgroundColor),
                            onTap: () {
                              eyeMode.value = EyeModes.OBJECT;
                              onEyeModeChanged?.call();
                            },
                          ),
                        ),
                        Container(
                          width: eyeMode.value == EyeModes.BANK_NOTE ? 100.0 : 85.0,
                          height: eyeMode.value == EyeModes.BANK_NOTE ? 100.0 : 85.0,
                          decoration: BoxDecoration(
                            color: eyeMode.value == EyeModes.BANK_NOTE
                                ? AppTheme.fuchsia.shade700
                                : AppTheme.violet.shade700,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: GestureDetector(
                            child: Icon(LineAwesomeIcons.money_bill,
                                size: eyeMode.value == EyeModes.BANK_NOTE ? 70.0 : 50.0,
                                color: Theme.of(context).backgroundColor),
                            onTap: () {
                              eyeMode.value = EyeModes.BANK_NOTE;
                              onEyeModeChanged?.call();
                            },
                          ),
                        ),
                        Container(
                          width: eyeMode.value == EyeModes.DOCUMENT ? 100.0 : 85.0,
                          height: eyeMode.value == EyeModes.DOCUMENT ? 100.0 : 85.0,
                          decoration: BoxDecoration(
                            color: eyeMode.value == EyeModes.DOCUMENT
                                ? AppTheme.fuchsia.shade700
                                : AppTheme.violet.shade700,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: GestureDetector(
                            child: Icon(LineAwesomeIcons.shopping_cart,
                                size: eyeMode.value == EyeModes.DOCUMENT ? 70.0 : 50.0,
                                color: Theme.of(context).backgroundColor),
                            onTap: () {
                              eyeMode.value = EyeModes.DOCUMENT;
                              onEyeModeChanged?.call();
                            },
                          ),
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
    );
  }
}

/*
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
*/
