import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icovid/constants/color_constant.dart';
import 'package:icovid/controllers/hospitel_info_controller.dart';
import 'package:icovid/models/hospital_model.dart';
import 'package:icovid/models/hospital_clas.dart';
import 'package:icovid/models/hospitel_info_class.dart';
import 'package:icovid/pages/hospital_home_page.dart';
import 'package:icovid/services/hospital_service.dart';
import 'package:icovid/services/hospitel_info_service.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';
import 'patient_list_page.dart';

class HostpitelInfoScreen extends StatefulWidget {
  @override
  _HostpitelInfoScreenState createState() => _HostpitelInfoScreenState();
}

class _HostpitelInfoScreenState extends State<HostpitelInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลโรงพยาบาลสนาม'),
        backgroundColor: iBlueColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogInScreen()),
              );
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: HostpitelInfoState(),
    );
  }
}

class HostpitelInfoState extends StatefulWidget {
  @override
  _HostpitelInfoState createState() => _HostpitelInfoState();
}

class _HostpitelInfoState extends State<HostpitelInfoState> {
  final _formKey = GlobalKey<FormState>();
  int? _hospitelNumber;
  String? _hospitelName;
  String? _addressName;
  String? _phoneNumber;
  int? _numberPatient;
  int? _numberStaff;
  int listLength = 0;
  var service = HospitelInfoServices();
  var controller;
  _HostpitelInfoState() {
    controller = HospitelInfoController(service);
  }

  @override
  Widget build(BuildContext context) {
    List<Hospital> _hospitalList = [];
    if (context.read<HospitalFormModel>().hospitalList != null) {
      _hospitalList = context.read<HospitalFormModel>().hospitalList;
      listLength = _hospitalList.length;
    }
    return SingleChildScrollView(
      padding: EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'รหัสโรงพยาบาล',
                icon: Icon(Icons.business),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ใส่รหัสโรงพยาบาล';
                }

                return null;
              },
              onSaved: (value) {
                _hospitelNumber = int.parse(value!);
              },
              initialValue: context.read<HospitalFormModel>().hospitalName,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'ใส่ชื่อโรงพยาบาล',
                icon: Icon(Icons.business),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'ใส่ชื่อโรงพยาบาล';
                }

                return null;
              },
              onSaved: (value) {
                _hospitelName = value;
              },
              initialValue: context.read<HospitalFormModel>().hospitalName,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'ใส่ที่อยู่โรงพยาบาล',
                icon: Icon(Icons.home_filled),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาใส่ที่อยู่โรงพยาลบาล.';
                }
                return null;
              },
              onSaved: (value) {
                _addressName = value;
              },
              initialValue: context.read<HospitalFormModel>().addressName,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'ใส่เบอร์โทรโรงพยาบาล',
                icon: Icon(Icons.ring_volume),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาใส่เบอร์โรงพยาบาล';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              onSaved: (value) {
                _phoneNumber = value;
              },
              initialValue: context.read<HospitalFormModel>().phoneNumber == null? '':context.read<HospitalFormModel>().phoneNumber.toString(),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'ใส่จำนวนคนไข้ที่รองรับได้',
                icon: Icon(Icons.people_rounded),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาใส่จำนวนคนไข้ที่รองรับได้';
                }
                return null;
              },
              onSaved: (value) {
                _numberPatient = int.parse(value!);
              },
              initialValue: context.read<HospitalFormModel>().allQueu == null?'':context.read<HospitalFormModel>().allQueu.toString(),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'ใส่จำนวนเจ้าหน้าที่ที่ปฎิบัตรงาน',
                icon: Icon(Icons.people),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาใส่จำนวนเจ้าหน้าที่ที่ปฎิบัตรงาน';
                }
                return null;
              },
              onSaved: (value) {
                _numberStaff = int.parse(value!);
              },
              initialValue: context.read<HospitalFormModel>().avaliableQueue == null?'':context.read<HospitalFormModel>().avaliableQueue.toString(),
            ),
            Container(
              margin: EdgeInsets.only(top: 250),
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                height: 60,
                color: iBlueColor,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _formKey.currentState!.save();
                      context.read<HospitalFormModel>().hospitalName =
                          _hospitelName;
                      context.read<HospitalFormModel>().addressName =
                          _addressName;
                      context.read<HospitalFormModel>().phoneNumber =
                          _phoneNumber;
                      context.read<HospitalFormModel>().numberPatient =
                          _numberPatient;
                      context.read<HospitalFormModel>().numberStaff =
                          _numberStaff;
                      context.read<HospitalFormModel>().avaliableQueue = 20;
                      context.read<HospitalFormModel>().allQueu = 100;

                      context.read<HospitalFormModel>().hospitalId =listLength + 1;

                      //add to firebase
                      controller.addhospitelInfo(new BHospitel(_hospitelNumber!, _hospitelName!, _addressName!, _phoneNumber!, _numberPatient!, _numberStaff!));

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatientListPage()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'บันทีกข้อมูลโรงพยาบาลสนามของเท่านเรียบร้อยแล้ว')),
                      );
                   
                  }
                },
                child: Text('บันทึก',
                  style: TextStyle(
                    fontSize: 20, 
                    color: 
                    iWhiteColor
                  )
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 10.0),
            //   child: Center(
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         ElevatedButton(
            //           onPressed: () {
            //             if (_formKey.currentState!.validate()) {
                          
            //             }
            //           },
            //           style: ElevatedButton.styleFrom(primary: Colors.green),
            //           child: Text('เพิ่ม'),
            //         ),
            //         ElevatedButton(
            //           onPressed: () {
            //             _formKey.currentState!.reset();
            //           },
            //           style: ElevatedButton.styleFrom(primary: Colors.blue),
            //           child: Text('ล้างข้อมูล'),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}