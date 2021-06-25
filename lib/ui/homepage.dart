import 'package:flutter/material.dart';
import 'package:flutter_app_newsapi/Bloc/bloc.dart';
import 'package:flutter_app_newsapi/model/model.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final sampleBloc = SampleBloc();
  @override
  void initState() {
    sampleBloc.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: Text("Flutter Demo Home Page")),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: StreamBuilder(
          stream: sampleBloc.dataFromAPIStream,
          builder: (context, AsyncSnapshot<APIResponseModel> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            SampleModel sampleApiData = snapshot.data.response;
            return ListView.builder(
                itemCount: sampleApiData.listOfSample.length,
                itemBuilder: (context, int index) {
                  return Column(
                    children: [
                      Text(sampleApiData.listOfSample[index].title),
                      Divider(),
                    ],
                  );
                });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await sampleBloc.getData();
        },
        child: Icon(Icons.download_rounded),
      ),
    );
  }
}
