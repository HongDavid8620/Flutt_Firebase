import 'package:flutt_firebase/models/users.dart';
import 'package:flutt_firebase/screens/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = context.watch<List<Users>>();

    users.forEach((user) {
      print(user.name);
      print(user.age);
      print(user.gender);
     });


    return Container(
      child: Center(
        child: Text('Home'),
      ),
    );
  }
}