import 'package:calc_bmi_app/constants/colors.dart';
import 'package:calc_bmi_app/screen/input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: AppBarColor.indigo,
        useMaterial3: false,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: AppBarColor.indigo,
        useMaterial3: false,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(backgroundColor: AppBarColor.indigo),
      ),
      home: const MyHomePage(title: 'BMI Calc App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const InputScreen(),
    );
  }
}
