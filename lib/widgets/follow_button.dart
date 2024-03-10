import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  final Function()? onpressed;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final Color textColor;
  const FollowButton(
      {super.key,
      this.onpressed,
      required this.backgroundColor,
      required this.borderColor,
      required this.text,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      child: TextButton(
          onPressed: onpressed,
          child: Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(5)),
            alignment: Alignment.center,
            width: 220,
            height: 27,
            child: Text(
              text,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
