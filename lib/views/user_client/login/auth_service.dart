import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:montirku_v1/data/api_login.dart';
import 'package:montirku_v1/views/navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<void> saveAuthToken(String authToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', authToken);
  }

  Future<void> loginUser(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) async {
    const String apiUrl = '${LoginConfig.baseUrl}${LoginConfig.loginEndpoint}';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'Email': emailController.text,
          'Password': passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Berhasil login
        final responseData = json.decode(response.body);
        final authToken = responseData['Data']
            ['AuthToken']; // Sesuaikan dengan struktur responsenya
        await saveAuthToken(authToken);
        // Navigasi ke halaman HomeScreen atau lakukan tindakan lain
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const MyNavigator(),
          ),
        );
      } else {
        // Gagal login, tampilkan pesan atau lakukan tindakan lain
        print('Login failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Tambahkan penanganan kesalahan jika diperlukan
      }
    } catch (error) {
      // Tangani kesalahan umum
      print('Error during login: $error');
      // Tambahkan penanganan kesalahan jika diperlukan
    }
  }
}
