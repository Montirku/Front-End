import 'package:flutter/material.dart';
import 'package:montirku_v1/views/user_client/home/fnearby/nearby.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool? _value1 = false;
  bool? _value2 = false;
  bool? _value3 = false;
  bool? _value4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8FCFA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 341,
              decoration: ShapeDecoration(
                color: const Color(0xFFF8A7A7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '                 Cari Bantuan! \nSegera cari bengkel terdekat berdasarkan kebutuhanmu!',
                  style: TextStyle(
                    color: Color(0xFF1E293B),
                    fontSize: 20,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
                width: 341,
                decoration: ShapeDecoration(
                  color: const Color(0xFFB4F8FC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        title: Text('Motor'),
                        value: _value1,
                        onChanged: (bool? value) {
                          setState(() {
                            _value1 = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, // Untuk menempatkan checkbox di sebelah kiri teks
                      ),
                      CheckboxListTile(
                        title: Text('Mobil'),
                        value: _value4,
                        onChanged: (bool? value) {
                          setState(() {
                            _value4 = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, // Untuk menempatkan checkbox di sebelah kiri teks
                      ),
                      CheckboxListTile(
                        title: Text('Ketersediaan Toko/Bengkel'),
                        value: _value2,
                        onChanged: (bool? value) {
                          setState(() {
                            _value2 = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        title: Text('Ketersediaan Perbaikan di Tempat'),
                        value: _value3,
                        onChanged: (bool? value) {
                          setState(() {
                            _value3 = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      SizedBox(height: 15)
                    ],
                  ),
                )),
            const SizedBox(height: 25),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapPages()),
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
                          'Cari',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      )),
      // bottomNavigationBar: Navigator(),
    );
  }
}
