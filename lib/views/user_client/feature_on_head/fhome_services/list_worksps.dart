import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:montirku_v1/data/api_get_all_bengkel.dart';

import 'detail_bengkelv5.dart';

class ListWorksps extends StatefulWidget {
  final List<Map<String, dynamic>> workshopData;

  const ListWorksps({Key? key, required this.workshopData}) : super(key: key);

  @override
  State<ListWorksps> createState() => _ListWorkspsState();
}

class _ListWorkspsState extends State<ListWorksps> {
  List<Map<String, dynamic>> workshopData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      const String apiUrl =
          '${GetAllConfig.baseUrl}${GetAllConfig.getAllEndpoint}';
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> bengkels = responseData['Bengkels'];

        setState(() {
          workshopData = List<Map<String, dynamic>>.from(bengkels);
        });
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: workshopData.map((workshop) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 350,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFB4F8FC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    workshop[
                                        'BengkelPhotoUrl'], // Ganti dengan key yang sesuai di API
                                    height: 75,
                                    width: 75,
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
                                      workshop['Name'],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 15),
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
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${workshop['DistrictName']}, ${workshop['CityName']}, \n${workshop['PhoneNumber']}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      '${workshop['Category']}',
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 239, 150, 27),
                                      ),
                                    ),
                                    Text(
                                      '${workshop['Status']}',
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 239, 150, 27),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.work, size: 17),
                                                Text(
                                                  '14 Tahun', // Ganti dengan key yang sesuai di API
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 30),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Row(
                                              children: [
                                                const Icon(Icons.star,
                                                    size: 17),
                                                Text(
                                                  workshop['AvgRating']
                                                      .toString(), // Ganti dengan key yang sesuai di API
                                                  style:
                                                      TextStyle(fontSize: 12),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      'Jasa Mulai Dari',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      workshop['StartingPrice']
                                          .toString(), // Ganti dengan key yang sesuai di API
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 225, 180, 44),
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigasi ke halaman tertentu
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailMontir(
                                                bengkelId: workshop['BengkelId']
                                                    .toString())));
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.amber,
                                    ),
                                    child: const Center(
                                        child: Text('Pilih Montir')),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
