import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Flutter App'),
        ),
        body: Center(
          child: Container(
            child: RaisedButton(
              child: Text("Consume API"),
              onPressed: () {},
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
