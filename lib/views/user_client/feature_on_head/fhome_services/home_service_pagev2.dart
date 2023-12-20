import 'package:flutter/material.dart';

import 'list_worksps.dart';

class HomeServicePage extends StatefulWidget {
  const HomeServicePage({super.key});

  @override
  State<HomeServicePage> createState() => _HomeServicePageState();
}

class _HomeServicePageState extends State<HomeServicePage> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredWorkshopData = [];
  List<Map<String, dynamic>> workshopData = [];

  void filterWorkshops(String query) {
    setState(() {
      filteredWorkshopData = workshopData
          .where((workshop) =>
              workshop['Name'].toLowerCase().contains(query.toLowerCase()) ||
              workshop['Status'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Widget buildWorkshopList() {
    return Expanded(
      child: ListWorksps(
        workshopData: searchController.text.isNotEmpty
            ? filteredWorkshopData
            : workshopData,
      ),
    );
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
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
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
                        onChanged: (query) {
                          filterWorkshops(query);
                        },
                        decoration: InputDecoration(
                          hintText: 'Cari berdasarkan status atau nama',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              // Panggil metode pencarian saat tombol pencarian ditekan
                              filterWorkshops(searchController.text);
                            },
                          ),
                        ),
                      );
                    },
                    onSearch: (String query) {
                      // Panggil metode pencarian saat tombol pencarian ditekan atau "Enter" ditekan
                      filterWorkshops(query);
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
