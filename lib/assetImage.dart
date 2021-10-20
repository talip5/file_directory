import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/my_text.txt');
  }
  //Future<String>  list=rootBundle.loadString('assets/my_text.txt');

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage('assets/flutter.png'));
    // return Text('deneme',textDirection: TextDirection.ltr,);
  }
}
