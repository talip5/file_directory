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

  denemeString denemeStringReferans=denemeString();
  denemeString1 denemeStringReferans1=denemeString1();


  File? file1;

  Future<List<String>> readMedsNames() async {
    // List<String?> medsNames;
    final directory = await getApplicationDocumentsDirectory();
    File eventFilePointer = File('${directory.path}/counter.txt');
    print(directory);
    return eventFilePointer
        .readAsLines()
  }

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
                    await widget.writeCounter(33333333333);
                    print('yazdi');
                  },
                  child: Text('Yazna')),
              ElevatedButton(
                  onPressed: () async {
                    await widget.readCounter();
                    print(await widget.readCounter());
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
              ElevatedButton(
                  onPressed: (){},  //widget.denemeStringReferans.pazar(),
                  child: Text('Class')
              ),
              Text(widget.denemeStringReferans.pazar().toString()),
              //Text(widget.denemeStringReferans1.pazar1().),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.denemeStringReferans1.pazar1().length,
                    itemBuilder: (BuildContext context, int index) {
                      return(Text(widget.denemeStringReferans1.pazar1()[index].toString()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class denemeString{

  String? pazar(){
    String adi='data35';
    return null;
  }
}

class denemeString1{

  List pazar1(){
    List list=['Ali',35,'Cengiz'];
    //int record=list.length;
    //String deger=record.toString();
    return list;
  }
}