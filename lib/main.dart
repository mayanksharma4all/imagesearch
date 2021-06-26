import 'package:flutter/material.dart';
import 'package:imagesearchapp/screens/searchimage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.red,
    ),
    debugShowCheckedModeBanner: false,
    home: SearchImage(),
  ));
}
