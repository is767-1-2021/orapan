import 'package:flutter/material.dart';

class HBookingListScreen extends StatelessWidget {
 final List<String> items = List<String>.generate(10, (index) => 'Item $index');
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'รายชื่อผู้เข้ารับการตรวจ',
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: (){
                // Navigator.push(context, 
                //   MaterialPageRoute(
                //     builder: (context) => DOPAAddScreen()
                //     )
                // );

            }, 
            icon: Icon(Icons.add))
          ],
          backgroundColor: Color(0xFF473F97),
        ),
        //
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(items[index]),
            );
          }
        ),
      );
  }
}