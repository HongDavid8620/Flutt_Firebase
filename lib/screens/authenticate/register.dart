import 'package:flutt_firebase/components/loading.dart';
import 'package:flutt_firebase/provider/switch_sign_in.dart';
import 'package:flutt_firebase/screens/home/components/inputfield.dart';
import 'package:flutt_firebase/screens/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  submit() async {
    setState(() => _loading = true);
    if (_formKey.currentState.validate()) {
      print(_email + _password);
      dynamic result = await context
          .read<AuthService>()
          .signInWithEmailAndPassword(email: _email, password: _password);
      if (result == null) {
        _error = "Please supply a valid email";
      }
    }
    setState(() => _loading = false);
  }

  bool _loading = false;

  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _error = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              body: Theme(
                data: Theme.of(context).copyWith(primaryColor: Colors.purple),
                child: Container(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Sign Up',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromRGBO(175, 189, 209, 1))),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            height: MediaQuery.of(context).size.width - 100,
                            child: SvgPicture.asset("assets/icons/signup.svg"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InputField(
                              icon: Icon(Icons.person,
                                  color: Color.fromRGBO(175, 189, 209, 1)),
                              labeltext: 'Enter Email',
                              lines: 1,
                              onChanged: (val) {
                                setState(() => _email = val);
                              },
                              validator: (val) =>
                                  val.isEmpty ? 'Invalid title' : null,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InputField(
                              icon: Icon(Icons.lock,
                                  color: Color.fromRGBO(175, 189, 209, 1)),
                              labeltext: 'Enter Password',
                              lines: 1,
                              onChanged: (val) {
                                setState(() => _password = val);
                              },
                              validator: (val) => val.isEmpty
                                  ? 'Invalid password. Please input more then 6 char'
                                  : null,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: submit,
                            child: Text("Sign Up"),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(size.width * 0.95, 40),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<SwitchSignIn>().toggleView();
                            },
                            child: Text(
                              "Anonymous",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white54,
                              minimumSize: Size(size.width * 0.95, 30),
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
    Key key,
    this.text,
    this.child,
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
