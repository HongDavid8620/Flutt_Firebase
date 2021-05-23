import 'package:flutt_firebase/components/loading.dart';
import 'package:flutt_firebase/models/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/slideable.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = context.watch<List<Users>>() ?? [];
    final currentUser = context.watch<Users>() ?? Users(); 
    
    // for(Users doc in currentUser)
    // {
    //   print(doc.name);
    //   print(doc.age);
    // }
      if(users !=null){
        print(users.length);
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