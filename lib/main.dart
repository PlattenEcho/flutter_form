import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form/ui/pages/about_us.dart';
import 'package:flutter_form/ui/pages/edit_mahasiswa.dart'; // Import the new page
import 'package:flutter_form/ui/pages/input_form.dart';
import 'package:flutter_form/ui/pages/start_screen.dart';
import 'package:flutter_form/ui/pages/daftar_mahasiswa.dart';

import 'cubit/cubit.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const StartScreen(),
          '/input-form': (context) => const InputForm(),
          '/about-us': (context) => const AboutUs(),
          '/edit-mahasiswa': (context) => const EditMahasiswa(
                mahasiswaData: {},
                arguments: 0,
              ),
          '/daftar-mahasiswa': (context) => const DaftarMahasiswa(),
        },
      ),
    );
  }
}
