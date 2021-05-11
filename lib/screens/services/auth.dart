import 'package:firebase_auth/firebase_auth.dart';
import '../../models/user.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);
  // Create user obj based on FirebaseUser
  TheUser _userFromFirebaseUser(User user){
    return user != null ? TheUser(uid: user.uid) : null;
  }
  // auth change user stream
  Stream<TheUser> get authStateChanges {
    return _auth.authStateChanges()
    // when change , value convert to Theuser Class
    //.map((User user) => _userFromFirebaseUser(user));  
    .map(_userFromFirebaseUser);  // shorter code
  }


  // Sign in anon
  Future signInAnon() async {
    try {
      UserCredential result =  await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  // Sign in with email && password

  // Register with email && password

  // Sign out
  Future signOut() async{
    try{
    await _auth.signOut();
  }catch(e){
    
  }
  }
}