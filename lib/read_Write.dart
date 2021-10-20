//https://flutter.dev/docs/cookbook/persistence/reading-writing-files

import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  Future<String> get _localPath async {
   final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {

  String asset1 = 'Assets';
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xxx',
      home: Scaffold(
        appBar: AppBar(title: Text('File')),
        body: Center(
          child: Column(
            children: [
              Text('xxxx'),
              ElevatedButton(
                  onPressed: () async {
                    await widget.writeCounter(3);
                    print(await widget.readCounter());
                  },
                  child: Text('String List')),
              Text(asset1),
            ],
          ),
        ),
      ),
    );
  }
}
