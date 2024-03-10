import 'package:circlify/firebase_options.dart';
import 'package:circlify/responsive/mobileScreenlayout.dart';
import 'package:circlify/responsive/responsive.dart';
import 'package:circlify/responsive/webScreenlayout.dart';
import 'package:circlify/screens/welcome_screen.dart';
import 'package:circlify/utils/colors.dart';
import 'package:circlify/utils/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MaterialApp(
          title: 'Circlify',
          theme: ThemeData.dark()
              .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return const ResponsiveLayout(
                        webscreenLayout: WebScreenLayout(),
                        mobilescreenLayout: MobileScreenLayout());
                  }
                } else if (snapshot.hasError) {
                  Utils().toastmessage('${snapshot.error}');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                }
                return const WelcomeScreen();
              })),
    );
  }
}
