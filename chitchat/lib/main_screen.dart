import "package:flutter/material.dart";
import "package:chitchat/chat/chat.dart";
import "package:chitchat/common/style.dart" as Style;
import "package:chitchat/common/common.dart";
import "package:chitchat/state/state.dart";
import "package:chitchat/friends/friends.dart";
import "package:redux/redux.dart";

class MainScreen extends StatefulWidget<_MainScreenState> {
	MainScreen({this.store});
	final Store<AppState> store;

	@override
	_MainScreenState createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {

	final List<String> _tabNames = ["Newsfeed", "Messages", "Friends"];
	String _currentName;
	TabController _controller;

	@override
	void initState() {
		super.initState();
		_controller = new TabController(length: 3, initialIndex: 1, vsync: this);
		_currentName = _tabNames[1];
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

	List<Widget> _buildActions() {
		EdgeInsets padding = const EdgeInsets.only(top: 15.0, right: 15.0);

		if (_controller.index == 0) {
			return [];
		}

		if (_controller.index == 1) {
			return [
				new Padding(
					padding: padding,
					child: new Image.asset(
						create,
						width: 35.0,
						color: Style.primary
					)
				)
			];
		}

		if (_controller.index == 2) {
			return [
				new Padding(
					padding: padding,
					child: new Icon(
						Icons.add,
						color: Style.primary,
						size: 30.0
					)
				)
			];
		}
	}

	Widget _buildAppBar() {
		return new AppBar(
			title: new Padding(
				padding: const EdgeInsets.only(left: 10.0, top: 20.0),
				child: new Text(
					_currentName,
					style: new TextStyle(
						fontSize: 22.0,
						fontWeight: FontWeight.w600
					)
				),
			),
			backgroundColor: Colors.white,
			elevation: 2.0,
			actions: _buildActions(),
			bottom: new TabBar(
				controller: _controller,
				labelColor: Style.primary,
				unselectedLabelColor: Style.textLight,
				indicatorColor: Style.primary,
				indicatorPadding: const EdgeInsets.only(
					left: 30.0, right: 30.0,
				),
				tabs: [
					new Tab(
						icon: new Image.asset(
							_controller.index == 0 ? home_solid : home_outline,
							color: _controller.index == 0 ? Style.primary : Style.textLight,
							width: 35.0
						)
					),
					new Tab(
						icon: new Image.asset(
							_controller.index == 1 ? chat_solid : chat_outline,
							color: _controller.index == 1 ? Style.primary : Style.textLight,
							width: 35.0
						)
					),
					new Tab(
						icon: new Image.asset(
							_controller.index == 2 ? person_solid : person_outline,
							color: _controller.index == 2 ? Style.primary : Style.textLight,
							width: 35.0
						)
					)
				]
			),
		);
	}

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			backgroundColor: Colors.white,
			appBar: _buildAppBar(),
			body: new TabBarView(
				controller: _controller,
				children: [
					new Text("Newsfeed"),
					new ChatScreen(widget.store.state.user.firebaseUser),
					new FriendsScreen(widget.store.state.user.firebaseUser),
				]
			)
		);
	}
}


