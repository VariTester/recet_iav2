import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future <List> getUsers() async {
  List users = [];
  CollectionReference collectionReferencePeople = db.collection('users');

  QuerySnapshot queryUsers = await collectionReferencePeople.get();

  queryUsers.docs.forEach((element) {
    users.add(element.data());
  });

  return users;
} 