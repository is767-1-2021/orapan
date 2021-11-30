import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryProvider extends ChangeNotifier {
  late String answer;
  late String answerTemp;
  late String inputFull;
  late String operator;
  late bool calculateMode;
  
  CollectionReference cal_history =
      FirebaseFirestore.instance.collection('calculator_history');

  get result => this.answer;

  set result(value) {
    this.answer = value;
    cal_history
        .add({'answer': answer, 'howto': inputFull + operator + answerTemp});
    notifyListeners();
  }

  get first => this.inputFull;

  set first(value) {
    this.inputFull = value;
    notifyListeners();
  }

  get second => this.answerTemp;

  set second(value) {
    this.answerTemp = value;
    notifyListeners();
  }

  get sign => this.operator;

  set sign(value) {
    this.operator = value;
    notifyListeners();
  }
}