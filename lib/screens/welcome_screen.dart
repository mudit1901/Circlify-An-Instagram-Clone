import 'package:circlify/screens/signup_screen.dart';
import 'package:circlify/widgets/blue_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomRight,
              colors: [
                Colors.black,
                Colors.blue[900]!,
              ],
            ),
          ),
          child: Column(
            children: [
              //LOGO
              Expanded(
                  child: Container(
                child: SvgPicture.asset('assets/images/logo_white.svg'),
              )),
              //Slogan
              Expanded(
                  child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    const Text('Find New Friends\n With Soulmate!',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                        'With soulmate you will find new\n friends from various countries and\nregions throughout the region',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white70)),
                    const SizedBox(
                      height: 40,
                    ),
                    BlueButton(
                      title: 'Get Started',
                      onpress: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          )),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
