import 'package:flutter/material.dart';

class InfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Aplikasi'),
        backgroundColor: Color(0xFF2C3E50),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tentang Aplikasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Aplikasi e-Voting adalah sebuah aplikasi yang digunakan untuk melakukan pemilihan secara elektronik. '
              'Aplikasi ini dirancang untuk memudahkan proses pemilihan dan menghindari kecurangan dalam pemilihan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Fitur Aplikasi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '- Pemilihan Kandidat: Pengguna dapat memilih kandidat yang diinginkan melalui aplikasi ini.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Daftar Kandidat: Menampilkan daftar kandidat beserta informasi partai yang mereka wakili.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Hasil Pemilihan: Setelah pemilihan selesai, aplikasi akan menampilkan hasil pemilihan secara langsung.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Kontak Kami',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Jika Anda memiliki pertanyaan atau masalah terkait aplikasi ini, silakan hubungi kami melalui:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '- Email: evotingapp@example.com',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Telepon: 123-456-7890',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
