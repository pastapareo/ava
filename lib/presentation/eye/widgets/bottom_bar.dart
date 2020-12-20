import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
    @required this.onCaptureTap,
  }) : super(key: key);

  final Function onCaptureTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
              onTap: onCaptureTap,
              child: Icon(
                Icons.camera,
                color: Colors.cyan,
              ),
            ),
            Text("Add")
          ],
        ),
      ),
    );
  }
}
