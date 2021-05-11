import 'package:flutter/material.dart';
import '../services/auth.dart';
import 'package:progress_dialog/progress_dialog.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

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
          child: Text ('Sign In'),
          onPressed: () async {
            progressDialog.show();
            dynamic result = await _auth.signInAnon();
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
        ],
      ),
      body: Container(
        alignment: Alignment.center,
      ),
    );
  }
}