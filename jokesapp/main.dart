import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var count = 0;
  var jokes = [
    'Learn programming to understand programming jokes.',
    'Code never lies,comments sometimes do.',
    'You are semicolons to my Statements',
    'Programming is 1% writing code and 99% understanding why its not working',
    'I told him I cound not open jar. He told me to download java',
    'Comparing java and javascript is same as comparing car and carpet',
    'Golden rule of programming - If it works dont touch it.'
  ];
  void getAnotherJoke(){
           setState(() {
             if(count == jokes.length-1){
               count = 0;
             }else{
               count = count + 1;
             }
               
           });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        body: Center(
          child: Text(
            '${jokes[count]}',
            style: TextStyle(fontSize: 40,fontStyle: FontStyle.italic),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:getAnotherJoke,
          child: Icon(Icons.refresh,size: 50),
          backgroundColor: Colors.pink[400],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
      debugShowCheckedModeBanner:false,
    );
  }
}
