import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_rpl/halaman_utama.dart';
// import 'package:flutter_application_10/home.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordValidasiController =
      TextEditingController();

  bool erorValidator = false;

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordValidasiController.text,
      );
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Group 4 (1).png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'E-VOTE RI',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Text(
                'Selamat Datang Di Aplikasi Pemilu Online Atau E-Voting',
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: TextField(
                controller: passwordValidasiController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  errorText: erorValidator ? "Password Tidak Sesuai! " : null,
                  hintText: 'Massukan Password Lagi',
                ),
              ),
            ),
            //Login
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      passwordController.text == passwordValidasiController.text
                          ? erorValidator = false
                          : erorValidator = true;
                    });
                    if (erorValidator) {
                      print("eror");
                    } else {
                      signUp();
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Daftarkan Akun"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
