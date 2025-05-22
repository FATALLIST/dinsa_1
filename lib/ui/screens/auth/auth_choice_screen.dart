// lib/ui/screens/auth_choice_screen.dart

import 'package:flutter/material.dart'; import 'login_screen.dart'; import 'register_screen.dart'; import 'package:provider/provider.dart'; import '../../services/auth_service.dart';

class AuthChoiceScreen extends StatelessWidget { const AuthChoiceScreen({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { return Scaffold( body: Center( child: Padding( padding: const EdgeInsets.all(32.0), child: Column( mainAxisAlignment: MainAxisAlignment.center, children: [ const Text( 'Selamat Datang di DINSA', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ), const SizedBox(height: 24), ElevatedButton( onPressed: () { Navigator.push(context, MaterialPageRoute(builder: () => const LoginScreen())); }, child: const Text('Masuk'), ), TextButton( onPressed: () { Navigator.push(context, MaterialPageRoute(builder: () => const RegisterScreen())); }, child: const Text('Daftar'), ), const SizedBox(height: 24), const Divider(), const SizedBox(height: 24), ElevatedButton.icon( onPressed: () async { final auth = context.read<AuthService>(); final userCredential = await auth.signInWithGoogle(); if (userCredential != null) { Navigator.pushReplacementNamed(context, '/home'); } }, icon: const Icon(Icons.g_mobiledata), label: const Text('Masuk dengan Google'), ), ElevatedButton.icon(
  onPressed: () async {
    final auth = context.read<AuthService>();
    final userCredential = await auth.signInWithFacebook();
    if (userCredential != null) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  },
  icon: const Icon(Icons.facebook),
  label: const Text('Masuk dengan Facebook'),
),
 TextButton( onPressed: () { Navigator.pushReplacementNamed(context, '/home'); }, child: const Text('Masuk sebagai Tamu'), ), ], ), ), ), ); } }

