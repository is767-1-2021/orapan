import 'package:flutter/material.dart';

class SixthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('First Form'),
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
  String? _firstName;
  String? _lastName;
  int? _age;

  @override
  Widget build(BuildContext context) {
    return Form(
       key: _formKey,
       child: Column(
          children: [
             TextFormField (
               decoration: InputDecoration(
                 border: UnderlineInputBorder(),
                 labelText: 'Enter your firstname',
                 icon: Icon(Icons.business),
               ),
               validator: (value) {
                 if (value == null || value.isEmpty) {
                    return 'Please enter firstname.' ;
                 }

                  return null;
               },
             ),
            TextFormField(
              decoration:  InputDecoration(
                border: UnderlineInputBorder (),
                labelText: 'Enter your last name ',
                icon: Icon(Icons.family_restroom),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter lastname.';
              }

                 return  null ;
                },
                onSaved: (value) {
                  _lastName = value;
                }
              ),
              TextFormField(
               decoration: InputDecoration(
                  border: UnderlineInputBorder (),
                  labelText: 'Enter your age',
                  icon: Icon(Icons.ring_volume),
               ),
               validator: (value) {
                 if (value == null || value.isEmpty) {
                    return 'Please enter age.';
                 }

                  if (int.parse(value) < 18) {
                     return 'Please enter valid age.';
                  }
                  
                  return null;
                }
              ),
              ElevatedButton(
                onPressed: () {
                   if (_formKey.currentState!.validate()) {
                     _formKey.currentState!.save();

                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text ('Hoorayyyy = $_firstName $_lastName $_age'),
                     ));
                   }
                 },
                child : Text('Validate')
              ),
          ],
      ),
    );
  }
 }