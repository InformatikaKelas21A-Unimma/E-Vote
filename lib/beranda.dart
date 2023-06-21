import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_rpl/nasdem.dart';
import 'package:flutter_application_rpl/pdi.dart';
import 'package:flutter_application_rpl/gerindra.dart';
import 'package:flutter_application_rpl/pkb.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';
  List<String> partyList = [
    'PDI',
    'Gerindra',
    'PKB',
    'NasDem',
  ];
  List<String> filteredPartyList = [];

  @override
  void initState() {
    super.initState();
    filteredPartyList = partyList;
  }

  void filterPartyList() {
    if (searchQuery.isNotEmpty) {
      setState(() {
        filteredPartyList = partyList
            .where((party) =>
                party.toLowerCase().contains(searchQuery.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredPartyList = partyList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email;
    final username = getUsernameFromEmail(email);

    return Padding(
      padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:
                  Color(0xFF2C3E50), // Ubah kode warna menjadi biru agak gelap
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Icon(Icons.person, color: Colors.white),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username: $username',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Sebagai Pendukung',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                    filterPartyList();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Cari...',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 200, // Sesuaikan tinggi kotak iklan sesuai kebutuhan
            child: PageView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 0),
                      Container(
                        height: 200, // Sesuaikan tinggi iklan sesuai kebutuhan
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('images/iklan.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Tambahkan konten iklan di sini, seperti teks, gambar, dll.
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 0),
                      Container(
                        height: 200, // Sesuaikan tinggi iklan sesuai kebutuhan
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('images/iklan2.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Tambahkan konten iklan di sini, seperti teks, gambar, dll.
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 0),
                      Container(
                        height: 200, // Sesuaikan tinggi iklan sesuai kebutuhan
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('images/iklan3.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Tambahkan konten iklan di sini, seperti teks, gambar, dll.
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: filteredPartyList.map((party) {
                return _buildPartyCard(
                  partyName: party,
                  imagePath: 'images/$party.png',
                  onPressed: () {
                    // Navigasi ke halaman partai
                    switch (party) {
                      case 'PDI':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pdi()),
                        );
                        break;
                      case 'Gerindra':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => gerindra()),
                        );
                        break;
                      case 'PKB':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pkb()),
                        );
                        break;
                      case 'NasDem':
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => nasdem()),
                        );
                        break;
                    }
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPartyCard({
    required String partyName,
    required String imagePath,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              partyName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    child: Text(
                      'Lihat Detail',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getUsernameFromEmail(String? email) {
    if (email != null) {
      final username = email.split('@')[0];
      return username;
    }
    return '';
  }
}
