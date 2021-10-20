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

  String asset1='Assets';
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
            Text('xxxx'),
            ElevatedButton(
                onPressed: () async{
                  //loadAsset().then((value) => print(value.length));
                  //loadAsset().whenComplete(() => print('yuklendi'));
                  loadAsset().then((value) {
                    print(value.codeUnits);
                    setState(() {
                      // asset1=value.length.toString();
                      //asset1=value.codeUnits[0].toString();
                      asset1=value.codeUnits.toString();
                    });
                  }
                  );
                  print('String List');
                },
                child: Text('String List')
            ),
            Text(asset1),
          ],
          ),
        ),
      ),
    );
  }
}
