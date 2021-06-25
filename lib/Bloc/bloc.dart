import 'package:flutter_app_newsapi/api%20provider/repository.dart';
import 'package:flutter_app_newsapi/model/model.dart';
import 'package:rxdart/rxdart.dart';

class SampleBloc {
  final _repository = Repository();
  final _dataFromAPI = BehaviorSubject<APIResponseModel>();

  Stream<APIResponseModel> get dataFromAPIStream => _dataFromAPI.stream;

  Future<void> getData() async {
    final apiData = await _repository.getDataFromAPI();
    _dataFromAPI.sink.add(apiData);
  }

  disponse() {
    _dataFromAPI.close();
  }
}
