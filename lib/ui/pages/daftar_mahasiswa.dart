// lib/pages/daftar_mahasiswa.dart

import 'package:flutter/material.dart';
import 'package:flutter_form/ui/pages/edit_mahasiswa.dart';
import 'package:flutter_form/ui/services/sqflite.dart';
import 'package:flutter_form/ui/shared/gaps.dart';
import 'package:flutter_form/ui/widgets/card.dart';
import '../shared/theme.dart';

class DaftarMahasiswa extends StatefulWidget {
  const DaftarMahasiswa({Key? key}) : super(key: key);

  @override
  State<DaftarMahasiswa> createState() => _DaftarMahasiswaState();
}

class _DaftarMahasiswaState extends State<DaftarMahasiswa> {
  List<Map<String, dynamic>> mahasiswaList = [];

  @override
  void initState() {
    super.initState();
    fetchMahasiswaData();
  }

  Future<void> fetchMahasiswaData() async {
    final mahasiswaData = await SqfLite.getMahasiswa();
    setState(() {
      mahasiswaList = mahasiswaData;
    });
  }

  void deleteMahasiswa(int id) async {
    await SqfLite.deleteMahasiswa(id);
    fetchMahasiswaData(); // Reload data after deletion
  }

  void editMahasiswa(int id, Map<String, dynamic> mahasiswa) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                EditMahasiswa(mahasiswaData: mahasiswa, arguments: id)));
    // await Navigator.pushNamed(
    //   context,
    //   '/edit-mahasiswa',
    //   arguments: id,
    // );
    fetchMahasiswaData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBlackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.5),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Daftar Mahasiswa",
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: mahasiswaList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> mahasiswa = mahasiswaList[index];
                  return MahasiswaCard(
                    name: mahasiswaList[index]['nama'] ?? "",
                    nim: mahasiswaList[index]['nim'] ?? "",
                    email: mahasiswaList[index]['email'] ?? "",
                    mahasiswaId: mahasiswaList[index]['id'],
                    onTap: () {
                      editMahasiswa(mahasiswaList[index]['id'], mahasiswa);
                    },
                    onDelete: (int id) {
                      deleteMahasiswa(id);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
