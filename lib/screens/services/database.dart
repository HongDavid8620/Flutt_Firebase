import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutt_firebase/models/users.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // colection reference
  final CollectionReference userCollection = FirebaseFirestore.instance
  .collection('leassons');

  Future updateUserData(String name, String age, String gender) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'age' : age,
      'gender' : gender,
    }
    );
  }

  //Users List
  List<Users> _userListFromSnapshot(QuerySnapshot snapshot)
  {
    return snapshot.docs.map((doc){
      return Users(
        name: doc['name'] ?? '',
        age: doc['age'] ?? 'n/a',
        gender: doc['gender']  ?? 'n/a',
      );
    });
  }


  Stream <List<Users>> get users => userCollection.snapshots()
  .map(_userListFromSnapshot);
}