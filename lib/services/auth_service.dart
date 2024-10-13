import 'package:firebase_auth/firebase_auth.dart';

Future<User?> signInWithEmail(String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  } catch (e) {
    print('Error signing in: $e'); // Menampilkan error di konsol
    return null;
  }
}
