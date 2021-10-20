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
  myApp({Key? key}) : super(key: key);

  File? file1;

  Future<List<String>> readMedsNames() async {
    // List<String?> medsNames;
    final directory = await getApplicationDocumentsDirectory();
    File eventFilePointer = File('${directory.path}/counter.txt');
    print(directory);
    return eventFilePointer
        .readAsLines();
  }



  Future<File>? write() async {
    Directory? directory = await getApplicationDocumentsDirectory();
    File eventFilePointer = File('${directory.path}/counter.txt');
    // Write the file
    print(eventFilePointer);
    return eventFilePointer.writeAsString('counter');

  }


  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {

  String asset1 = 'Assets';

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
                    widget.write();
                  },
                  child: Text('Yazna')),
              ElevatedButton(
                  onPressed: () async {
                  },
                  child: Text('Okuma')),
              ElevatedButton(
                  onPressed: () async {
                    await widget
                        .readMedsNames()
                        .then((value) => print(value.length));
                    await widget
                        .readMedsNames()
                        .then((value) => print(value.first));
                  },
                  child: Text('Satir Okuma')
              ),

            ],
          ),
        ),
      ),
    );
  }
}
