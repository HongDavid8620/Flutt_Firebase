import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutt_firebase/screens/services/database.dart';
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

  Future signInWithEmailAndPassword({String email, String password})async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    }on FirebaseAuthException catch(e){
      print('error code: ${e.code}');
      print('error : ${e.message}');
    }
  }

  // Register with email && password

  Future createWithEmailAndPassword({String email ,String password}) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      await DatabaseService(uid: user.uid).updateUserData('HongDavid', '21', 'M');
      return _userFromFirebaseUser(user);
    }on FirebaseAuthException catch(e){
      print('error code : ${e.code}');
      print(e.message);
      return null;
    }
  }

  // Sign out
  Future signOut() async{
    try{
    await _auth.signOut();
  }catch(e){
  }
  }
}