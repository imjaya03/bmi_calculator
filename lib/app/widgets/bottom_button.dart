import 'package:flutter/material.dart';
import '../constants.dart';

class BottonButton extends StatelessWidget {
  BottonButton({@required this.onPressed, @required this.label});

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Text('$label', style: kLargeButtonTextStyle),
        padding: EdgeInsets.only(bottom: 20.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kBottomContainerColor,
        ),
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
