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
	  home: new DefaultTabController(
		length: 2,
		child: new Scaffold(
			bottomNavigationBar: new BottomAppBar(
				child: new TabBar(
					tabs: [
						new Tab(icon: new Icon(Icons.directions_car)),
						new Tab(icon: new Icon(Icons.directions_transit)),
					]
				)
			),
			body: new TabBarView(
				children: [
					new Newsfeed(),
					new Icon(Icons.directions_transit),
				]
			)
		)
	  )
    );
  }
}
