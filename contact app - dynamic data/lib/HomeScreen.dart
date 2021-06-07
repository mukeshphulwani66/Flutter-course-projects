import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var users = [];

  @override
  void initState(){

    getuserData();
    super.initState();
  }


  Future<void> getuserData() async {
              try {
                http.Response resp = await http.get(
                Uri.parse('https://jsonplaceholder.typicode.com/users'));
                setState(() {
                  users = jsonDecode(resp.body);
                });
              } catch (err) {
                print(err.toString());
              }
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact App'),
        ),
        body: users.length > 0? 
          ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/about', arguments: users[index]);
                },
                leading: Icon(Icons.person),
                title: Text(users[index]['name']),
              ),
              elevation: 3,
            );
          },
          itemCount: users.length,
        )
        :Center(child: CircularProgressIndicator()),
       
        );
  }
}
