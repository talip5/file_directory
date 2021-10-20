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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xxx',
      home: Scaffold(
        appBar: AppBar(title: Text('File')),
        body: Center(
          child: Column(children: [
            FutureBuilder(
              //future: rootBundle.loadString('assets/my_text .txt'),
              future: loadAsset(),
              builder: (context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('ERROR : ${snapshot.error.toString()}'),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Column(
                  children: [
                    Center(
                      //child: Text(snapshot.connectionState.toString()),
                      child: Text(snapshot.data!),
                    ),
                  ],
                );
              },
            ),
          ],
          ),
        ),
      ),
    );
  }
}
