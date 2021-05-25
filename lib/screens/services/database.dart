import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutt_firebase/models/users.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // colection reference
  final userCollection = FirebaseFirestore.instance;

// update user data
  Future updateUserData(String name, String age, String gender) async {
    return await userCollection.collection('leassons').doc(uid).set({
      'name': name,
      'age' : age,
      'gender' : gender,
    },SetOptions(merge: true)
    );
  }

  //delete document
  Future<void> deleteUser(doc) {
    return userCollection.collection('leassons')
      .doc(doc.id)
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
        gender: doc.get('gender'),
      );
      }catch(e){
        print('error ${e.message}');
        // print( doc.get('gender').toString());
        return Users();
      }
    }).toList();
  }

  Stream <List<Users>> get users { 
    return userCollection.collection('leassons').snapshots()
    .map(_userListFromSnapshot);
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
    return userCollection.collection('leassons').doc(uid).snapshots()
    .map(_userFromSnapshot);
  }

Stream <List<Users>> get userstemp {
  userCollection.collection('leassons')
      .snapshots()
      .listen((result) {
    result.docs.forEach((result) {
      print("gender: ${result['gender']}");
      print(result.data());
      // return Users(
      //   name: result['name'],
      //   age: result['age'],
      //   gender: result['gender'],
      // );
    });
  });
}

  // using where
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




  // Stream <List<Users>> get getUserList {
  //   try {
  //     userCollection.get().then((querySnapshot){
  //       querySnapshot.docs.forEach((element) {
  //         return Users(
  //           name: element['name'] ?? 'error',
  //           age: element['age'] ?? 'error',
  //           gender: element['gender'] ?? 'error',
  //         );
  //       });
  //     }
  //     );
  //     return itemList;
  //   }catch(e){
  //     print('Elements error: $e');
  //     return null;
  //   }
  // }

  //   Stream <List<Users>> get currentUser{
  //     List<Users> list;
  //   userCollection.doc(uid).snapshots().listen((result) {
  //     list
  //    });
    
  //   return ;
  // }
