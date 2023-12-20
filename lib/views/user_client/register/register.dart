import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:montirku_v1/data/api_register.dart';
import 'package:montirku_v1/views/user_client/register/verify copy.dart';
import 'package:montirku_v1/data/api_send_otp.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register_State();
}

class _Register_State extends State<Register> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPasswordVisible = false;
  // Tambahkan variabel untuk menangkap status registrasi
  bool isRegistrationSuccessful = false;

  String registeredEmail = '';

  Future<bool> register() async {
    const String apiUrl = '${ApiConfig.baseUrl}${ApiConfig.registerEndpoint}';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'confirmPassword': confirmPasswordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String status = responseData['Status'].toString();

        if (status == '200') {
          // Registrasi berhasil
          final String id = responseData['Data']['Id'].toString();
          print('Registrasi berhasil! ID: $id');
          registeredEmail = emailController.text; // Simpan email

          // Set status registrasi berhasil
          setState(() {
            isRegistrationSuccessful = true;
          });

          // Pindah ke halaman verifikasi email
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Verify(
                registeredEmail: emailController.text,
              ),
            ),
          );

          return true; // Memberikan indikasi keberhasilan registrasi
        } else {
          // Registrasi gagal dengan status lain
          print('Registrasi gagal. Status code: ${response.statusCode}');
          print('Response body: ${response.body}');
          // Tambahkan penanganan kesalahan jika diperlukan
          return false; // Memberikan indikasi kegagalan registrasi
        }
      } else {
        // Registrasi gagal
        print('Registrasi gagal. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Tambahkan penanganan kesalahan jika diperlukan
        return false; // Memberikan indikasi kegagalan registrasi
      }
    } catch (error) {
      // Tangani kesalahan umum
      print('Error during registration: $error');
      return false; // Memberikan indikasi kegagalan registrasi
    }
  }

  Future<void> verifyEmail() async {
    const String apiUrl =
        '${ApiVerifyConfig.baseUrl}${ApiVerifyConfig.verifyEndpoint}';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': registeredEmail, // Menggunakan email yang sudah terdaftar
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String status = responseData['Status'].toString();

        if (status == '200') {
        } else {
          // Tampilkan pesan kesalahan verifikasi email
          print('Verifikasi email gagal. Status code: $status');
        }
      } else {
        // Tampilkan pesan kesalahan verifikasi email
        print('Verifikasi email gagal. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Tangani kesalahan umum
      print('Error selama verifikasi email: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8FCFA),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      backgroundColor: const Color(0xFFE8FCFA),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                "Register",
                style: TextStyle(
                  color: Color(0xFF1E293B),
                  fontSize: 30,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'First Name',
                            style: TextStyle(
                              color: Color(0xFF1E293B),
                              fontSize: 14,
                              fontFamily: 'Gabarito',
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                            hintText: 'Jhon',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors
                                      .black), // Warna border saat input difokuskan

                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors
                                      .white), // Warna border saat input tidak difokuskan

                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Last Name',
                            style: TextStyle(
                              color: Color(0xFF1E293B),
                              fontSize: 14,
                              fontFamily: 'Gabarito',
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                            hintText: 'Doe',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors
                                      .black), // Warna border saat input difokuskan

                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors
                                      .white), // Warna border saat input tidak difokuskan

                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )),
                  ],
                ))
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'E-mail',
                    style: TextStyle(
                      color: Color(0xFF1E293B),
                      fontSize: 14,
                      fontFamily: 'Gabarito',
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
            const SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors
                              .black), // Warna border saat input difokuskan
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors
                              .white), // Warna border saat input tidak difokuskan
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    return null;
                  },
                )),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Password'),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  obscureText: !isPasswordVisible,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors
                              .black), // Warna border saat input difokuskan
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors
                              .white), // Warna border saat input tidak difokuskan
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'must contain 8 char.',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 14,
                      fontFamily: 'Gabarito',
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Confirm Password',
                    style: TextStyle(
                      color: Color(0xFF1E293B),
                      fontSize: 14,
                      fontFamily: 'Gabarito',
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  obscureText: !isPasswordVisible,
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors
                              .black), // Warna border saat input difokuskan
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors
                              .white), // Warna border saat input tidak difokuskan
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF52CBAC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 20,
                ),
                onPressed: () async {
                  // Panggil fungsi register saat tombol ditekan
                  bool registrationSuccess = await register();

                  // Jika registrasi berhasil, lanjutkan dengan verifikasi email
                  if (registrationSuccess) {
                    await verifyEmail();
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  child: SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Create Account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Gabarito',
                              fontWeight: FontWeight.w500,
                            ),
                          ))),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'By continuing, you agree to our ',
                    style: TextStyle(
                      color: Color(0xFF475569),
                      fontSize: 14,
                      fontFamily: 'Gabarito',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                      letterSpacing: 0.14,
                    ),
                  ),
                  TextSpan(
                    text: 'Terms of Service',
                    style: TextStyle(
                      color: Color(0xFF3C9AFB),
                      fontSize: 14,
                      fontFamily: 'Gabarito',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      height: 0.11,
                      letterSpacing: 0.17,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(
                      color: Color(0xFF475569),
                      fontSize: 14,
                      fontFamily: 'Gabarito',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                      letterSpacing: 0.14,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: Color(0xFF3C9AFB),
                      fontSize: 14,
                      fontFamily: 'Gabarito',
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      height: 0.11,
                      letterSpacing: 0.17,
                    ),
                  ),
                  TextSpan(
                    text: '.',
                    style: TextStyle(
                      color: Color(0xFF475569),
                      fontSize: 14,
                      fontFamily: 'Gabarito',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                      letterSpacing: 0.14,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
          ],
        ),
      )),
    );
  }
}
