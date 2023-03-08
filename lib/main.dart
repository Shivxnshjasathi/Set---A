import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seta/colors.dart';

import 'Registrationform.dart';
import 'intro.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoTween;
  late Animation<double> _textTween;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Intro_screen()));
    });

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });

    _colorAnimation = _controller.drive(ColorTween(
      begin: Ascolors,
      end: bgcolors,
    ));

    _logoTween = Tween<double>(
      begin: 200,
      end: 100,
    ).animate(_controller);

    _textTween = Tween<double>(
      begin: 20,
      end: 25,
    ).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colorAnimation.value,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _logoTween,
              builder: (context, child) => FlutterLogo(
                size: _logoTween.value,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            DefaultTextStyle(
              style: GoogleFonts.alata(
                fontWeight: FontWeight.w100,
                color: Ascolors,
                fontSize: _textTween.value,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Welcome To Admere Community ',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
