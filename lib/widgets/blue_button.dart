import 'package:circlify/utils/colors.dart';
import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  final String title;
  final VoidCallback onpress;

  const BlueButton({super.key, required this.title, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 50,
          width: 500,
          alignment: Alignment.center,
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
                color: blueColor,
                spreadRadius: 2,
                blurStyle: BlurStyle.inner,
                blurRadius: 20)
          ], color: blueColor, borderRadius: BorderRadius.circular(20)),
          child: Text(
            title,
            style: const TextStyle(
                color: primaryColor, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
