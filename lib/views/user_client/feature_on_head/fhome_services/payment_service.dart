// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class PaymentService {
//   static const String baseUrl = 'https://montirku-o7xwqh4bya-et.a.run.app';
//   static const String paymentEndpoint = '/user/transaction';

//   Future<Map<String, dynamic>> createTransaction(
//       List<Map<String, dynamic>> transactionDetails) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl$paymentEndpoint'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'TransactionDetails': transactionDetails}),
//       );

//       if (response.statusCode == 201) {
//         return json.decode(response.body);
//       } else {
//         throw Exception(
//             'Failed to create transaction. Status Code: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error creating transaction: $error');
//       throw error;
//     }
//   }
// }
