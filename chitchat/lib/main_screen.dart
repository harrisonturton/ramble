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
	
	@override
	Widget build(BuildContext context) {
		return new BottomNavigation(
			fadeDuration: new Duration(milliseconds: 100),
			children: [
				new Text("Newsfeed"),
				new ChatScreen(widget.store.state.user.firebaseUser),
				new FriendsScreen(widget.store.state.user.firebaseUser),
			],
			items: [
				[home_solid, home_outline],
				[chat_solid, chat_outline],
				[person_solid, person_outline]
			]
		);
	}
}
