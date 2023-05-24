// ignore_for_file: prefer_const_declarations, unused_local_variable, avoid_print
import 'dart:convert';
import 'package:hmeshop/API/Key/key.dart';
import 'package:http/http.dart' as http;

Future<String> getDescription({String? code}) async {
  final String apiUrl =
      'https://apidojo-hm-hennes-mauritz-v1.p.rapidapi.com/products/detail';
  final Map<String, String> headers = {
    'X-RapidAPI-Key': key,
    'X-RapidAPI-Host': host,
  };
  final Uri url =
      Uri.parse('$apiUrl?lang=$lang&country=$country&productcode=$code');
  try {
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String description = data['product']['description'];
      return description;
    } else {
      print('Lỗi des 1: ${response.statusCode}');
    }
  } catch (error) {
    print('Lỗi des 2: $error');
  }

  return '';
}
