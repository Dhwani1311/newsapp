class SampleModel {
  SampleModel.fromJSon(dynamic toJson) {
    if (toJson.isNotEmpty) {
      toJson.forEach((element) => listOfSample.add(Sample.fromJSon(element)));
    }
  }

  List<Sample> listOfSample = [];
}

class Sample {
  Sample.fromJSon(Map<String, dynamic> toJson) {
    id = toJson['id'];
    title = toJson['title'];
    author = toJson['author'];
    descrption = toJson['descrption'];
    urlToImage = toJson['urlToImage'];
  }

  int id;
  String title;
  String author;
  String descrption;
  String urlToImage;
}

class APIResponseModel {
  const APIResponseModel({this.statusCode, this.message, this.response});
  final int statusCode;
  final String message;
  final dynamic response;
}
// Future<ApiResponseModel> postDataToAPI(
//     int userId, int id, String title, String body) async {
//   final http.Response response = await http.post(
//     'https://jsonplaceholder.typicode.com/posts',
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'userId': userId.toString(),
//       'id': id.toString(),
//       'title': title,
//       'body': body,
//     }),
//   );

//   if (response.statusCode == 200 || response.statusCode == 201) {
//     final data = jsonDecode(response.body);
//     return ApiResponseModel(
//         s: response.statusCode,
//         message: 'Data Found',
//         response: Sample.fromJSon(data));
//   } else {
//     return APIResponseModel(
//         response: [],
//         message: 'No Data Found',
//         statusCode: response.statusCode);
//   }
// }

//data = await getapi.postDataToAPI(1, 100, 'Title provider', 'Body Provider');
//if(data.statusCode == 200 || data.statusCode == 201){
//sample  = data.response;

// }

// body: Consumer<SampleProvider>(
//     builder: (context, provider,_) {
//             return Column(
//               children: [
//                 Text(provider.sample == null ? 'Test userid' : provider.sample.userId.toString()),
//                 Text(provider.sample == null ? 'Test id' : provider.sample.id.toString()),
//                 Text(provider.sample == null ? 'Test title' : provider.sample.title ),
//                 Text(provider.sample == null ? 'Test Body' : provider.sample.body ),
//                 Divider(),
//               ],
//             );
//           //});
//     }),
