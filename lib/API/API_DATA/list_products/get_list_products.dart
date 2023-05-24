// ignore_for_file: prefer_const_declarations, avoid_print, unused_import, unused_local_variable, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:hmeshop/API/API_DATA/list_products/product.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

import '../../Key/key.dart';
import '../desception/get_desception.dart';

Future<List<product>> getListProducts({String? name, String? pagesize}) async {
  final String apiUrl =
      'https://apidojo-hm-hennes-mauritz-v1.p.rapidapi.com/products/list';
  final Map<String, String> headers = {
    'X-RapidAPI-Key': key,
    'X-RapidAPI-Host': host,
  };
  final Uri url = Uri.parse(
      '$apiUrl?country=$country&lang=$lang&currentpage=0&pagesize=$pagesize&categories=$name');
  List<product> listProduct = [];
  try {
    final response = await http.get(url, headers: headers);
    final decodedBody = json.decode(response.body);
    final results = decodedBody['results'];
    List<String> coName = [];
    List<String> coCode = [];
    List<String> listImg = [];
    List<String> coImg = [];
    List<String> size = [];
    for (int i = 0; i < int.parse(pagesize!); i++) {
      for (int j = 0; j < results[i]['variantSizes'].length; j++) {
        size.add(results[i]['variantSizes'][j]['filterCode']);
      }
      for (int j = 0; j < results[i]['allArticleImages'].length; j++) {
        coImg.add(results[i]['allArticleImages'][j]);
      }
      for (int j = 0; j < results[i]['rgbColors'].length; j++) {
        coCode.add('0xff' +
            results[i]['rgbColors'][j]
                .toString()
                .substring(1, results[i]['rgbColors'][j].length));
        coName.add(results[i]['articleColorNames'][j]);
      }
      for (int j = 0; j < results[i]['galleryImages'].length; j++) {
        listImg.add(results[i]['galleryImages'][j]['url']);
      }
      listProduct.add(
        product(
            code: results[i]['articles'][0]['code'],
            name: results[i]['name'],
            whitePrice: results[i]['whitePrice']['value'].toString(),
            sale: results[i]['sale'],
            redPrice: results[i]['sale'] == 'true'
                ? results[i]['redPrice']['value'].toString()
                : '0',
            imgUrl: results[i]['images'][0]['url'],
            rgbColor: coCode,
            colorName: coName,
            listImg: listImg,
            size: size,
            colorPImage: coImg,
            tagcode: decodedBody['categoryCode'],
            categoryName: results[i]['categoryName'],
            description:
                await getDescription(code: results[i]['articles'][0]['code'])),
      );
      listImg = [];
      coName = [];
      coCode = [];
      size = [];
      coImg = [];
    }

    // kiem tra du lieu

    // print(results);
    // print(results[0]['name'].toString());
    // for (int i = 0; i < listProduct[0].getListImg().length; i++) {
    //   print(listProduct[0].getListImg()[i]);
    // }
  } catch (error) {
    print('loi pro $error');
  }
  return listProduct;
}
