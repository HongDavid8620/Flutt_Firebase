import 'package:flutt_firebase/models/users.dart';
import 'package:flutt_firebase/screens/home/userList.dart';
import 'package:flutt_firebase/screens/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<Users>>(create: (context) => DatabaseService().users, initialData: null,)
      ],
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
          title: Text('Sign Out'),
          actions: [
            ElevatedButton.icon(
              icon: Icon(Icons.logout),
            label: Text ('Sign Out'),
            onPressed: ()async{
              context.read<AuthService>().signOut();
              },
            ),]
            ),
            body: UserList(),
        ),
      );
  }
}

Future <bool> loader(context){
  return showDialog(barrierDismissible: false,context: context, builder: (context) => AlertDialog(
    title: Text('Loading...'),
    content: SpinKitRotatingCircle(
  color: Colors.white,
  size: 50.0,
),
  )
  );
}