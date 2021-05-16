import 'package:flutt_firebase/provider/switch_sign_in.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class Anonymous extends StatefulWidget {
  
  @override
  _AnonymousState createState() => _AnonymousState();
}

class _AnonymousState extends State<Anonymous> {

  ProgressDialog progressDialog;  // var loading dialog

  @override
  Widget build(BuildContext context) {

    progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Sign In'),
        actions: [
          ElevatedButton(
          child: Text ('Register here'),
          onPressed: () {
            context.read<SwitchSignIn>().toggleView();
          },),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          child: Text ('Sign In'),
          onPressed: () async {
            progressDialog.show();
            dynamic result = await context.read<AuthService>().signInAnon();
            if (result == null)
            {
              print("couldn't sign in");
            }else
            {
              print('signed in');
              print(result.uid);
            }
            progressDialog.hide();
          },
        ),
      ),
    );
  }
}