import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutt_firebase/models/userid.dart';
import 'package:flutt_firebase/provider/switch_sign_in.dart';
import 'package:flutt_firebase/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'screens/services/auth.dart';
import 'models/detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  Widget build(BuildContext context) {
    // final Authenticate _authenticate = Authenticate() ;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SwitchSignIn()),
        Provider(create: (context) => AuthService(FirebaseAuth.instance)),
        StreamProvider<TheUser>( initialData: null,
          create: (context) => context.read<AuthService>().authStateChanges,
          ),
      ],
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(43, 54, 72, 1),     
          primaryColor: Color.fromRGBO(33, 41, 54, 1),
          primarySwatch: Colors.blue,
          // buttonTheme: ButtonThemeData(
          //   buttonColor: Color(0xffff914d),
          //   textTheme: ButtonTextTheme.primary,
          // ),
        ),
        home: Wrapper(),
      ),
    );
  }
}