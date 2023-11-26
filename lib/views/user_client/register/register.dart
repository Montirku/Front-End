import 'package:flutter/material.dart';
import 'package:montirku_v1/views/user_client/Home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register_State();
}

class _Register_State extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
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
                          controller: emailController,
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
                          controller: emailController,
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
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
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
