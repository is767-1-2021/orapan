import 'package:flutter/material.dart';

class HostpitalInfoScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('เพิ่มข้อมูลโรงพยาบาล'),
      backgroundColor: Color(0xFF473F97)
    ),
    body: MyCustomForm(),
   );
  }
}
class MyCustomForm extends StatefulWidget{
  @override
  _MyCustomFormState createState () => _MyCustomFormState();
  }

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState> ();
  String? _hospitalName;
  String? _addressName;
  String? _phoneNumber;
  int? _numberPatient;
  int? _numberStaff;

  @override
  Widget build(BuildContext context) {
    return Form(
       key: _formKey,
       child: Column(
          children: [
             TextFormField (
               decoration: InputDecoration(
                 border: UnderlineInputBorder(),
                 labelText: 'ใส่ชื่อโรงพยาบาล',
                 icon: Icon(Icons.business),
               ),
               validator: (value) {
                 if (value == null || value.isEmpty) {
                    return 'ใส่ชื่อโรงพยาบาล' ;
                 }

                  return null;
               },
               onSaved: (value){
                 _hospitalName = value;
               },
             ),
            TextFormField(
              decoration:  InputDecoration(
                border: UnderlineInputBorder (),
                labelText: 'ใส่ที่อยู่โรงพยาบาล',
                icon: Icon(Icons.home_filled),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณาใส่ที่อยู่โรงพยาลบาล.';
              }

                 return  null ;
                },
                onSaved: (value) {
                  _addressName = value;
                },
              ),
              TextFormField(
               decoration: InputDecoration(
                  border: UnderlineInputBorder (),
                  labelText: 'ใส่เบอร์โทรโรงพยาบาล',
                  icon: Icon(Icons.ring_volume),
               ),
               validator: (value) {
                 if (value == null || value.isEmpty) {
                    return 'กรุณาใส่เบอร์โรงพยาบาล';
                  }
                  return null;
                },
                onSaved: (value){
                  _phoneNumber = value;
                },
              ),
              TextFormField(
               decoration: InputDecoration(
                  border: UnderlineInputBorder (),
                  labelText: 'ใส่จำนวนคนไข้ที่รองรับได้',
                  icon: Icon(Icons.ring_volume),
               ),
               validator: (value) {
                 if (value == null || value.isEmpty) {
                    return 'กรุณาใส่จำนวนคนไข้ที่รองรับได้';
                  }
                  return null;
                },
                onSaved: (value){
                  _numberPatient = int.parse(value!);
                },
              ),
               TextFormField(
               decoration: InputDecoration(
                  border: UnderlineInputBorder (),
                  labelText: 'ใส่จำนวนเจ้าหน้าที่ที่ปฎิบัตรงาน',
                  icon: Icon(Icons.ring_volume),
               ),
               validator: (value) {
                 if (value == null || value.isEmpty) {
                    return 'กรุณาใส่จำนวนเจ้าหน้าที่ที่ปฎิบัตรงาน';
                  }
                  return null;
                },
                onSaved: (value){
                  _numberStaff = int.parse(value!);
                },
              ),
              ElevatedButton(
                onPressed: () {
                   if (_formKey.currentState!.validate()) {
                     _formKey.currentState!.save();
                     Navigator.pop(context);
                   } 
                },
                child : Text('Validate'),
            ),
         ],
       ),
    );
   }
 }