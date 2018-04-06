import 'package:flutter/material.dart';
import 'package:newsfeed_2/widgets/widgets.dart';
import 'package:newsfeed_2/style/style.dart';
import 'newsfeed.dart';
import 'messages.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Newsfeed Demo',
      theme: new ThemeData(
        primaryColor: Colors.white,
		fontFamily: 'Source Sans',
      ),
	  home: new DefaultTabController(
		length: 2,
		child: new Scaffold(
			body: new TabBarView(
				children: [
					new Newsfeed(),
					new Messages(),
				]
			)
		)
	  )
    );
  }
}
