import 'package:flutter/material.dart';
import 'package:tuesday_fintech_ui/screens/home_screen.dart';
import 'package:tuesday_fintech_ui/screens/statics_screen.dart';
import 'package:tuesday_fintech_ui/widgets/bottom_app_bar.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  final List<Widget> _screens = [
    const HomeScreen(),
    const StaticsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       extendBody: true,
       body: _screens[_currentIndex],
       bottomNavigationBar: BottomAppBarComponent(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
       )
    );
  }
}