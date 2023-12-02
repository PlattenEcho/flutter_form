import 'package:flutter/material.dart';
import 'package:flutter_form/ui/shared/gaps.dart';
import 'package:flutter_form/ui/widgets/card.dart';

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
              MahasiswaCard(
                name: "Mahardika Putra",
                nim: "24060121130076",
                email: "test@gmail.com",
                price: "123213",
                workPeriod: "5 Tahun",
                rating: "esad",
                onTap: () {},
              )
            ],
          )),
    );
  }
}
