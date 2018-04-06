import 'package:flutter/material.dart';
import 'newsfeed.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Newsfeed Demo',
      theme: new ThemeData(
        primaryColor: Colors.white,
		fontFamily: 'Roboto',
      ),
      home: new Newsfeed(),
    );
  }
}
