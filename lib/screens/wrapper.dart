import 'package:flutt_firebase/models/userid.dart';
import 'package:flutter/material.dart';
import 'home/home.dart';
import 'authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import '../models/detail.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final user = context.watch<TheUser>();
    if (user == null){
    return Authenticate();
    }
    else{
      return Home();
    }
  }
}