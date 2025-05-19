// lib/ui/screens/auth/auth_choice_screen.dart

import 'package:flutter/material.dart';

class AuthChoiceScreen extends StatelessWidget {
  const AuthChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset('assets/images/dinsa-logo.png', height: 100),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/auth/login'),
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, '/auth/register'),
                style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                child: const Text('Daftar'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/home'),
                style: TextButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                child: const Text('Masuk sebagai Tamu'),
              ),
              const SizedBox(height: 32),
              const Text('atau masuk dengan'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Image.asset('assets/images/google_icon.png'),
                    iconSize: 3,
                    onPressed: () {
                      // TODO: Google login
                    },
                  ),
                  const SizedBox(width: 24),
                  IconButton(
                    icon: Image.asset('assets/images/facebook_icon.png'),
                    iconSize: 40,
                    onPressed: () {
                      // TODO: Facebook login
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
