import 'package:flutter/material.dart';

class HospitalinfoFormModel extends ChangeNotifier {
  String? _hospitalName;
  String? _addressName;
  int? _phoneNumber;
  int? _numberPatient;
  int? _numberStaff;


  String? get hospitalName => this._hospitalName;

  set hospitalName(String? value) {
    this._hospitalName = value;
    notifyListeners();
  }

  get addressName => this._addressName;

  set addressName(value) {
    this._addressName = value;
    notifyListeners();
  }

  get phoneNumber=> this._phoneNumber;

  set phoneNumber(value) {
    this._phoneNumber = value;
    notifyListeners();
  }

  get numberPatient => this._numberPatient;

  set numberPatient(value) {
    this._numberPatient = value;
    notifyListeners();
  }
   get numberStaff => this._numberStaff;

  set numberStaff(value) {
    this._numberStaff = value;
    notifyListeners();
  }
}