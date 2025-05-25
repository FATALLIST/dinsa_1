// lib/ui/screens/splash/splash_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay then navigate
    Timer(const Duration(seconds: 4), () {
      context.go('/welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: Image.asset(
            'assets/images/dinsa_logo.png',
            width: 150,
            height: 150,
          ),
        ),
      ),
    );
  }
}
