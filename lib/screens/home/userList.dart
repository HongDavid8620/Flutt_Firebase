import 'package:flutt_firebase/screens/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = context.watch<QuerySnapshot>();

    for (var doc in users.docs){
        print(doc.data());
    }

    return Container(
      child: Center(
        child: Text('Home'),
      ),
    );
  }
}