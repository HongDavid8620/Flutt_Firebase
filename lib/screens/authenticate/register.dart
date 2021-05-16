import 'package:flutt_firebase/provider/switch_sign_in.dart';
import 'package:flutt_firebase/screens/authenticate/authenticate.dart';
import 'package:flutt_firebase/screens/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Theme(data: Theme.of(context).copyWith(
        primaryColor: Colors.purple
      ),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Text('Sign Up',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            SvgPicture.asset(
              "assets/icons/signup.svg"
              ),
            TextFieldContainer(child: TextField(
              controller: emailController,
          decoration: InputDecoration(
            hintText: "Your Email",
            prefixIcon: Icon(Icons.person),
            border: InputBorder.none,
          ),
        ),
        ),
            TextFieldContainer(child: TextField(
              controller: passwordController,
              obscureText : true,
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.visibility),
            border: InputBorder.none,
          ),
        ),
        ),
        ElevatedButton(
          onPressed: (){
            context.read<AuthService>().signInAnon();
          }, 
          child: Text("Sign Up"),
          style: ElevatedButton.styleFrom(
             onPrimary: Colors.white70,
                primary: Colors.purple,
                minimumSize: Size(size.width*0.95, 40),
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
          ),),
        ElevatedButton(
          onPressed: (){
            context.read<SwitchSignIn>().toggleView();
          }, 
          child: Text("Guest"),
          style: ElevatedButton.styleFrom(
             onPrimary: Colors.black45,
                primary: Colors.white54,
                minimumSize: Size(size.width*0.95, 30),
                padding: EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
          ),),
          ],
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final text;
  final Widget child;
  const TextFieldContainer({
    Key key, this.text,this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}