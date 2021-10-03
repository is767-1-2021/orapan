import 'package:flutter/material.dart';


class SevenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Update Data'),
          backgroundColor: Colors.orange[200],
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(decoration: new InputDecoration(labelText: "ชื่อสินค้า"),
            ),
            TextFormField(decoration: new InputDecoration(labelText: "ราคาสินค้า"),
            ),
            ElevatedButton(
              child: Text("เพิ่มข้อมูล"),
              onPressed: (){
              },
            ),
          ]),
          )  
      );
    }
  }

    