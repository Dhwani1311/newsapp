import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;

  var index;

  // Future<String> getData() async {
  //   var response = await http.get(Uri.parse(
  //       'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=921dfa03539246f28c1f24bcc5e1ca7e'));
  //   var fetchdata = json.decode(response.body);

  //   this.setState(() {
  //     data = fetchdata["articles"];
  //     data.sort((a, b) => b['publishedAt'].compareTo(a['publishedAt']));
  //   });
  // }

  @override
  void initState() {
    super.initState();
    //this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Center(
          child: new Text(
            "News App",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.green[300],
      ),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                final item = data[index];

                return GestureDetector(
                  child: new Card(
                    child: Column(
                      children: [
                        Container(
                          child: Image.network(
                            item['urlToImage'],
                            // width: 100,
                            height: 150,
                          ),
                        ),
                        Container(
                            child: new Text(
                          item["author"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                  // ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                  title: item["title"],
                                  description: item["description"],
                                  urlToImage: item["urlToImage"],
                                  author: item["author"],
                                )));
                  },
                  // ),
                );
              },
              // ),
            ),
    );
  }
}
