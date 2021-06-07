import 'package:flutter/material.dart';
import './userDetails.dart';

class HomeScreen extends StatelessWidget {
  final List<userDetails> users = [
      userDetails(name: 'Ramesh Verma', phone: 22233444, email: 'adsad@hedd.com'),
      userDetails(name: 'suresh verma', phone: 34333444, email: '3232@hedd.com'),
    // {"name": "Ramesh Verma", "phone": 123456, "email": 'ramesh@ramesh.com'},
    // {"name": "Suresh Sharma", "phone": 789123, "email": 'suresh@ramesh.com'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact App'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: (){
                  Navigator.pushNamed(context, '/about',arguments: users[index]);
                },
                leading: Icon(Icons.person),
                title: Text(users[index].name),
              ),
              elevation: 3,
            );
          },
          itemCount: users.length,
        ));
  }
}
