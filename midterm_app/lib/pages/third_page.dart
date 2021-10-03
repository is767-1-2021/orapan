import 'package:flutter/material.dart';
import 'package:midterm_app/model/medel_hospital.dart';
import 'package:provider/provider.dart';


class ThirdPage extends StatefulWidget {
   @override
  _ThirdPageState createState() => _ThirdPageState();
  }
class _ThirdPageState extends State <ThirdPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('เพิ่มข้อมูลโรงพยาบาล'),
          backgroundColor: Color(0xFF473F97)),
       body: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Consumer<HospitalFormModel>(
                    builder: (context, form, child) {
                      return Text(
                          '${form.hospitalName} ${form.addressName} ${form.phoneNumber} ${form.numberPatient} ${form.numberStaff}');
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/2');
                  },
                  child: Text('กรุณากรอกข้อมูล '),
                ),
              ],
            ),
          ),
       );
   }
}