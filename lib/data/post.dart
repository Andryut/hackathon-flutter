import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class Post {

  Future<bool> createPost(dynamic postData){
    CollectionReference usersReference = Firestore.instance.collection('users').reference();

    return usersReference.add({new DateTime.now().toString()+ Random.secure().nextInt(10000).toString(): postData}).
    then((result) {
      return true;
    }).catchError((error) {
      print('Error: $error');
      return false;
    });
  }

}