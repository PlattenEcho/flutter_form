import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form/ui/shared/gaps.dart';
import 'package:flutter_form/ui/shared/theme.dart';
import 'package:flutter_form/ui/widgets/buttons.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/bg_start.png',
                  ),
                  fit: BoxFit.cover)),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(flex: 2, child: SizedBox()),
              const Expanded(
                flex: 1,
                child: Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Button(
                            text: "Isi Form",
                            textColor: kWhiteColor,
                            startColor: kPrimary2Color,
                            endColor: kPrimaryColor,
                            onPressed: () {
                              Navigator.pushNamed(context, '/input-form');
                            }),
                        gapH(21),
                        ButtonOutline(
                            text: "About Us",
                            textColor: kPrimary2Color,
                            borderColor: kPrimaryColor,
                            onPressed: () {
                              Navigator.pushNamed(context, '/about-us');
                            }),
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
