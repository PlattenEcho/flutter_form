// lib/pages/edit_mahasiswa.dart

import 'package:flutter/material.dart';
import 'package:flutter_form/ui/services/sqflite.dart';
import 'package:flutter_form/ui/shared/theme.dart';
import 'package:flutter_form/ui/widgets/buttons.dart';

import '../shared/gaps.dart';
import '../widgets/textfield.dart';

class EditMahasiswa extends StatefulWidget {
  final Map<String, dynamic> mahasiswaData;
  final int arguments;
  const EditMahasiswa(
      {Key? key, required this.mahasiswaData, required this.arguments})
      : super(key: key);

  @override
  _EditMahasiswaState createState() => _EditMahasiswaState();
}

class _EditMahasiswaState extends State<EditMahasiswa> {
  late int mahasiswaId;
  late TextEditingController _namaController;
  late TextEditingController _nimController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final mahasiswaData = widget.mahasiswaData;
    mahasiswaId = widget.arguments;
    _namaController = TextEditingController(text: mahasiswaData['nama']);
    _nimController = TextEditingController(text: mahasiswaData['nim']);
    _emailController = TextEditingController(text: mahasiswaData['email']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Mahasiswa',
          style: whiteTextStyle.copyWith(fontWeight: bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewForm(
                controller: _namaController,
                nama: "Nama",
                hintText: "Masukkan Nama",
                obscureText: false,
                horizontalPadding: 0),
            gapH8,
            NewForm(
                controller: _nimController,
                nama: "NIM",
                hintText: "Masukkan NIM",
                obscureText: false,
                horizontalPadding: 0),
            gapH8,
            NewForm(
                controller: _emailController,
                nama: "Email",
                hintText: "Masukkan Email",
                obscureText: false,
                horizontalPadding: 0),
            gapH32,
            Button(
                text: "Submit",
                textColor: kWhiteColor,
                startColor: kPrimary2Color,
                endColor: kPrimaryColor,
                onPressed: () async {
                  String nama = _namaController.text;
                  String nim = _nimController.text;
                  String email = _emailController.text;

                  if (nama.isNotEmpty && nim.isNotEmpty && email.isNotEmpty) {
                    int result = await SqfLite.updateMahasiswa(
                      mahasiswaId,
                      nama,
                      nim,
                      email,
                    );

                    if (result != 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Berhasil Memperbarui Data'),
                        ),
                      );
                      Navigator.pop(context,
                          true); // Gunakan Navigator.pop dengan nilai true
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Gagal Memperbarui Data'),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Form harus diisi semua'),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
