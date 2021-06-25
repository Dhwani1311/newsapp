import 'package:flutter_app_newsapi/api%20provider/sample_api.dart';
import 'package:flutter_app_newsapi/model/model.dart';

class Repository {
  final sampleAPI = SampleAPI();

  Future<APIResponseModel> getDataFromAPI() => sampleAPI.getDataFromAPI();
}
