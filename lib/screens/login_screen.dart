import 'package:circlify/resources/auth_methods.dart';
import 'package:circlify/responsive/mobileScreenlayout.dart';
import 'package:circlify/responsive/responsive.dart';
import 'package:circlify/responsive/webScreenlayout.dart';
import 'package:circlify/screens/signup_screen.dart';
import 'package:circlify/utils/colors.dart';
import 'package:circlify/widgets/blue_button.dart';
import 'package:circlify/widgets/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _SignUpState();
}

class _SignUpState extends State<LoginScreen> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        //Full Screen
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Sign In Text
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 35, color: primaryColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text.rich(TextSpan(
                    text: 'Create an Account ? ',
                    style: const TextStyle(color: secondaryColor, fontSize: 15),
                    children: [
                      TextSpan(
                          text: 'Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUp(),
                                )),
                          style: const TextStyle(
                              color: primaryColor, fontSize: 18))
                    ],
                  )),
                ),
                //LOGO
                Center(
                  child: SvgPicture.asset(
                    'assets/images/logo_white.svg',
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Username Box
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFieldInput(
                    textEditingController: _emailcontroller,
                    isPass: false,
                    hintText: 'Enter Email',
                    textInputType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                //Password Box
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFieldInput(
                    textEditingController: _passwordcontroller,
                    isPass: true,
                    hintText: 'Enter Password',
                    textInputType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                //Register Button
                BlueButton(
                    title: "Let's Go",
                    onpress: () => AuthMethods()
                        .loginUser(
                            email: _emailcontroller.text.toString(),
                            password: _passwordcontroller.text.toString())
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ResponsiveLayout(
                                    webscreenLayout: WebScreenLayout(),
                                    mobilescreenLayout:
                                        MobileScreenLayout()))))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
