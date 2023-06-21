import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _dateController = TextEditingController();
  String? _selectedKabupaten;
  String? _selectedJenisKelamin;
  String? _displayedJenisKelamin;
  String? _displayedKabupaten;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = pickedDate.toString();
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    setState(() {
      _displayedJenisKelamin = _selectedJenisKelamin;
      _displayedKabupaten = _selectedKabupaten;
    });

    // Tambahkan logika untuk menyimpan profil ke tempat penyimpanan yang sesuai
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2C3E50),
        title: Row(
          children: [
            // Menggunakan ikon pengguna (user)
            const SizedBox(width: 8), // Spasi antara ikon dan teks
            const Text('Edit Profile'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Edit Profil',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'NIK',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Jenis Kelamin',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.people),
                ),
                value: _selectedJenisKelamin ?? 'Laki-laki', // Nilai awal
                items: <String>['Laki-laki', 'Perempuan']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedJenisKelamin = newValue;
                  });
                },
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: IgnorePointer(
                  child: TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: 'Tanggal Lahir',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Asal Kabupaten',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_city),
                ),
                value: _selectedKabupaten,
                items: <String>[
                  'Kabupaten Semarang',
                  'Kabupaten Boyolali',
                  'Kabupaten Magelang',
                  'Kabupaten Temanggung',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedKabupaten = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                child: const Text('Simpan'),
              ),
              const SizedBox(height: 20),
              if (_displayedJenisKelamin != null)
                Row(
                  children: [
                    Icon(Icons.people),
                    const SizedBox(width: 10),
                    Text('Jenis Kelamin: $_displayedJenisKelamin'),
                  ],
                ),
              if (_displayedKabupaten != null)
                Row(
                  children: [
                    Icon(Icons.location_city),
                    const SizedBox(width: 10),
                    Text('Asal Kabupaten: $_displayedKabupaten'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
