import 'package:flutter/material.dart';

class FivePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('SKill'),
         centerTitle: true,
     ),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.build_sharp),
       onPressed: (){},
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(
        'ความสามารถบุคลากร',
       ),
       Table (
          children: [
             TableRow(
              children : [
                Container(
                  child: Center(child: Text ('No')),
                    decoration : BoxDecoration(
                       color: Colors.blueGrey[200],
                       borderRadius: BorderRadius.circular(5.0),
                 ),
                ),
                Container(
                  child: Center(child: Text ('Name')),
                    decoration : BoxDecoration(
                       color: Colors.blueGrey[200],
                       borderRadius: BorderRadius.circular(10.0),
                 ),
                ),
                Container(
                  child: Center(child: Text ('Skill')),
                    decoration : BoxDecoration(
                       color: Colors.blueGrey[200],
                       borderRadius: BorderRadius.circular(10.0),
                 ),
                ),
              ]
             ),
            TableRow(
              children : [
               Text ('1'),
               Text ('Pencil Love'),
               Text ('Programmer')
                ]
            ),
          TableRow(
            children: [
               Text ('2'),
               Text ('Magic Loft'),
               Text ('Driver'),
             ],
            )
          ],
         ),
        ],
      ),
     ),
   );
  }
}