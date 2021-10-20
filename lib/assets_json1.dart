import 'dart:async' show Future;
import 'dart:convert';
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
    return await rootBundle.loadString('assets/json/config.json');
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
                  loadAsset().then((value) {
                    Map map=json.decode(value);
                    map['key2']='value2';
                    print(map);
                    map.forEach((key, value) {
                      print(key+value);
                      print(value);
                    });
                    print(map.keys.first);
                    print(map.values.first);
                    print(map.update('key2', (value) => 'value5'));
                  }
                  ); // loadAsset
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
