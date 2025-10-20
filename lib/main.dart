import 'package:flutter/material.dart';
import 'package:tuesday_fintech_ui/screens/app_screen.dart';
import 'package:tuesday_fintech_ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fin tech UI',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const AppScreen(),
      routes: {
        '/app': (context) => const AppScreen(),
      },
    );
  }
}
