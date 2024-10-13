import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> setUserRole(User user, String role) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .set({'role': role});
}
