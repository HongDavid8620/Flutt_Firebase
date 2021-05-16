import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SwitchSignIn extends ChangeNotifier {
  bool signInType = true;

  void toggleView() {
      signInType = !signInType;
      notifyListeners();
  }
}