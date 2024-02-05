import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _currentInput = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";

  void _handleClick(String value) {
    setState(() {
      if (value == "C") {
        _clear();
      } else if (value == "=") {
        _calculate();
      } else {
        _currentInput += value;
      }
    });
  }

  void _clear() {
    _output = "0";
    _currentInput = "";
    _num1 = 0;
    _num2 = 0;
    _operand = "";
  }

  void _calculate() {
    if (_currentInput.isNotEmpty && _operand.isNotEmpty) {
      _num2 = double.parse(_currentInput);
      switch (_operand) {
        case "+":
          _output = (_num1 + _num2).toString();
          break;
        case "-":
          _output = (_num1 - _num2).toString();
          break;
        case "*":
          _output = (_num1 * _num2).toString();
          break;
        case "/":
          if (_num2 != 0) {
            _output = (_num1 / _num2).toString();
          } else {
            _output = "Error";
          }
          break;
      }
      _num1 = double.parse(_output);
      _currentInput = "";
      _operand = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _output,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: 16,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              List<String> buttons = [
                "7",
                "8",
                "9",
                "/",
                "4",
                "5",
                "6",
                "*",
                "1",
                "2",
                "3",
                "-",
                "C",
                "0",
                "=",
                "+"
              ];
              return ElevatedButton(
                onPressed: () => _handleClick(buttons[index]),
                child: Text(
                  buttons[index],
                  style: TextStyle(fontSize: 20),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
