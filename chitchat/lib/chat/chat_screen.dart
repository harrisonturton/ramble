import "dart:math";
import "dart:ui";
import "package:chitchat/common/style.dart" as Style;
import "package:flutter/material.dart";
import "package:chitchat/common/common.dart";
import "package:chitchat/common/firebase.dart" as Firebase;
import "package:chitchat/chat/chat.dart";
import "package:chitchat/state/state.dart";

import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class ChatScreen extends StatefulWidget<_ChatScreenState> {
	ChatScreen(this.firebaseUser);
	final FirebaseUser firebaseUser;

	@override
	_ChatScreenState createState() => new _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

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
		if (isLoaded && chatrooms != null) {
			return new ListView(
				children: chatrooms
					.map((Chatroom chatroom) => new ChatListItem(
						chatroom: chatroom
					)).toList()
			);
		} else {
			return new Center(
				child: new CircularProgressIndicator(
					value: null,
					valueColor: new AlwaysStoppedAnimation<Color>(Style.primary),
					strokeWidth: 2.5
				)
			);
		}
	}
}
