import 'package:flutter/material.dart';

class PanduanPenggunaan extends StatelessWidget {
  const PanduanPenggunaan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buku Panduan Aplikasi'),
        backgroundColor: Color(0xFF2C3E50),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Panduan Penggunaan Aplikasi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              UserGuideStep(
                stepNumber: '1',
                title: 'Langkah 1',
                description:
                    'User melakukan Login pada aplikasi dengan memasukan Username dan Password, jika user belum punya akun klik tombol buat akun terlebih dahulu',
              ),
              const SizedBox(height: 20),
              UserGuideStep(
                stepNumber: '2',
                title: 'Langkah 2',
                description:
                    'Kemudian user akan masuk di halaman utama,Untuk bisa melihat informasi partai ',
              ),
              const SizedBox(height: 20),
              UserGuideStep(
                stepNumber: '3',
                title: 'Langkah 3',
                description:
                    'User dapat memberikan hak suaranya dengan mengklik tombol vote di dalam informasi partai',
              ),
              const SizedBox(height: 20),
              UserGuideStep(
                stepNumber: '4',
                title: 'Langkah 4',
                description:
                    'Lalu User dapat melihat hasil hak suaranya berdasarkan Grafik yang berada di bawah yang bertuliskan Hasil',
              ),
              const SizedBox(height: 20),
              UserGuideStep(
                stepNumber: '5',
                title: 'Langkah 5',
                description:
                    'User dapat melengkapi profil di pojok kanan bawah dan dapat melengkapi data dirinya kemudian setelah itu user bisa logout setelah selesai memilih hak suaranya',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserGuideStep extends StatelessWidget {
  final String stepNumber;
  final String title;
  final String description;

  const UserGuideStep({
    required this.stepNumber,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              stepNumber,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
