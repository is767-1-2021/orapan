import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  final String number;
  final String equal;

  History(this.number, this.equal);

  factory History.fromJson(
    Map<String, dynamic> json,
  ) {
    return History(
      json['number'] as String,
      json['equal'] as String,
    );
  }
}

class AllHistory {
  final List<History> history;
  AllHistory(this.history);

  factory AllHistory.fromJson(List<dynamic> json) {
    List<History> history;

    history = json.map((index) => History.fromJson(index)).toList();
    
    return AllHistory(history);
  }

  factory AllHistory.fromSnapshot(QuerySnapshot s) {
    List<History> history = s.docs.map((DocumentSnapshot ds) {
      return History.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllHistory(history);
  }
}