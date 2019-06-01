import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  Future<bool> createUser(String uid, dynamic userData){
    CollectionReference usersReference = Firestore.instance.collection('users').reference();

    return usersReference.add({uid: userData}).
    then((result) {
      return true;
    }).catchError((error) {
      print('Error: $error');
      return false;
    });
  }

}