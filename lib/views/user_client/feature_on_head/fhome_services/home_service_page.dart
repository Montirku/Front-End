import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../data/api_get_all_bengkel.dart';
import 'list_worksps.dart';

class HomeServicePage extends StatefulWidget {
  const HomeServicePage({super.key});

  @override
  State<HomeServicePage> createState() => _HomeServicePageState();
}

class _HomeServicePageState extends State<HomeServicePage> {
  late List<Map<String, dynamic>> workshopData;
  late List<Map<String, dynamic>> originalWorkshopData;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData(); // Memanggil metode fetchData saat inisialisasi
  }

  Future<void> fetchData() async {
    try {
      const String apiUrl =
          '${GetAllConfig.baseUrl}${GetAllConfig.getAllEndpoint}';
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> allBengkels = responseData['Bengkels'];

        setState(() {
          originalWorkshopData = List<Map<String, dynamic>>.from(allBengkels);
          workshopData = originalWorkshopData;
        });
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to load data');
    }
  }

  void onSearch(String query) {
    setState(() {
      workshopData = originalWorkshopData
          .where((workshop) =>
              workshop['Name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

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
                begin: Alignment(-1.00, -0.00),
                end: Alignment(1, 0),
                colors: [Color(0x005DB9E6), Color(0xFF5DB9E6)],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/Logo2.png'),
                Image.asset('assets/images/notif.png'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            color: const Color.fromARGB(255, 66, 183, 237),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/my-location.png'),
                    Text('Lokasi Anda'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SearchAnchor(
                    builder: (BuildContext context) {
                      return TextField(
                        controller: searchController,
                        onChanged:
                            onSearch, // Perbarui pencarian saat nilai berubah
                        decoration: InputDecoration(
                          hintText: 'Cari berdasarkan status atau nama',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              // Panggil metode pencarian saat tombol pencarian ditekan
                              onSearch(searchController.text);
                            },
                          ),
                        ),
                      );
                    },
                    onSearch: (String query) {
                      // Panggil metode pencarian saat tombol pencarian ditekan atau "Enter" ditekan
                      onSearch(query);
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          buildWorkshopList(),
        ],
      )),
    );
  }
}

class SearchAnchor extends StatelessWidget {
  final Widget Function(BuildContext) builder;
  final void Function(String) onSearch;

  const SearchAnchor(
      {super.key, required this.builder, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}

Widget buildWorkshopList() {
  return const Expanded(
    child: ListWorksps(
      workshopData: [],
    ), // Use the ListWorksps widget here
  );
}
