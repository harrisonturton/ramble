import 'package:flutter/material.dart';
import 'package:newsfeed_2/widgets/widgets.dart';
import 'package:newsfeed_2/style/style.dart' as Style;
import 'main_tabs/main_tabs.dart';

class MainScreen extends StatefulWidget {
	@override
	_MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {

	final List<String> _tabNames = ["Newsfeed", "Messages", "Notifications", "Navigation"];
	String _currentName;
	TabController _controller;

	@override
	void initState() {
		super.initState();
		_controller = new TabController(length: 4, vsync: this);
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
		return new Scaffold(
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
								forceElevated: true,
								//snap: true,
								floating: true,
								bottom: new TabBar(
									indicatorColor: Style.Primary,
									controller: _controller,
									tabs: [
										new Tab(
											icon: new Image.asset(
												_controller.index == 0 ? home_strong : home,
												color: _controller.index == 0 ? Style.Primary : Colors.grey[800],
												width: 35.0
											)
										),
										new Tab(
											icon: new Image.asset(
												_controller.index == 1 ? chat_bubble_strong : chat_bubble,
												color: _controller.index == 1 ? Style.Primary : Colors.grey[800],
												width: 35.0
											)
										),
										new Tab(
											icon: new Image.asset(
												_controller.index == 2 ? bell_strong : bell,
												color: _controller.index == 2 ? Style.Primary : Colors.grey[800],
												width: 35.0
											)
										),
										new Tab(
											icon: new Image.asset(
												compass,
												color: _controller.index == 3 ? Style.Primary : Colors.grey[800],
												width: 35.0
											)
										),
									]	
								)
							)
						];
					},
					body: new TabBarView(
						controller: _controller,
						children: [ 
							new NewsfeedTab(),
							new MessagesTab(),
							new NotificationsTab(),
							new NavigationTab(),
						]
					)
				),
			);
	}
}
