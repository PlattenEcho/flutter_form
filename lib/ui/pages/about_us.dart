import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form/ui/shared/gaps.dart';

import '../shared/theme.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
              gapH24,
              Text("Tugas Eksplorasi Framework",
                  style: blackTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.normal)),
              Text("Dibuat oleh Kelompok 1",
                  style: blackTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.normal))
            ],
          )),
    );
  }
}
