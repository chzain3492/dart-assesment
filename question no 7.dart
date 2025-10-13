import 'dart:convert';
import 'package:http/http.dart' as http;

// Custom exception
class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);

  @override
  String toString() => "NetworkException: $message";
}

Future<List<String>> fetchSequentially(List<String> urls) async {
  List<String> results = [];

  for (var url in urls) {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        results.add(response.body);
      } else {
        throw NetworkException("Failed to fetch $url (status ${response.statusCode})");
      }
    } catch (e) {
      throw NetworkException("Error fetching $url → $e");
    }
  }

  return results;
}
// 