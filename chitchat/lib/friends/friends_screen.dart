import "package:flutter/material.dart";
import "package:chitchat/state/state.dart";
import "package:chitchat/common/common.dart";
import "package:chitchat/common/style.dart" as Style;
import "package:chitchat/common/firebase.dart" as Firebase;
import "package:firebase_auth/firebase_auth.dart";
import "friend_list_item.dart";

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

		return new ListView(
			children: chatrooms.map((Chatroom chatroom) => new FriendListItem()).toList()
		);
	}
}
