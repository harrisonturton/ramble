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
			appBar: new AppBar(
				title: const Text("Newsfeed"),
				bottom: new TabBar(
					tabs: [
						new Tab(
							icon: new Image.asset(
								"assets/icons/icon_home.png",
								color: Colors.grey[800],
								width: 35.0
							),
						),
						new Tab(
							icon: new Image.asset(
								"assets/icons/icon_comment.png",
								color: Colors.grey[800],
								width: 35.0
							),
						),
					]
				),
			),
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
