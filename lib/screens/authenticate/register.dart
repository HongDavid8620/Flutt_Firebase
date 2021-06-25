import 'package:flutt_firebase/components/loading.dart';
import 'package:flutt_firebase/provider/switch_sign_in.dart';
import 'package:flutt_firebase/screens/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  bool _loading = false;

  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _error = '';

  @override
  Widget build(BuildContext context) {

  final size = MediaQuery.of(context).size;
    return _loading? Loading() : Scaffold(
      body: Theme(data: Theme.of(context).copyWith(
        primaryColor: Colors.purple
      ),
              child: Form(
                key: _formKey,
                              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Text('Sign Up',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            SvgPicture.asset(
                "assets/icons/signup.svg"
                ),
            TextFieldContainer(child: TextFormField(
              onChanged: (val) {
                setState(() => _email = val);
              },
              obscureText : true,
              validator: (val) => val.isEmpty?'Invalid email':null,
          decoration: InputDecoration(
            hintText: "Your Email",
            prefixIcon: Icon(Icons.person),
            border: InputBorder.none,
          ),
        ),
        ),
            TextFieldContainer(child: TextFormField(
              onChanged: (val) {
                setState(() => _password = val);
              },
                obscureText : true,
                validator: (val) => val.length < 6 ?'Invalid password. Please input more then 6 char':null,
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(Icons.lock),
            suffixIcon: Icon(Icons.visibility),
            border: InputBorder.none,
          ),
        ),
        ),
        ElevatedButton(
          onPressed: () async {
            setState(() => _loading = true);
            if(_formKey.currentState.validate()){
              print(_email+_password);
                 dynamic result = await context.read<AuthService>().signInWithEmailAndPassword(email: _email , password: _password);
                    if (result == null){
                      _error = "Please supply a valid email";
                    }
            }
            setState(() => _loading = false);
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