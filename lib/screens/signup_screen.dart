import 'dart:typed_data';
import 'package:circlify/resources/auth_methods.dart';
import 'package:circlify/screens/login_screen.dart';
import 'package:circlify/utils/colors.dart';
import 'package:circlify/utils/toast.dart';
import 'package:circlify/utils/utils.dart';
import 'package:circlify/widgets/blue_button.dart';
import 'package:circlify/widgets/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _usernamecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _usernamecontroller.dispose();
    _passwordcontroller.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
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
                    'Sign Up',
                    style: TextStyle(fontSize: 35, color: primaryColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text.rich(TextSpan(
                    text: 'Already have a Account ? ',
                    style: const TextStyle(color: secondaryColor, fontSize: 17),
                    children: [
                      TextSpan(
                          text: 'Sign In',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                )),
                          style: const TextStyle(
                              color: primaryColor, fontSize: 20))
                    ],
                  )),
                ),
                const SizedBox(
                  height: 24,
                ),
                //Profile Picture Selection
                GestureDetector(
                  onTap: selectImage,
                  child: Positioned(
                    bottom: 200,
                    left: 60,
                    height: 100,
                    width: 100,
                    child: Center(
                      child: _image != null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.transparent,
                              backgroundImage: MemoryImage(_image!))
                          : const CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage("assets/images/user.png"),
                            ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFieldInput(
                    textEditingController: _usernamecontroller,
                    isPass: false,
                    hintText: 'Enter Username',
                    textInputType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //EmaiL Box
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFieldInput(
                    textEditingController: _emailcontroller,
                    isPass: false,
                    hintText: 'Enter Email',
                    textInputType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Password Box
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFieldInput(
                    textEditingController: _passwordcontroller,
                    isPass: true,
                    hintText: 'Enter Password',
                    textInputType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //Register Button
                BlueButton(
                    title: 'Register',
                    onpress: () => AuthMethods()
                        .signup(
                            username: _usernamecontroller.text,
                            email: _emailcontroller.text,
                            password: _passwordcontroller.text,
                            file: _image!)
                        .then((value) => Utils()
                            .toastmessagegreen('Register Sucessfully!!!'))
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            )))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
