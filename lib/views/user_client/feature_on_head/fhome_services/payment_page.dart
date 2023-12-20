import 'package:flutter/material.dart';

import '../../../navigator.dart';

class PaymentPage extends StatefulWidget {
  final double totalHarga;

  const PaymentPage({Key? key, required this.totalHarga}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool? _value1 = false;
  bool? _value2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 56,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-2, -0.00),
                end: Alignment(1, 0),
                colors: [
                  Color.fromARGB(0, 101, 198, 247),
                  Color.fromARGB(255, 12, 153, 223)
                ],
              ),
            ),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Expanded(
                    child: Center(
                        child: Text(
                  'Payment Detail',
                  style: TextStyle(fontSize: 20),
                )))
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: const ShapeDecoration(
              color: Color(0xFFB4F8FC),
              shape: RoundedRectangleBorder(),
            ),
            child: Column(
              children: [
                const Text('TOTAl'),
                Text('Rp.${widget.totalHarga.toString()}'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFB4F8FC)),
              child: Column(
                children: [
                  const Text('Payment Method'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/bank_card.png',
                              width: 60,
                              height: 60,
                            ),
                            const Text('Bank Card')
                          ],
                        ),
                        Checkbox(
                          value: _value1,
                          onChanged: (bool? value) {
                            setState(() {
                              _value1 = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/e-wallet.png',
                              width: 60,
                              height: 60,
                            ),
                            const Text('E-Wallet')
                          ],
                        ),
                        Checkbox(
                          value: _value2,
                          onChanged: (bool? value) {
                            setState(() {
                              _value2 = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Menampilkan dialog ucapan terimakasih
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Terimakasih!'),
                            content: Text(
                                'Pembayaran sebesar Rp.${widget.totalHarga.toString()} telah diterima.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const MyNavigator(),
                                    ),
                                  );
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Bayar'),
                  ),
                  const SizedBox(height: 15)
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
