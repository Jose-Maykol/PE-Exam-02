import 'package:flutter/material.dart';
import 'package:pe_exam2/calculator_button.dart';
import 'package:pe_exam2/calculator_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Calculator> {
  String operation = '';
  bool calculated = false;

  void onDigitPress(String digit) {
  setState(() {
    if (calculated && digit != '=') {
      calculated = false;
      operation = digit;
    } else if (calculated && digit == '=') {
      // ---
    } else {
      operation += digit;
    }
  });
}

void calculate() {
  RegExp regex = RegExp(r'(\d+)\s*([+\-x÷])\s*(\d+)');
  Match? match = regex.firstMatch(operation);
  if (match != null) {
    String first = match.group(1) as String;
    String operator = match.group(2) as String;
    String second = match.group(3) as String;
    String result = '';
    switch (operator) {
      case '+':
        result = (double.parse(first) + double.parse(second)).toString();
        break;
      case '-':
        result = (double.parse(first) - double.parse(second)).toString();
        break;
      case 'x':
        result = (double.parse(first) * double.parse(second)).toString();
        break;
      case '÷':
        result = (double.parse(first) / double.parse(second)).toString();
        break;
    }
    
    setState(() {
      operation = result.endsWith('.0') ? result.substring(0, result.length - 2) : result;
      calculated = true;
    });
  } else {
    setState(() {
      operation = '';
      calculated = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  operation,
                  style: const TextStyle(
                    fontSize: 60,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10
                      ),
                      itemBuilder: (context, index) {
                        final buttonInfo = calculatorNumbersButtons[index];
                        return CalculatorButton(
                          onPressed: () {
                            if (buttonInfo.text == '+/-') {
                              onDigitPress('-');
                            } else {
                              onDigitPress(buttonInfo.text);
                            }
                          },
                          text: buttonInfo.text,
                          color: buttonInfo.color,
                        );
                      },
                      itemCount: calculatorNumbersButtons.length,
                    )
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.17,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10
                      ),
                      itemBuilder: (context, index) {
                        final buttonInfo = calculatorOperationsButtons[index];
                        return CalculatorButton(
                          onPressed: () {
                            if (buttonInfo.text == '=') {
                              onDigitPress(buttonInfo.text);
                              calculate();
                            } if (buttonInfo.text == '+/-') {
                              onDigitPress('-');
                            } else {
                              onDigitPress(buttonInfo.text);
                            }
                          },
                          text: buttonInfo.text,
                          color: buttonInfo.color,
                          textColor: buttonInfo.textColor,
                        );
                      },
                      itemCount: calculatorOperationsButtons.length,
                    )
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
