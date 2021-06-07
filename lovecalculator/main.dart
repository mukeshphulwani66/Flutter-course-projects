import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final yourName = TextEditingController();
  final partnersName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int? lovepercentage;
  var loading = false;
  
  _MyAppState(){
   
    yourName.text = 'Ranbeer';
    partnersName.text = 'aalia';
  }
  


  void calculateLove() {
    if(formKey.currentState!.validate()){
 
    setState(() {
      loading = true;
      lovepercentage = null;
    });
    Timer(Duration(seconds: 3),(){
      setState(() {
        loading = false;
        lovepercentage = Random().nextInt(100);
      });
    });
    
         
    }
  }

String? validate(text){
  if(text!.isEmpty) return 'please add this field';
  
}

  InputDecoration myInputDecorator(text){
    return InputDecoration(
        hintText: text,
      
      );
  }

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 30)
        )
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Love Calculator'),
            centerTitle: true,
           
          ),
          body: Form(
              key: formKey,
              child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: yourName,
                  validator: (text)=>validate(text),
                  decoration:myInputDecorator('Your Name') 
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: partnersName,
                 validator: (text)=>validate(text),
                  decoration: myInputDecorator('Partners Name') 
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.favorite),
                  onPressed: calculateLove,
                  label: Text(
                    'Calculate Love',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                  
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
                ),
                SizedBox(
                  height: 30,
                ),
                if(loading) CircularProgressIndicator(),
                if (lovepercentage != null)
                  Text(
                    '${yourName.text} loves ${partnersName.text} $lovepercentage %',
                   
                  ),
                  
                 
              ],
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
