import 'package:flutter/material.dart';
import 'package:flutter_application_rpl/login.dart';

class awal extends StatefulWidget {
  const awal({super.key});

  @override
  State<awal> createState() => _awalState();
}

class _awalState extends State<awal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Group 4.png'),
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
            Container(
              child: TextButton(
                child: Text(
                  "Lanjutkan",
                  style: TextStyle(
                    color: Color(0x0ff1E1E1E),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
