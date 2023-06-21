import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_rpl/info.dart';
import 'package:flutter_application_rpl/login.dart';
import 'package:flutter_application_rpl/edit_profile.dart';
import 'package:flutter_application_rpl/panduan.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? _displayedJenisKelamin;
  String? _displayedKabupaten;

  void _updateDisplayedValues() {
    setState(() {
      _displayedJenisKelamin = 'Laki-laki'; // Nilai jenis kelamin yang disimpan
      _displayedKabupaten =
          'Kabupaten Semarang'; // Nilai asal kabupaten yang disimpan
    });
  }

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    // Navigasi ke halaman login setelah logout berhasil
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => login()),
    );
  }

  void navigateToEditProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfile()),
    ).then((_) {
      // Saat kembali dari halaman EditProfile, perbarui nilai-nilai yang ditampilkan
      _updateDisplayedValues();
    });
  }

  void navigateToPanduanPenggunaan(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PanduanPenggunaan()),
    );
  }

  void navigateToInfoApp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InfoApp()),
    );
  }

  @override
  void initState() {
    super.initState();
    // Panggil _updateDisplayedValues saat halaman profil diinisialisasi
    _updateDisplayedValues();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF2C3E50),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '$email',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Text(
                  '$_displayedJenisKelamin',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Text(
                  '$_displayedKabupaten',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pengaturan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => navigateToEditProfile(context),
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Edit Profil',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Daerah Penilaian',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'BANTUAN',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => navigateToPanduanPenggunaan(context),
                        child: Row(
                          children: [
                            Icon(
                              Icons.help,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Panduan Penggunaan',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => navigateToInfoApp(context),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Info Aplikasi',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => signOut(context),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
