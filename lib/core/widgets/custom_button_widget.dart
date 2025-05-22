import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.text,
    this.color = Colors.teal,
    required this.onPressed,
    this.fontSize,
  });

  final String text;
  final double? fontSize;

  final Color? color;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      onPressed: onPressed,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomTextWidget(
          text: text,
          textColor: Colors.white,
          fontSize: fontSize ?? 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
