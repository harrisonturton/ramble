import 'package:flutter/material.dart';
import 'package:newsfeed_2/widgets/widgets.dart';
import 'package:newsfeed_2/style/style.dart' as Style;
import 'newsfeed.dart';
import 'messages.dart';

void main() => runApp(new App());

class App extends StatefulWidget {
	@override
	_AppState createState() => new _AppState();
}

class _AppState extends State<App> with TickerProviderStateMixin {

	final List<String> _tabNames = ["Newsfeed", "Messages"];
	String _currentName;
	TabController _controller;

	@override
	void initState() {
		super.initState();
		_controller = new TabController(length: 2, vsync: this);
		_currentName = _tabNames[0];
		_controller.addListener(_handleChangeTab);
	}

	@override
	dispose() {
		_controller.removeListener(_handleChangeTab);
		super.dispose();
	}

	void _handleChangeTab() {
		setState(() {
			_currentName = _tabNames[_controller.index];
		});
	}

	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: "Social Media App",
			theme: new ThemeData(
				primaryColor: Colors.white,
				fontFamily: "Source Sans"
			),
			home: new Scaffold(
				backgroundColor: Colors.white,
				body: new NestedScrollView(
					headerSliverBuilder: (BuildContext context, bool isInnerBoxScrolled) {
						return [
							new SliverAppBar(
								elevation: 2.0,
								title: new Padding(
									padding: const EdgeInsets.only(left: 5.0),
									child: new Text(
										_currentName,
										style: new TextStyle(
											fontWeight: FontWeight.w600
										)
									)
								),
								pinned: true,
								floating: true,
								bottom: new TabBar(
									indicatorColor: Style.Primary,
									controller: _controller,
									tabs: [
										new Tab(
											icon: new Image.asset(
												"assets/icons/icon_home_enclosed_thick.png",
												color: _controller.index == 0 ? Style.Primary : Colors.grey[800],
												width: 35.0
											)
										),
										new Tab(
											icon: new Image.asset(
												comment,
												color: _controller.index == 1 ? Style.Primary : Colors.grey[800],
												width: 35.0
											)
										)
									]	
								)
							)
						];
					},
					body: new TabBarView(
						controller: _controller,
						children: [ 
							new Newsfeed(),
							new Messages()
						]
					)
				),
			)

		);
	}
}

/*
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
			body: new NestedScrollView(
				headerSliverBuilder: (BuildContext context, bool isInnerBoxScrolled) {
					return [
						new SliverAppBar(
							title: const Text("Newsfeed"),
							pinned: true,
							floating: true,
							bottom: new TabBar(
								tabs: [
									new Tab(text: "Tab 1"),
									new Tab(text: "Tab 2"),
								]
							)
						),
					];
				},
				body: new TabBarView(
					children: [
						new Newsfeed(),
						new Messages()
					]
				)
			)
		),
    )
	);
  }
}*/
