import 'package:flutter/material.dart';

class CustomBigButton extends StatelessWidget {
  final String text;
  final Function onTap;

  CustomBigButton({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 60,
        width: deviceSize.width,
        decoration: BoxDecoration(
          color: Color(0xff80CFA9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
