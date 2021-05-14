import 'package:flutt_firebase/screens/authenticate/register.dart';
import 'package:flutter/material.dart';
import 'anonymous.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool SignInType = true;
  void toggleView() {
    setState(() {
      SignInType = !SignInType;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (SignInType)
    {
      return Anonymous(toggleView: toggleView);
    }
    else
    {
      return Register(toggleView: toggleView);
    }
  }
}