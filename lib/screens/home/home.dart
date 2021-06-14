import 'package:flutt_firebase/models/detail.dart';
import 'package:flutt_firebase/models/userid.dart';
import 'package:flutt_firebase/models/users.dart';
import 'package:flutt_firebase/models/widgets.dart';
import 'package:flutt_firebase/screens/home/userList.dart';
import 'package:flutt_firebase/screens/home/widgetList.dart';
import 'package:flutt_firebase/screens/services/database.dart';
import 'package:flutt_firebase/screens/services/widgets/widgetscontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final user = context.watch<TheUser>();
    return MultiProvider(
      providers: [
        StreamProvider<List<Users>>(create: (context) => DatabaseService().users, initialData: null,),
        StreamProvider<TheUser>(create: (context) => DatabaseService(uid: user.uid).currentUser, initialData: null,catchError: (_,__)=> null,),
        StreamProvider<List<Widgets>>(create: (context) => WidgetsController().widgets, initialData: null,),
        
      ],
      
          child: Scaffold(
            backgroundColor: Color.fromRGBO(43, 54, 72, 1),
            appBar: AppBar(title: Text('Widgets List',style: TextStyle(color: Color.fromRGBO(175, 189, 209, 1)),),backgroundColor: Color.fromRGBO(33, 41, 54, 1),
          actions: [
            ElevatedButton.icon(
              icon: Icon(Icons.logout),
            label: Text ('Sign Out'),
            onPressed: ()async{
              context.read<AuthService>().signOut();
              },
            ),]
            ),
            body: WidgetList(),
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