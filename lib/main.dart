import 'package:flutter/material.dart';
import 'package:my_first_project/custom.dart';
import 'package:my_first_project/home.dart';
import 'package:my_first_project/pratices/discountcalculater.dart';
import 'package:my_first_project/pratices/home.dart';
import 'package:my_first_project/pratices/input_form.dart';
import 'package:my_first_project/pratices/meme.dart';
import 'package:my_first_project/pratices/portfolio.dart';
import 'package:my_first_project/pratices/tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:MainScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body:Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
              'A',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'b',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'c',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'd',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'e',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'f',
              style: TextStyle(fontSize: 20),
            ),
              ],
              
            ),
            ElevatedButton(onPressed: (){
              
            },
            child:Text('click')
            ),
            Text(
              'A',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'b',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'c',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'd',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'e',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'f',
              style: TextStyle(fontSize: 20),
            ),
            
          ],
        )
   
        
            //child: Text('hello renu',style: TextStyle(fontSize: 25),),
            ));
  }
}
