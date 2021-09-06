import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.red,
        textTheme: TextTheme(
          bodyText2:TextStyle(color: Colors.purple),
        ),
      ),
      initialRoute: '/sixth',
       routes: <String, WidgetBuilder> {
        '/first':(context) => FirstPage  (),   
        '/second': (context)=> SecondPage (),
        '/third': (context)=> ThirdPage (),
        '/fourth': (context)=> FourthPage (),
        '/fifth': (context)=> FifthPage (),
        '/sixth': (context)=> SixthPage (),
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

  Image cat = Image.asset(
    'assets/popcat2.png',
    width: 100,
  );

  Image cat1 = Image.asset(
    'assets/popcat1.png',
    width: 100,
  );

  Image cat2 = Image.asset(
    'assets/popcat2.png',
    width: 100,
  );

  void _incrementCounter() {
   setState(() {
     cat = cat2;
     _counter++;
   });
  }

  void _decreaseCounter(){
    setState(() {
      cat = cat1;
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200.0,
              margin: EdgeInsets.only(
               left: 100.0,
               right: 100.0,
               bottom:  20.0
             ),
             padding: EdgeInsets.all(8.0),
             decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.50),
              borderRadius: BorderRadius.circular(10.0),
             ),
             child:cat,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     primary : Colors.green 
                    ),
                   onPressed: _decreaseCounter,
                   child: Text('Decrease'),
                 ),
                 ElevatedButton(
                    style: ElevatedButton.styleFrom(
                     primary : Colors.red 
                    ),
                   onPressed: _incrementCounter,
                   child: Text('Increase'),
                 ),
               ],
             )
           ],
        ),
      ),
    
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.fingerprint),
      ), 
    );
  }
}

class SubmitButton extends StatelessWidget {
  final String buttonText;
  SubmitButton (this.buttonText);

  @override
  Widget build(BuildContext context) {
   return ElevatedButton(
     child: Text(this.buttonText),
     onPressed: () {
       print('Pressing');
     },
   );
  }
}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar:AppBar(
           title:  Text('First Page First Page'),
           actions: [
             IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward)),
             IconButton(onPressed: (){}, icon:Icon(Icons.architecture)),
             IconButton(onPressed: (){}, icon:Icon(Icons.bus_alert)),
             IconButton(onPressed: (){}, icon:Icon(Icons.medication)),
             IconButton(onPressed: (){}, icon:Icon(Icons.food_bank)),
           ],
        ) ,
     );
  }
}
class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var circular;
    return Scaffold(
       appBar: AppBar(
         title: Text('Second Page'),
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
        'Here is the text formatteed by them data',
       ),
       Table (
          children: [
             TableRow(
              children : [
                Container(
                  child: Center(child: Text ('No')),
                    decoration : BoxDecoration(
                       color: Colors.green,
                       borderRadius: BorderRadius.circular(10.0),
                 )
                ),
                Container(
                  child: Center(child: Text ('Name')),
                    decoration : BoxDecoration(
                       color: Colors.green,
                       borderRadius: BorderRadius.circular(10.0),
                 )
                ),
                Container(
                  child: Center(child: Text ('Gender')),
                    decoration : BoxDecoration(
                       color: Colors.green,
                       borderRadius: BorderRadius.circular(10.0),
                 )
                ),
              ]
             ),
            TableRow(
              children : [
               Text ('1'),
               Text ('Orapan Talalak'),
               Text ('Femal')
                ]
            ),
          TableRow(
            children: [
               Text ('2'),
               Text ('Bonus Lap'),
               Text ('Female'),
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
class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
      appBar: AppBar(
        title:  Text('Third Page'),
        bottom: TabBar(
          tabs: [
            Tab(
            icon: Icon(Icons.cloud)
            ),
            Tab(
              icon: Icon(Icons.beach_access_outlined),
            ),
            Tab(
              icon: Icon(Icons.brightness_1_outlined),
            ),
          ]
        ),
      ),
      body: TabBarView(
        children: [
          Center(
            child: Text('Cloud'),
          ),
          Center(
            child: Text('Umbrellar'),
          ),
          Center(
            child : Text('Sunny'),
           ),
         ] 
       ),
      ),
    );
  }
}

class FourthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A','B','C','D','E','F','G','H','I','J','K','L','M','N'];
    final List<int> colorCodes  = <int>[600,500,100];

    return Scaffold(
       appBar: AppBar(
         title: Text('ListView Example'),
       ),
       body: ListView.separated(
         padding: EdgeInsets.all(8.0),
         itemCount: entries.length,
         itemBuilder:(context,index) {
           return Container(
             height : 100,
             color: Colors.amber[colorCodes[index % 3]],
             child: Center(
              child: Text('Entry ${entries [index]}'),
             ),
           );
         },
         separatorBuilder: (context,index)=> Divider(),
       ),
    );
  }
}

class FifthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar : AppBar(
       title: Text('Grid View'),
    ),
    body : GridView.count(
       crossAxisCount : 2,
       children: List.generate(7,(index) {
         return InkWell(
           onTap: (){
             Navigator.pushNamed(context, '/${index+1}');
           },
           child: Container(
             margin:EdgeInsets.all(20.0),
             decoration: BoxDecoration(
               color: Theme.of(context).accentColor,
               borderRadius: BorderRadius.circular(8.0),
               ),
                child: Center(
                 child: Text(
                  'Page ${index+1}' , 
                  style : Theme.of(context).textTheme.headline5,
                 ),
               ),
             ),
          );
       }),
    ),
   );
  }
}

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
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter lastname.';
              }

                 return  null ;
                },
              ),
              TextFormField(
               decoration: InputDecoration(
                  border: UnderlineInputBorder (),
                  labelText: 'Enter your age',
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
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text ('Hoorayyyy'),
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
