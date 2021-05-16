import 'package:flutt_firebase/provider/switch_sign_in.dart';
import 'package:flutt_firebase/screens/authenticate/register.dart';
import 'package:flutter/material.dart';
import 'anonymous.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {


  @override
  Widget build(BuildContext context) {
    
  final SignInType = context.watch<SwitchSignIn>().signInType;
    if (SignInType)
    {
      return Anonymous();
    }
    else
    {
      return Register();
    }
  }
}