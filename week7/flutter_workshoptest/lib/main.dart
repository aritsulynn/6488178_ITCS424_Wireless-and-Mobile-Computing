import 'package:flutter/material.dart';

import 'package:flutter_workshoptest/pages/HomePage.dart';
import 'package:flutter_workshoptest/pages/Launcher.dart';
import 'package:flutter_workshoptest/pages/EditProfilePage.dart';
import 'package:flutter_workshoptest/pages/LoginPage.dart';
import 'package:flutter_workshoptest/pages/RegisterPage.dart';
import 'package:flutter_workshoptest/pages/ProfilePage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Workshop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/profile': (context) => ProfilePage(),
        '/editprofile': (context) => EditProfilePage(),
        '/launcher': (context) => Launcher(),
      },
    );
  }
}
