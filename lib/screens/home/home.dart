import 'package:flutter/material.dart';
import '../services/auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
        title: Text('Sign Out'),
        actions: [
          ElevatedButton(
          child: Text ('Sign Out'),
          onPressed: ()async{
            await _auth.signOut();
            },
          ),]
          ),
          body: Container(
        alignment: Alignment.center,
        child: Text('Home'),
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