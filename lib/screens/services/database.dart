import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // colection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('leassons');

  Future updateUserData(String name, String age, String gender) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'age' : age,
      'gender' : gender,
    }
    );
  }

  Stream <QuerySnapshot> get users => userCollection.snapshots();
}