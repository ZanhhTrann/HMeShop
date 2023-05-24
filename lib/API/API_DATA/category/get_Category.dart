// ignore_for_file: unused_local_variable, prefer_const_declarations, non_constant_identifier_names
// gọi hàm lấy dữ liệu trả về từ api

import 'dart:convert';
import 'package:hmeshop/API/API_DATA/category/inputCat.dart';
import 'package:hmeshop/API/Key/key.dart';
import 'package:http/http.dart' as http;

import 'category.dart';

Future<List<category>> GetCategory() async {
  //đừng dãn để yêu cầu host trả về dữ liệu
  final String apiUrl =
      'https://apidojo-hm-hennes-mauritz-v1.p.rapidapi.com/categories/list';
  // lay mo ta san pham

  final Map<String, String> headers = {
    'X-RapidAPI-Key': key,
    'X-RapidAPI-Host': host
  };
  // nối ủrl với header với nhau
  final Uri uri = Uri.parse(apiUrl).replace(queryParameters: {
    'lang': lang,
    'country': country,
  });

// lấy dữ liệu trả về
  final response = await http.get(uri, headers: headers);
// thông tin về dữ liệu chỉ nằm ở body
  final decodedBody = json.decode(response.body);
  final cat = decodedBody;
  // print(cat);
  List<category> ListCat = inputCat(cat: cat);
  return ListCat;
}
