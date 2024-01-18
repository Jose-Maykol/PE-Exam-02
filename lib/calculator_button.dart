import 'package:flutter/material.dart';
import 'package:pe_exam2/colors.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.color,
  });

  final String text;
  final Color? textColor;
  final Color? color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey[200],
      onTap: () => onPressed(),
      child: Ink(
        decoration: BoxDecoration(
          color: color ?? AppColor.surface,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              color: textColor ?? AppColor.fontPrimary,
            ),
          ),
        ),
      ),
    );
  }
}