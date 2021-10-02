import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/model/model_hostpital_info_form.dart';

class HostpitalInfoScreen extends StatefulWidget {
   @override
  _HostpitalInfoScreenState createState() => _HostpitalInfoScreenState();
  }
class _HostpitalInfoScreenState extends State <HostpitalInfoScreen> {

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
                  child: Consumer<HospitalinfoFormModel>(
                    builder: (context, form, child) {
                      return Text(
                          '${form.hospitalName} ${form.addressName} ${form.phoneNumber} ${form.numberPatient} ${form.numberStaff}');
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/4');
                  },
                  child: Text('กรุณากรอกข้อมูล '),
                ),
              ],
            ),
          ),
       );
   }
}