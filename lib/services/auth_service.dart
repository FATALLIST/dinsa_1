// lib/services/auth_service.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static const _baseUrl = 'https://your-domain.com/api';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Login dengan email & password
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await _storage.write(key: 'token', value: data['token']);
        return true;
      }
    } catch (e) {
      // Handle network or parsing error
      debugPrint('Login error: \$e');
    }
    return false;
  }

  /// Register dengan email & password
  Future<bool> register(String name, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password,
        }),
      );
      if (response.statusCode == 201) return true;
      // Parse error message
      final _ = jsonDecode(response.body)['message'];
      debugPrint('Register failed: \$error');
    } catch (e) {
      debugPrint('Register error: \$e');
    }
    return false;
  }

 final FirebaseAuth _auth = FirebaseAuth.instance;

Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        return await _auth.signInWithCredential(facebookAuthCredential);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  /// Login dengan Google atau Facebook token
  Future<String?> socialLogin(String provider, String token) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/\$provider'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'token': token}),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await _storage.write(key: 'token', value: data['token']);
        return data['user']['id']; // return user ID or other info
      }
    } catch (e) {
      debugPrint('Social login error: \$e');
    }
    return null;
  }

  /// Logout, hapus token dan cache
  Future<void> logout() async {
    await _storage.deleteAll();
  }

  /// Ambil token yang tersimpan (cached)
  String? _cachedToken;
  Future<String?> getToken() async {
    _cachedToken ??= await _storage.read(key: 'token');
    return _cachedToken;
  }

  /// Cek apakah user sudah login
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }
}
