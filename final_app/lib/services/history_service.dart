import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/model/history_model.dart';

abstract class HistoryServices {
  Future<List<History>> gethistory();
}

class HistoryCalServices extends HistoryServices {
  CollectionReference _ref=FirebaseFirestore.instance.collection('calculator_history');

  @override
  Future<List<History>> gethistory() async {
    QuerySnapshot snapshot =await FirebaseFirestore.instance.collection('calculator_history').get();
    AllHistory history = AllHistory.fromSnapshot(snapshot);
    return history.history;
  }
}