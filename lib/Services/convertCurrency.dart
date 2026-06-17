import 'dart:convert';
import 'package:http/http.dart' as http;

Future<double> convertCurrency(
    String from,
    String to,
    double amount,
    ) async {

  final url =
      'https://api.frankfurter.app/latest?amount=$amount&from=$from&to=$to';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    return data['rates'][to];
  }

  throw Exception('فشل جلب البيانات');
}