import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:http/http.dart' as http;
import '../../../../data/api_filter_bengkel.dart';
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
  List<String> selectedFilters = [];
  Future<void> fetchFilteredWorkshops() async {
    final Uri uri = Uri.parse(
      '${FilterBengkelConfig.baseUrl}${FilterBengkelConfig.filterEndpoint}'
      '?category=${selectedFilters.contains("category") ? "selectedCategory" : ""}'
      '&status=${selectedFilters.contains("status") ? "selectedStatus" : ""}'
      '&page=${selectedFilters.contains("page") ? "selectedPage" : ""}',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        workshopData = List<Map<String, dynamic>>.from(data['Bengkels']);
        filteredWorkshopData = workshopData;
      });
    } else {
      // Handle error
      print('Failed to fetch workshops: ${response.statusCode}');
    }
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

  Widget buildWorkshopList2() {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredWorkshopData.length,
        itemBuilder: (context, index) {
          // Build your workshop list item here
          return ListTile(
            title: Text(filteredWorkshopData[index]['Name']),
            // Add other workshop details as needed
          );
        },
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
            // height: 80,
            color: const Color.fromARGB(255, 66, 183, 237),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/my-location.png'),
                    const Text('Lokasi Anda'),
                  ],
                ),
                MultiSelectFormField(
                  autovalidate: AutovalidateMode.disabled,
                  chipBackGroundColor: Colors.blue,
                  chipLabelStyle: const TextStyle(color: Colors.white),
                  dialogTextStyle: const TextStyle(fontSize: 16),
                  checkBoxActiveColor: Colors.blue,
                  checkBoxCheckColor: Colors.white,
                  dialogShapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  title: const Text('Pilih Filter'),
                  dataSource: const [
                    {
                      "display": "Category",
                      "value": "category",
                    },
                    {
                      "display": "Status",
                      "value": "status",
                    },
                    {
                      "display": "Page",
                      "value": "page",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'Batal',
                  // hintWidget: const Text('Pilih filter'),
                  initialValue: [],
                  onSaved: (value) {
                    setState(() {
                      selectedFilters = List<String>.from(value);
                    });
                    fetchFilteredWorkshops(); // Panggil fungsi filter setelah filter dipilih
                  },
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
