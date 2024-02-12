import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import page
import 'package:flutter_project/screens/home.dart';
import 'package:flutter_project/screens/aboutus.dart';
import 'package:flutter_project/screens/add_new_todo.dart';

// import model
import 'package:flutter_project/model/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoListProvider(),
      child: MaterialApp(
        title: 'Localist',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(),
          '/aboutus': (context) => const AboutUs(),
          '/addnewtodo': (context) => const AddNewTodo(),
        },
      ),
    );
  }
}
