import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutt_firebase/models/users.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // colection reference
  final CollectionReference userCollection = FirebaseFirestore.instance
  .collection('leassons');
  // .where('name', isEqualTo: 'HongDavid')
  // .get()
  // .then((value) => null);

// update user data

  Future updateUserData(String name, String age, String gender) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'age' : age,
      'gender' : gender,
    },SetOptions(merge: true)
    );
  }

  Future<void> updateUser() {
    return userCollection
      .doc('ABC123')
      .update({'company': 'Stokes and Sons'})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
  }
  Future<void> deleteUser() {
    return userCollection
      .doc('ABC123')
      .delete()
      .then((value) => print("User Deleted"))
      .catchError((error) => print("Failed to delete user: $error"));
  }

  //Users List
  List<Users> _userListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      try{
      return Users(
        name: doc.get('age') ?? "N/A",
        age: doc.get('age') ?? "N/A",
        gender: doc.get('gender').toString() ?? "N/A",
      );}catch(e){
        print('error ${e.message}');
        // print( doc.get('gender').toString());
        return Users();
      }
    }).toList();
  }
  // User snapshot a row
  Users _userFromSnapshot (DocumentSnapshot snapshot){
    return Users(
      name: snapshot['age'] ?? '',
      age: snapshot['age'] ?? '',
      gender: snapshot['age'] ?? '',
    );
  }
    Stream <Users> get currentUser{
    return userCollection.doc(uid).snapshots()
    .map(_userFromSnapshot);
  }

  //   Stream <List<Users>> get currentUser{
  //     List<Users> list;
  //   userCollection.doc(uid).snapshots().listen((result) {
  //     list
  //    });
    
  //   return ;
  // }

  Stream <List<Users>> get users { 
    return userCollection.snapshots()
    .map(_userListFromSnapshot);
  }





  final test = FirebaseFirestore.instance
  .collection('leassons').where('name', isEqualTo: 'HongDavid');
  
  List<Users> _testListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return Users(
        name: doc['age'] ?? '',
        age: doc['age'] ?? '',
        gender: doc['gender'] ?? '',
      );
    }).toList();
  }

  Stream <List<Users>> get currentTest{
    return test.snapshots()
    .map(_testListFromSnapshot);
  }
}