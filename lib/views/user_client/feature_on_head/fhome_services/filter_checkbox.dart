// import 'package:flutter/material.dart';

// class FilterCheckbox extends StatefulWidget {
//   final List<String> statuses;
//   final Function(List<String>) onCheckedChanged;

//   const FilterCheckbox({
//     required this.statuses,
//     required this.onCheckedChanged,
//   });

//   @override
//   _FilterCheckboxState createState() => _FilterCheckboxState();
// }

// class _FilterCheckboxState extends State<FilterCheckbox> {
//   List<String> selectedStatuses = [];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('Filter Status:'),
//         for (String status in widget.statuses)
//           CheckboxListTile(
//             title: Text(status),
//             value: selectedStatuses.contains(status),
//             onChanged: (bool? value) {
//               setState(() {
//                 if (value != null) {
//                   if (value) {
//                     selectedStatuses.add(status);
//                   } else {
//                     selectedStatuses.remove(status);
//                   }
//                   widget.onCheckedChanged(selectedStatuses);
//                 }
//               });
//             },
//           ),
//       ],
//     );
//   }
// }
