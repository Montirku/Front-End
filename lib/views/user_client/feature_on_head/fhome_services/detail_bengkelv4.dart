import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../data/api_detail_montir.dart';

class DetailMontir extends StatefulWidget {
  const DetailMontir({super.key});

  @override
  State<DetailMontir> createState() => _DetailMontirState();
}

class _DetailMontirState extends State<DetailMontir> {
  bool isButtonPressed = false;
  List<bool> isButtonPressedList = [];
  Map<String, dynamic>? apiData;
  double totalHarga = 0;

  void tambahHarga(double harga) {
    setState(() {
      totalHarga += harga;
    });
  }

  Future<void> fetchData(String id) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${DetailConfig.baseUrl}${DetailConfig.detailEndpoint.replaceFirst(':id', id)}',
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          apiData = json.decode(response.body);

          // Inisialisasi isButtonPressedList dengan false untuk setiap layanan
          isButtonPressedList = List.generate(
            apiData?['Bengkel']['Services']?.length ?? 0,
            (index) => false,
          );
        });
      } else {
        throw Exception(
            'Failed to load data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  void initState() {
    fetchData('1');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('apiData: $apiData');

    // for (var service in apiData?['Bengkel']['Services'] ?? []) {
    //   print('Service: $service');
    // }
    // for (var operationalTime in apiData?['Bengkel']['OperationalTime'] ?? []) {
    //   print('OperationalTime: $operationalTime');
    // }
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                      onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                  const Expanded(
                      child: Center(
                          child: Text(
                    'Detail Montir',
                    style: TextStyle(fontSize: 20),
                  )))
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const ShapeDecoration(
                color: Color(0xFFB4F8FC),
                shape: RoundedRectangleBorder(),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            '${apiData?['Bengkel']['BengkelPhotoUrl']}',
                            height: 90,
                            width: 90,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 75,
                                width: 75,
                                color: Colors
                                    .grey, // Warna latar belakang untuk gambar yang tidak tersedia
                                child: const Icon(
                                  Icons.image_not_supported,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${apiData?['Bengkel']['Name']}',
                              style: TextStyle(fontSize: 15),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/my-location.png',
                                  height: 20,
                                  width: 20,
                                ),
                                const Text(
                                  '7.1 Km Dari Rumah Anda',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                            Text(
                              '${apiData?['Bengkel']['Address']['DistrictName']}, ${apiData?['Bengkel']['Address']['CityName']}, \n${apiData?['Bengkel']['PhoneNumber']}',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 12),
                            ),
                            Text(
                              '${apiData?['Bengkel']['Category']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 239, 150, 27)),
                            ),
                            Text(
                              '${apiData?['Bengkel']['Status']}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 239, 150, 27)),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all()),
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.work, size: 17),
                                        Text(
                                          '14 Tahun',
                                          style: TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all()),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.star, size: 17),
                                        Text(
                                          '${apiData?['Bengkel']['AvgRating']}',
                                          style: const TextStyle(fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            DefaultTabController(
              length: 2, // Jumlah tab yang diinginkan
              child: Column(
                children: [
                  // Tab Bar
                  const TabBar(
                    tabs: [
                      Tab(text: 'Layanan'),
                      Tab(text: 'Profile'),
                    ],
                    labelColor: Colors.blue, // Warna teks tab yang aktif
                    unselectedLabelColor:
                        Colors.grey, // Warna teks tab yang tidak aktif
                  ),

                  // Konten Tab
                  SizedBox(
                    height: 800,
                    child: TabBarView(
                      children: [
                        // Konten untuk Tab 1

                        // Konten untuk Tab 1
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              // Iterasi untuk setiap layanan (service)
                              for (var index = 0;
                                  index <
                                      (apiData?['Bengkel']['Services']
                                              ?.length ??
                                          0);
                                  index++)
                                Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${apiData?['Bengkel']['Services'][index]['Name']}'),
                                            Text(
                                                '${apiData?['Bengkel']['Services'][index]['Price']}'),
                                          ],
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // logika toggle
                                            setState(() {
                                              // Ganti nilai variabel boolean untuk menentukan apakah tombol sudah ditekan atau belum
                                              isButtonPressedList[index] =
                                                  !isButtonPressedList[index];
                                            });

                                            if (isButtonPressedList[index]) {
                                              // Tambahkan harga ke total jika tombol ditekan
                                              tambahHarga(apiData?['Bengkel']
                                                  ['Services'][index]['Price']);
                                            } else {
                                              // Kurangkan harga dari total jika tombol dibatalkan
                                              tambahHarga(-apiData?['Bengkel']
                                                  ['Services'][index]['Price']);
                                            }

                                            // Tampilkan modal bottom sheet dengan total harga
                                            showModalBottomSheet(
                                              context: context,
                                              builder: (context) => Container(
                                                padding: EdgeInsets.all(16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                        'Total Harga: $totalHarga'),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        // Tutup modal bottom sheet
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                          'Tambah lagi'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: isButtonPressedList[index]
                                                ? Colors.red
                                                : null,
                                          ),
                                          child: Text(isButtonPressedList[index]
                                              ? 'Batal'
                                              : 'Tambah'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),

                        // Konten untuk Tab 2
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Alamat'),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.directions))
                                        ],
                                      ),
                                      Text(
                                          '${apiData?['Bengkel']['Address']['Address']}'),
                                      Text(
                                          'Latitude: ${apiData?['Bengkel']['Address']['Latitude']}'),
                                      Text(
                                          'Longitude: ${apiData?['Bengkel']['Address']['Longitude']}'),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Text('Waktu Operasional'),
                                      const SizedBox(height: 15),
                                      // Iterasi untuk setiap waktu operasional
                                      for (var operationalTime
                                          in apiData?['Bengkel']
                                                  ['OperationalTime'] ??
                                              [])
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${operationalTime['Day']}'),
                                            Text(
                                                '${operationalTime['OpenTime']} - ${operationalTime['CloseTime']}'),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
