// import 'package:flutter/material.dart';

// class FilterDropdown extends StatelessWidget {
//   final List<String> categories;
//   final Function(String?) onValueChanged;

//   const FilterDropdown({
//     required this.categories,
//     required this.onValueChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       hint: const Text('Pilih Kategori'),
//       onChanged: onValueChanged,
//       items: categories.map((String category) {
//         return DropdownMenuItem<String>(
//           value: category,
//           child: Text(category),
//         );
//       }).toList(),
//     );
//   }
// }
