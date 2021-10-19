import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/pages/hospital_scform_page.dart';
import 'package:team_app/pages/hospital_show_page.dart';

import 'model/model_hostpital_info_form.dart';
import 'pages/hbooking_list_page.dart';
import 'pages/hostpital_info_page.dart';
import 'pages/ubooking_list_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create: (context) => HospitalinfoFormModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I-Covid App',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
    initialRoute: '/5',
     routes : <String, WidgetBuilder> {
       '/1':(context)=> UBookingListScreen (),
       '/2':(context)=> HostpitalInfoScreen (),
       '/3':(context)=> HBookingListScreen (),
       '/4':(context)=> HostpitalScreen (),
       '/5':(context)=> Hospitalshow (),
     }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() { 
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context)=> UBookingListScreen()
                ) 
              );
            },
            icon: Icon(Icons.list_alt_rounded),
          ),
          IconButton(
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context)=> HBookingListScreen()
                ) 
              );
            },
            icon: Icon(Icons.local_hospital),
          ),
          IconButton(
            onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context)=> HostpitalInfoScreen()
                ) 
              );
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
