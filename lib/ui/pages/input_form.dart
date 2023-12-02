import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form/ui/models/mahasiswa.dart';
import 'package:flutter_form/ui/services/sqflite.dart';
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
                      onPressed: () async {
                        String nama = _namaController.text;
                        String nim = _nimController.text;
                        String email = _emailController.text;

                        // Validasi jika form tidak kosong
                        if (nama.isNotEmpty &&
                            nim.isNotEmpty &&
                            email.isNotEmpty) {
                          int result =
                              await SqfLite.createMahasiswa(nama, nim, email);
                          if (result != 0) {
                            // Berhasil menyimpan data
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Berhasil Menyimpan Data"),
                              ),
                            );
                          } else {
                            // Gagal menyimpan data
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Gagal Menyimpan Data"),
                              ),
                            );
                          }
                        } else {
                          // Tampilkan pesan jika form tidak lengkap
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Form harus diisi semua"),
                            ),
                          );
                        }
                      },
                    ),
                    gapH(8),
                    Center(
                      child: RichText(
                          text: TextSpan(
                              style:
                                  blackTextStyle.copyWith(color: Colors.black),
                              children: <TextSpan>[
                            const TextSpan(text: "Mau lihat list mahasiswa? "),
                            TextSpan(
                                text: "Klik di sini",
                                style: blackTextStyle.copyWith(
                                    color: kPrimary2Color),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacementNamed(
                                        context, '/daftar-mahasiswa');
                                  })
                          ])),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
