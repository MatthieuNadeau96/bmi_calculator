import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  final text;
  bool selected;
  Function onTap;
  GenderButton({this.text, this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 125,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: selected ? themeData.primaryColor : themeData.canvasColor,
          border:
              selected ? null : Border.all(width: 2.0, color: Colors.grey[300]),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: selected ? Colors.white : Colors.grey, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
