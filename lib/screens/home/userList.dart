import 'package:flutt_firebase/models/users.dart';
import 'package:flutt_firebase/screens/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'components/slideable.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = context.watch<List<Users>>();
      int count=1;
      if(users !=null){
        count ++;
      }  
      print('Number of list: $count');
    return ListView.builder(
                  itemCount: users.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return slidableWidget(users: users[index],);
                    },
                );
  }
}