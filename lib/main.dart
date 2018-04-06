import 'package:flutter/material.dart';
import 'package:newsfeed_2/widgets/widgets.dart';
import 'package:newsfeed_2/style/style.dart';
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
						new Tab(
							icon: new ImageButton(
								image: home,
								width: 25.0,
								color: TextDark
							)
						),
						new Tab(
							icon: new ImageButton(
								image: comment,
								width: 25.0,
								color: TextDark,
							)
						),
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
