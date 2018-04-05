import 'package:flutter/material.dart';
import 'post/post.dart';

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

class Newsfeed extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			backgroundColor: Colors.white,
			body: new Padding(
				//padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
				padding: const EdgeInsets.symmetric(vertical: 30.0),
				child: new ListView(
					children: <Widget>[
						new Padding(
							padding: const EdgeInsets.only(left: 15.0, bottom: 30.0),
							child: new Text(
								"Newsfeed",
								style: new TextStyle(
									fontSize: 32.0,
									fontWeight: FontWeight.bold
								)
							),
						),
						new Post(),
						new Post(),
						new Post(),
						new Post(),
						new Post(),
						new Post(),
					]
				)
			)
		);
	}
}
