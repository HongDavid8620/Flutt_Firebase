import 'package:flutt_firebase/components/loading.dart';
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
    final currentUser = context.watch<Users>(); 
    if(currentUser != null)
    {
      print('U name :${currentUser.name}');
      print('User age :${currentUser.age}');
      print('Current gender :${currentUser.gender}');
    }
      if(users !=null){
        return ListView.builder(
                  itemCount: users.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return slidableWidget(users: users[index],);
                    },
                );
    }else{
      return Loading();
    }
  }
}