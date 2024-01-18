import 'package:flutter/material.dart';
import 'package:pe_exam2/colors.dart';

class CalculatorInfo {
  final String text;
  final Color? textColor;
  final Color? color;

  CalculatorInfo({
    required this.text,
    this.textColor,
    this.color,
  });
}

List<CalculatorInfo> calculatorNumbersButtons = [
  CalculatorInfo(text: '7'),
  CalculatorInfo(text: '8'),
  CalculatorInfo(text: '9'),
  CalculatorInfo(text: '4'),
  CalculatorInfo(text: '5'),
  CalculatorInfo(text: '6'),
  CalculatorInfo(text: '1'),
  CalculatorInfo(text: '2'),
  CalculatorInfo(text: '3'),
  CalculatorInfo(text: '+/-'),
  CalculatorInfo(text: '0'),
  CalculatorInfo(text: '.'),
];

List<CalculatorInfo> calculatorOperationsButtons = [
  CalculatorInfo(text: '÷'),
  CalculatorInfo(text: 'x'),
  CalculatorInfo(text: '-'),
  CalculatorInfo(text: '+'),
  CalculatorInfo(text: '=', color: AppColor.secondary, textColor: Colors.white),
];