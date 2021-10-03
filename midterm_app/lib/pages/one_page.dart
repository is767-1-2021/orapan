import 'package:flutter/material.dart';

class OnePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JJK App'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.count(
        crossAxisCount: 3,
         children:[
          new InkWell(
            onTap: (){
              Navigator.pushNamed(context, '/2');
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people
                ),
                Text(
                  'เพิ่มข้อมูลโรงพยาบาล',
                  style: TextStyle
                  (fontSize: 15, color:Colors.black),
                )
              ],
            ),
           decoration: BoxDecoration(
             color: Colors.blueGrey[100],
             borderRadius: BorderRadius.circular(15.0)),
            ),
          ),
          new InkWell(
                onTap: (){
                 Navigator.pushNamed(context, '/3');
               },

                 child: Container(
                   child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(
                     Icons.home_outlined
                   ),
                   Text(
                     'ข้อมูลโรงพยาบาล',
                     style: TextStyle
                       (fontSize: 15, color:Colors.blue[900]),
                   )
                 ],
               ),
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(15.0)),
             ),
           ),
           new InkWell(
                onTap: (){
                 Navigator.pushNamed(context, '/4');
               },

                 child: Container(
                   child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(
                     Icons.list_alt
                   ),
                   Text(
                     'รายชื่อ',
                     style: TextStyle
                       (fontSize: 15, color:Colors.blue[900]),
                   )
                 ],
                ),
                  decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(15.0)),
               ),
           ),
           new InkWell(
                onTap: (){
                 Navigator.pushNamed(context, '/5');
               },

                 child: Container(
                   child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.flag
                   ),
                   Text(
                     'Skill',
                     style: TextStyle
                       (fontSize: 15, color:Colors.blue[900]),
                   )
                 ],
                ),
                  decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(15.0)),
                ),
           ),
           new InkWell(
                onTap: (){
                 Navigator.pushNamed(context, '/6');
               },

                 child: Container(
                   child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(
                     Icons.calendar_today
                   ),
                   Text(
                     'ผลการตรวจ',
                     style: TextStyle
                       (fontSize: 15, color:Colors.blue[900]),
                   )
                 ],
                ),
                  decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(15.0)),
                 ),
           ),
           new InkWell(
                onTap: (){
                 Navigator.pushNamed(context, '/7');
               },

                 child: Container(
                   child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(
                     Icons.add_box_sharp
                   ),
                   Text(
                     'เพิ่มสินค้า',
                     style: TextStyle
                       (fontSize: 15, color:Colors.blue[900]),
                   )
                 ],
                ),
                  decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(15.0)),
                 ),
           ),
        ]),
      );
  }
}