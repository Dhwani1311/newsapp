import 'dart:convert';

import 'package:flutter_app_newsapi/model/model.dart';

import 'package:http/http.dart' as http;

class SampleAPI {
  Future<APIResponseModel> getDataFromAPI() async {
    final response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=921dfa03539246f28c1f24bcc5e1ca7e'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return APIResponseModel(
          statusCode: response.statusCode,
          message: 'Data Found',
          response: SampleModel.fromJSon(data));
    } else {
      return APIResponseModel(
          response: [],
          message: 'No Data Found',
          statusCode: response.statusCode);
    }
  }
}
