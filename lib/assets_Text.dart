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
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ListView(
                      children: [
                        Text(snapshot.data!),
                        SizedBox(height: 20.0),
                        Text(snapshot.data!.length.toString()),
                        Text(snapshot.data!.characters.last),
                        Text(snapshot.data![0]),   // 1
                        Text(snapshot.data![2]),   // A
                        Text(snapshot.data!.codeUnits.toString()),   // [49,32,65,108........]
                        Text(snapshot.data!.split(" ").last),   //
                        Text(snapshot.data!.split('').first),   //
                        Text(snapshot.data!.split('.').first),   // 2
                        Text('New ${snapshot.data!.replaceAll('.','ALL')}'),
                        Text(snapshot.data!.replaceRange(0,1, 'HELLO')),   // 2
                      ],
                    ),
                  ),
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
