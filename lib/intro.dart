
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:seta/Registrationform.dart';
import 'package:seta/login.dart';
import 'colors.dart';

class Intro_screen extends StatefulWidget {
  const Intro_screen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Intro_screen();
  }
}

class _Intro_screen extends State<Intro_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.09,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    children: [
                      SizedBox(),
                      Text(
                        'Hello Producer ! ',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.alata(
                          fontWeight: FontWeight.bold,
                          color: Ascolors,
                          fontSize: 50,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(),
                      Text(
                        'Welcome To Admere Community ',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.alata(
                          fontWeight: FontWeight.w100,
                          color: Ascolors,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SizedBox(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: LoginForm(),
                              ));
                        },
                        child: Container(
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Ascolors,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              'Login',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w100,
                                color: bgcolors,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(),
                Text(
                  'You are not a member ?',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.alata(
                    fontWeight: FontWeight.w100,
                    color: Ascolors,
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: RegistrationForm(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Register',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.alata(
                        fontWeight: FontWeight.w100,
                        color: Colors.blue,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}