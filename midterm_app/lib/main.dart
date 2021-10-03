import 'package:flutter/material.dart';
import 'package:midterm_app/pages/five_page.dart';
import 'package:midterm_app/pages/fourth_page.dart';
import 'package:midterm_app/pages/one_page.dart';
import 'package:midterm_app/pages/seven_page.dart';
import 'package:midterm_app/pages/six_page.dart';
import 'package:midterm_app/pages/third_page.dart';
import 'package:midterm_app/pages/two_page.dart';
import 'package:provider/provider.dart';

import 'model/medel_hospital.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HospitalFormModel(),
        ),
      ],
      child:MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JJK App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      
      ),
      initialRoute: '/1',
      routes: <String,WidgetBuilder> {
        '/1': (context) => OnePage(),
        '/2': (context) => TwoPage(),
        '/3': (context) => ThirdPage(),
        '/4': (context) => FourthPage(),
        '/5': (context) => FivePage(),
        '/6': (context) => SixPage(),
        '/7': (context) => SevenPage(),
      }
      );
  }
}
      
 