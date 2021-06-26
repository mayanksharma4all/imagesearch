import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imagesearchapp/utils/server.dart';
import 'package:imagesearchapp/widgets/customappbar.dart';

class SearchImage extends StatefulWidget {
  @override
  _SearchImageState createState() => _SearchImageState();
}

class _SearchImageState extends State<SearchImage> {
  List images = [];
  loadImagesFromServer({imageName = 'Iron Man'}) async {
    http.Response response =
        await Server.findImagesByName(imageName: imageName);
    // print("Response from the Server is $response");
    //print(response.body);
    dynamic json = convert.jsonDecode(response.body);

    //print(json['data']);
    images = json['data'];
    setState(() {});
    print("After Set State");
    //print(response.body.runtimeType);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init State Call");
    loadImagesFromServer();
  }

  _noImage() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  getImageSearchText() {
    images = [];
    setState(() {});
    loadImagesFromServer(imageName: tc.text);
  }

  TextEditingController tc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("Build Called");
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: CustomAppBar(tc, getImageSearchText)),
      body: Container(
          child: images.length == 0
              ? _noImage()
              : ListView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      images[index]['images']['original']['url'],
                    );
                  },
                )
          // child: ListView.builder(
          //   itemCount: ,
          // ),
          ),
    );

  }
}
