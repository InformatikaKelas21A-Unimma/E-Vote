import 'package:flutter/material.dart';
import 'package:flutter_application_rpl/first.dart';
import 'package:flutter_application_rpl/register.dart';
import 'package:flutter_application_rpl/halaman_utama.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_rpl/profile.dart';

class login extends StatefulWidget {
  login({super.key});
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  @override
  State<login> createState() => _login();
}

class _login extends State<login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HalamanUtama(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Pengguna Tidak Ditemukan');
      } else if (e.code == 'wrong-password') {
        print('Kata Sandi Salah');
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),
// Login Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: signIn,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),

          //Google
          SizedBox(
            height: 10.0,
          ),
          Text('Anda belum mempunyai akun?'),
          //
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text(
                  'Buat Akun',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
