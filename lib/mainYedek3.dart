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
    return MaterialApp(
      title: 'xxx',
      home: Scaffold(
        appBar: AppBar(title: Text('File')),
        body: Center(
          child: Column(children: [
            Text('xxxx'),
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
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ListView(
                      children: [
                        Text(snapshot.data!),
                        Text(snapshot.data!.length.toString()),
                        Text(snapshot.data!.codeUnits.toString()),   // [49,32,65,108........]
                      ],
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
                onPressed: () async{
                  //print(await list.toString());
                  print('String List');
                },
                child: Text('String List')),
          ],
          ),
        ),
      ),
    );
  }
}
