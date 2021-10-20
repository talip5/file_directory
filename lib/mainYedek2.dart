import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Path Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Path Provider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Directory? appDocumentsDirectory1=null;
  Directory? supportDirectory1=null;
  Directory? libraryDirectory1=null;
  Directory? externalStorageDirectory1=null;

  Future<String?>? getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    Directory supportDirectory = await getApplicationSupportDirectory();
    // Directory libraryDirectory= await getLibraryDirectory();
    Directory? externalStorageDirectory =await getExternalStorageDirectory();

    print(appDocumentsDirectory);
    print(appDocumentsDirectory.runtimeType);
    setState(() {
      appDocumentsDirectory1=appDocumentsDirectory;
      supportDirectory1=supportDirectory;
      //libraryDirectory1=libraryDirectory;
      externalStorageDirectory1=externalStorageDirectory;
    });
    String appDocumentsPath = appDocumentsDirectory.path; // 2
    String filePath = '$appDocumentsPath/demoTextFile.txt'; // 3
    print(filePath);
    // return filePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text('path'),
            ElevatedButton(
                onPressed:(){
                  getFilePath();
                  print('path');
                },
                child: Text('Path_Provider')
            ),
            Text(appDocumentsDirectory1.toString()),
            //Text(directory.parent.toString()),
            Text(supportDirectory1.toString()),
            //Text(libraryDirectory1.toString()),
            Text(externalStorageDirectory1.toString()),
          ],
        ),
      ),
    );
  }
}
