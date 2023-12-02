import 'package:flutter/material.dart';
import 'package:flutter_form/ui/shared/gaps.dart';
import 'package:flutter_form/ui/shared/theme.dart';
import 'package:flutter_form/ui/widgets/buttons.dart';
import 'package:flutter_form/ui/widgets/textfield.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Isi Form",
                        style: blackTextStyle.copyWith(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    gapH24,
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
                        onPressed: () {}),
                    gapH(21),
                    ButtonOutline(
                        text: "Daftar Mahasiswa",
                        textColor: kPrimary2Color,
                        borderColor: kPrimaryColor,
                        onPressed: () {}),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
