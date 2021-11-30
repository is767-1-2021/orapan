import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_app/model/history_model.dart';
import 'package:final_app/model/history_provider.dart';


class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  late String answer;
  late String answerTemp;
  late String inputFull;
  late String operator;
  late bool calculateMode;

  @override
  void initState() {
    answer = "0";
    operator = "";
    answerTemp = "";
    inputFull = "";
    calculateMode = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade800,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        elevation: 1,
      ),
      body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[buildAnswerWidget(),
            buildNumPadWidget()
            ],
          )),
    );
  }

  Widget buildAnswerWidget() {
    return Expanded(child: Container(
        padding: EdgeInsets.all(16),
        color: Colors.blueGrey.shade800,
        child: Align(
            alignment: Alignment.bottomRight,
            child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min, 
                children: <Widget>[
                  Text(inputFull + " " + operator, 
                  style: TextStyle(fontSize: 18)),
                  Text(answer,
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold))
                  ]
                )
              )
            )
          );
        }

  Widget buildNumPadWidget() {
    return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child : Row(
                children: [
            Text(
              "MC", style: TextStyle(
                    fontSize: 15,
                    color: Colors.white),
            ),
            Text(
              "MR", style: TextStyle(
                    fontSize: 15,
                    color: Colors.white),
            ),
            Text(
              "M+", style: TextStyle(
                    fontSize: 15,
                    color: Colors.white),
            ),
            Text(
              "M-", style: TextStyle(
                    fontSize: 15,
                    color: Colors.white),
            ),
            Text(
              "MS", style: TextStyle(
                    fontSize: 15,
                    color: Colors.white),
                  )
                ],
             ),
        ),
        Container(
          color: Colors.blueGrey.shade800,
          child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(children: <Widget>[
              buildNumberButton("%", numberButton: false, onTap: () {} ),
              buildNumberButton("CE", numberButton: false, onTap: () {
                clearAnswer();
              }),
              buildNumberButton("C", numberButton: false, onTap: () {
                clearAll();
              }),
              buildNumberButton("⌫", numberButton: false, onTap: () {
                removeAnswerLast();
              }),
            ]),
            Row(children: <Widget>[
              buildNumberButton("1/x", numberButton: false, onTap: () {}),
              buildNumberButton("X²", numberButton: false, onTap: () {}),
              buildNumberButton("√x", numberButton: false, onTap: () {}),
              buildNumberButton("÷", numberButton: false, onTap: () {
                addOperatorToAnswer("÷");
              }),
            ]),
            Row(children: <Widget>[
              buildNumberButton("7", onTap: () {
                addNumberToAnswer(7);
              }),
              buildNumberButton("8", onTap: () {
                addNumberToAnswer(8);
              }),
              buildNumberButton("9", onTap: () {
                addNumberToAnswer(9);
              }),
              buildNumberButton("×", numberButton: false, onTap: () {
                addOperatorToAnswer("×");
              }),
            ]),
            Row(children: <Widget>[
              buildNumberButton("4", onTap: () {
                addNumberToAnswer(4);
              }),
              buildNumberButton("5", onTap: () {
                addNumberToAnswer(5);
              }),
              buildNumberButton("6", onTap: () {
                addNumberToAnswer(6);
              }),
              buildNumberButton("−", numberButton: false, onTap: () {
                addOperatorToAnswer("-");
              }),
            ]),
            Row(children: <Widget>[
              buildNumberButton("1", onTap: () {
                addNumberToAnswer(1);
              }),
              buildNumberButton("2", onTap: () {
                addNumberToAnswer(2);
              }),
              buildNumberButton("3", onTap: () {
                addNumberToAnswer(3);
              }),
              buildNumberButton("+", numberButton: false, onTap: () {
                addOperatorToAnswer("+");
              }),
            ]),
            Row(children: <Widget>[
              buildNumberButton("±", numberButton: false, onTap: () {
                toggleNegative();
              }),
              buildNumberButton("0", onTap: () {
                addNumberToAnswer(0);
              }),
              buildNumberButton(".", numberButton: false, onTap: () {
                addDotToAnswer();
              }),
              buildNumberButton("=", numberButton: false, onTap: () {
                calculate();
              }),
            ]),
          ],
        ))
       ]
    );
  }

  void toggleNegative() {
    setState(() {
      if (answer.contains("-")) {
        answer = answer.replaceAll("-", "");
      } else {
        answer = "-" + answer;
      }
    });
  }

  void clearAnswer() {
    setState(() {
      answer = "0";
    });
  }

  void clearAll() {
    setState(() {
      answer = "0";
      inputFull = "";
      calculateMode = false;
      operator = "";
    });
  }


  void calculate() {
    setState(() {
      if (calculateMode) {
        bool decimalMode = false;
        double value = 0;
        if (answer.contains(".") || answerTemp.contains(".")) {
          decimalMode = true;
        }

        if (operator == "+") {
          value = (double.parse(answerTemp) + double.parse(answer));
        } else if (operator == "-") {
          value = (double.parse(answerTemp) - double.parse(answer));
        } else if (operator == "×") {
          value = (double.parse(answerTemp) * double.parse(answer));
        } else if (operator == "÷") {
          value = (double.parse(answerTemp) / double.parse(answer));
        }

        if (!decimalMode) {
          answer = value.toInt().toString();
        } else {
          answer = value.toString();
        }

        calculateMode = false;
        operator = "";
        answerTemp = "";
        inputFull = "";
      }
    });
  }

  void addOperatorToAnswer(String op) {
    setState(() {
      if (answer != "0" && !calculateMode) {
        calculateMode = true;
        answerTemp = answer;
        inputFull += operator + " " + answerTemp;
        operator = op;
        answer = "0";
      } else if (calculateMode) {
        if (answer.isNotEmpty) {
          calculate();
          answerTemp = answer;
          inputFull = "";
          operator = "";
        } else {
          operator = op;
        }
      }
    });
  }

  void addDotToAnswer() {
    setState(() {
      if (!answer.contains(".")) {
        answer = answer + ".";
      }
    });
  }

  void addNumberToAnswer(int number) {
    setState(() {
      if (number == 0 && answer == "0") {
      }
      else if (number != 0 && answer == "0") {
        answer = number.toString();
      }
      else {
        answer += number.toString();
      }
    });
  }

  void removeAnswerLast() {
    if (answer == "0") {
    } else {
      setState(() {
        if (answer.length > 1) {
          answer = answer.substring(0, answer.length - 1);
          if (answer.length == 1 && (answer == "." || answer == "-")) {
            answer = "0";
          }
        } else {
          answer = "0";
        }
      });
    }
  }

  Widget buildNumberButton(String str, { @required Function()?onTap, bool numberButton = true}) {
    Widget widget;
    if (numberButton) {
      widget = Container(
          margin: EdgeInsets.all(1),
          child: Material(
              color: Colors.white,
              child: InkWell(
                  onTap: onTap, splashColor: Colors.blue,
                  child: Container(
                      height: 70,
                      child: Center(
                          child: Text(str,
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold)))))));
    } else {
      widget = Container(
          margin: EdgeInsets.all(1),
          child: Material(
              color: Colors.blueGrey,
              child: InkWell(onTap: onTap,
                  splashColor: Colors.blue,
                  child: Container(
                      height: 70,
                      child: Center(
                          child: Text(str,
                              style: TextStyle(
                                  fontSize: 28)))))));
    }

    return Expanded(child: widget);
  }
}