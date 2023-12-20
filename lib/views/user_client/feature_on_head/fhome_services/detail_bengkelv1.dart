import 'package:flutter/material.dart';

class DetailMontir extends StatefulWidget {
  const DetailMontir({super.key});

  @override
  State<DetailMontir> createState() => _DetailMontirState();
}

class _DetailMontirState extends State<DetailMontir> {
  @override
  Widget build(BuildContext context) {
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
                        padding: const EdgeInsets.only(left: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/1.jpeg', //BengkelPhotoUrl
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
                            const Text(
                              'Name',
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
                            const Text(
                              'DistrictName, CityName, PhoneNumber',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            const Text(
                              'Category',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 239, 150, 27)),
                            ),
                            const Text(
                              'Status',
                              style: TextStyle(
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
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.star, size: 17),
                                        Text(
                                          'AvgRating',
                                          style: TextStyle(fontSize: 12),
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

                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        children: [
                                          Text('Name'), //name Services
                                          Text('Price') //price Services
                                        ],
                                      ),
                                      ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Tambah')),
                                    ],
                                  ),
                                ),
                              )
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
                                              icon:
                                                  const Icon(Icons.directions))
                                        ],
                                      ),
                                      const Text('Address'),
                                      const Text('Latitude'),
                                      const Text('Longitude'),
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
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text('Waktu Operasional'),
                                      SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Day'),
                                          Text('OpenTime - CloseTime'),
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
