import 'package:flutter/cupertino.dart';
class SwitchSignIn extends ChangeNotifier {
  bool signInType = true;

  void toggleView() {
      signInType = !signInType;
      notifyListeners();
  }
}