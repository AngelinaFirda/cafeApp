import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wikusama_cafe/navigation/routes.dart';
import 'package:wikusama_cafe/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String errorMessage = '';

  Future<void> handleLogin() async {
    try {
      User? user = await signInWithEmail(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (user != null) {
        print('Login sukses, email: ${user.email} uid: ${user.uid}');

        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          var data = userDoc.data() as Map<String, dynamic>;
          if (data.containsKey('role')) {
            String role = data['role'];
            print('Role pengguna: $role');

            switch (role) {
              case 'customer':
                Navigator.pushReplacementNamed(context, Routes.customerHome);
                break;
              case 'manager':
                Navigator.pushReplacementNamed(context, Routes.managerHome);
                break;
              case 'admin':
                Navigator.pushReplacementNamed(context, Routes.adminHome);
                break;
              default:
                setState(() {
                  errorMessage = 'Role tidak valid';
                });
                break;
            }
          } else {
            setState(() {
              errorMessage = 'Field role tidak ditemukan di dokumen pengguna';
            });
          }
        } else {
          setState(() {
            errorMessage = 'Pengguna tidak ditemukan di database';
          });
        }
      } else {
        setState(() {
          errorMessage = 'Login gagal, silakan coba lagi.';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Terjadi kesalahan: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8E3200), // Warna coklat
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Tombol back
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Warna putih
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Text(
              'Silakan masuk untuk melanjutkan menikmati layanan kami. Masukkan alamat email dan kata sandi yang terdaftar di bawah ini.',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                color: Colors.white, // Warna putih
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff8E3200), // Warna coklat
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 100.0),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white, // Warna putih
                        fontSize: 16,
                      ),
                    ),
                  ),
                  if (errorMessage.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
