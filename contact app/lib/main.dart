import 'package:flutter/material.dart';
import './HomeScreen.dart';
import './AboutScreen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: TextTheme(bodyText2: TextStyle(fontSize: 30)),
      ),
       initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/about': (context) => AboutScreen(),
        },
    );
  }
}
