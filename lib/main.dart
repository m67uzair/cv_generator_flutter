import 'package:cv_generator/screens/add_education_screen.dart';
import 'package:cv_generator/screens/add_experience_screen.dart';
import 'package:cv_generator/screens/personal_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import "package:cv_generator/model/user_data.dart";
import 'package:cv_generator/screens/fill_details_screen.dart';
import 'helper/AuthPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider<UserData>(
    create: (context) => UserData(),
    child: const MyApp(),
  ));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'CV Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snaphot) {
          if (snaphot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snaphot.hasData) {
            return const AddEducationScreen();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
