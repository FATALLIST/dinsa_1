// lib/routes/app_routes.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/screens/splash/splash_screen.dart';
import '../ui/screens/welcome/welcome_screen.dart';
import '../ui/screens/auth/auth_choice_screen.dart';
import '../ui/screens/auth/login_screen.dart';
import '../ui/screens/auth/register_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/activities/activities_screen.dart';
import '../ui/screens/development/development_screen.dart';
import '../ui/screens/reports/reports_screen.dart';
import '../ui/screens/profile/profile_screen.dart';
import '../ui/screens/admin/master/master_admin_screen.dart';
import '../ui/screens/admin/caregiver/caregiver_admin_screen.dart';
import '../services/auth_service.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    refreshListenable: _AuthListener(),
    redirect: (context, state) async {
      final authService = AuthService();
      final loggedIn = await authService.isLoggedIn();
      final goingTo = state.uri.toString();
      // if not logged in, redirect to auth choice
      if (!loggedIn && goingTo != '/auth') {
        return '/auth';
      }
      // if logged in and on auth screens, go home
      if (loggedIn && goingTo == '/auth') {
        return '/home';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/welcome',
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/auth',
        name: 'authChoice',
        builder: (context, state) => const AuthChoiceScreen(),
      ),
      GoRoute(
        path: '/auth/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/auth/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/activities',
        name: 'activities',
        builder: (context, state) => const ActivitiesScreen(),
      ),
      GoRoute(
        path: '/development',
        name: 'development',
        builder: (context, state) => const DevelopmentScreen(),
      ),
      GoRoute(
        path: '/reports',
        name: 'reports',
        builder: (context, state) => const ReportsScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/admin/master',
        name: 'masterAdmin',
        builder: (context, state) => const MasterAdminScreen(),
      ),
      GoRoute(
        path: '/admin/caregiver',
        name: 'caregiverAdmin',
        builder: (context, state) => const CaregiverAdminScreen(),
      ),
    ],
  );
}

class _AuthListener extends ChangeNotifier {
  _AuthListener() {
    _init();
  }

  void _init() async {
    // Listen to auth changes and notify listeners
    // Could use a Stream or ValueNotifier from AuthService
  }
}
