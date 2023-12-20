import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:montirku_v1/data/api_verify_otp.dart';
import 'package:montirku_v1/views/user_client/login/login.dart';
// import 'package:montirku_v1/views/user_client/register/verify copy.dart';
// import 'package:montirku_v1/data/api_register.dart';

class Verify extends StatefulWidget {
  final String registeredEmail;

  const Verify({Key? key, required this.registeredEmail}) : super(key: key);

  @override
  State<Verify> createState() => _Verify_State();
}

class _Verify_State extends State<Verify> {
  TextEditingController codeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isResendButtonEnabled = true;
  int countdownSeconds = 59;

  void startCountdown() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (timer) {
      if (countdownSeconds == 0) {
        setState(() {
          isResendButtonEnabled = true;
          timer.cancel();
        });
      } else {
        setState(() {
          countdownSeconds--;
        });
      }
    });
  }

  Future<void> verifyAccount(String email) async {
    try {
      const String apiUrl =
          '${ApiOtpConfig.baseUrl}${ApiOtpConfig.verifyEndpoint}';
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email':
              widget.registeredEmail, // Menggunakan email yang sudah terdaftar
          'CodeOtp': codeController.text,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String status = responseData['Status'].toString();

        if (status == '200') {
          // Verifikasi berhasil, pindah ke HomeScreen
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
          );
        } else {
          // Verifikasi gagal, tampilkan pesan kesalahan atau handle dengan cara lain
          print('Verifikasi gagal. Status code: $status');
        }
      } else {
        // Tangani respons dengan status code yang tidak berhasil
        print('Verifikasi gagal. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      // Tangani kesalahan umum
      print('Error selama verifikasi OTP: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8FCFA),
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
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
              padding: EdgeInsets.only(top: 98),
              child: Text(
                "Verify Account",
                style: TextStyle(
                  color: Color(0xFF1E293B),
                  fontSize: 30,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Code has been send to ',
                        style: TextStyle(
                          color: Color(0xFF475569),
                          fontSize: 14,
                          fontFamily: 'Gabarito',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'johndoe@gmail.com',
                        style: TextStyle(
                          color: Color(0xFF1E293B),
                          fontSize: 14,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: '.',
                        style: TextStyle(
                          color: Color(0xFF475569),
                          fontSize: 14,
                          fontFamily: 'Gabarito',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                )),
            const Text('Enter the code to verify your account.',
                style: TextStyle(
                  color: Color(0xFF475569),
                  fontSize: 14,
                  fontFamily: 'Gabarito',
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter Code',
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
                  controller: codeController,
                  decoration: InputDecoration(
                    hintText: '6 Digit Code',
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
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: GestureDetector(
                onTap: () {
                  verifyAccount(emailController.text);
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Didn’t Receive Code? ",
                        style: TextStyle(
                          color: Color(0xFF475569),
                          fontSize: 14,
                          fontFamily: 'Gabarito',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Resend Code',
                        style: TextStyle(
                          color: isResendButtonEnabled
                              ? const Color(0xFF94A3B8)
                              : Colors.grey,
                          fontSize: 14,
                          fontFamily: 'Gabarito',
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const TextSpan(
                        text: '.',
                        style: TextStyle(
                          color: Color(0xFF475569),
                          fontSize: 14,
                          fontFamily: 'Gabarito',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
                'Resend code in ${countdownSeconds.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  color: Color(0xFF475569),
                  fontSize: 14,
                  fontFamily: 'Gabarito',
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(height: 200),
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
                onPressed: () {
                  verifyAccount(emailController.text);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  child: SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Verify Account',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ),
            ),
            const SizedBox(height: 130),
          ],
        ),
      )),
    );
  }
}
