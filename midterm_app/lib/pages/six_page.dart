import 'package:flutter/material.dart';

class SixPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'ผลตรวจ',
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
          itemCount:5 ,itemBuilder:  (context,int index){
            return Card(
              elevation: 5,
              margin:  const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
              child: ListTile(

                leading: CircleAvatar(
                  radius: 40,
                  child: FittedBox(
                    child: Text ("ติด"),
                  ),
                ),
                title: Text ("วันที่เข้ารับการตรวจ"),
                subtitle: Text ("10/10/2021"),              
              ),
            );
          }
        ),
      );
  }
}