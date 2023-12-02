import 'package:flutter/material.dart';
import 'package:flutter_form/ui/shared/gaps.dart';

import '../shared/theme.dart';

class DaftarMahasiswa extends StatefulWidget {
  const DaftarMahasiswa({super.key});

  @override
  State<DaftarMahasiswa> createState() => _DaftarMahasiswaState();
}

class _DaftarMahasiswaState extends State<DaftarMahasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      extendBodyBehindAppBar: true,
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
          elevation: 0.0),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/bg.png',
                  ),
                  fit: BoxFit.cover)),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/logo.png'),
              ),
              gapH(24),
              Text("Halaman daftar Mahasiswa",
                  style: blackTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.normal)),
              gapH(10),
              Text("Ngga tahu cara buat tabelnya aku wkwkwk",
                  style: blackTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.normal)),
              gapH(10),
              Text("Ini aja yang kedua aneh",
                  style: blackTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold))
            ],
          )),
    );
  }
}
