import "package:flutter/material.dart";
import "package:chitchat/state/state.dart";
import "package:chitchat/common/common.dart";
import "package:chitchat/common/style.dart" as Style;
import "package:chitchat/common/firebase.dart" as Firebase;
import "package:firebase_auth/firebase_auth.dart";
import "package:chitchat/friends/friends.dart";

class FriendsScreen extends StatefulWidget<_FriendsScreenState> {
	FriendsScreen(this.firebaseUser);
	final FirebaseUser firebaseUser;

	@override
	_FriendsScreenState createState() => new _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {

	List<Chatroom> chatrooms = null;
	bool isLoaded = false;

	@override
	void initState() {
		print("initializing chat screen state...");
		_getChatrooms();
	}

	void _getChatrooms() async {
		Firebase.streamChatrooms(widget.firebaseUser.uid).listen((List<Chatroom> chatrooms) {
			setState(() {
				this.isLoaded = true;
				this.chatrooms = chatrooms;
			});
		});
	}

	void _openAddFriendScreen(BuildContext context) {
		Navigator.of(context).push(new MaterialPageRoute(
			builder: (context) {
				return new NewFriendScreen();
			}			
		));
	}

	Widget build(BuildContext context) {
		if (!isLoaded) {
			return new Center(
				child: new CircularProgressIndicator(
					value: null,
					valueColor: new AlwaysStoppedAnimation<Color>(Style.primary),
					strokeWidth: 2.5
				)
			);
		}

		return new Scaffold(
			backgroundColor: Colors.white,
			appBar: new AppBar(
				backgroundColor: Colors.white,
				elevation: 0.0,
				title: new Padding(
					padding: const EdgeInsets.only(left: 10.0, top: 20.0),
					child: new GestureDetector(
						onTap: () => _openAddFriendScreen(context),
						child: new SearchBar(enabled: false)
					)
				),
			),
			body: new ListView(
				children: chatrooms.map((Chatroom chatroom) => new FriendListItem()).toList()
			)
		);

	}
}
