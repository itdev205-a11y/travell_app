import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {

  static const String apiKey = "40e0e0793544e21ab040fdcf1ac2df57";

  static Future<Map<String, dynamic>> getWeather(String city) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    final response = await http.get(Uri.parse(url));



    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Weather Error: ${response.body}");
    }
  }
}