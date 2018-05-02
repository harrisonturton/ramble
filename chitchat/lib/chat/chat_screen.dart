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
		_fetchChatrooms();
	}

	void _fetchChatrooms() async {
		Firebase.streamChatrooms(widget.firebaseUser.uid).listen((List<Chatroom> chatrooms) {
			setState(() {
				this.isLoaded = true;
				this.chatrooms = chatrooms;
			});
		});
	}

	Widget _buildChatroomList() => new SliverList(
		delegate: new SliverChildListDelegate(
			chatrooms.map((Chatroom chatroom) => new ChatListItem(
				chatroom: chatroom
			)).toList()
		)
	);

	Widget _buildHeader() => new SliverAppBar(
		floating: true,
		elevation: 0.0,
		backgroundColor: Colors.white,
		title: new Padding(
			padding: const EdgeInsets.only(left: 10.0, top: 20.0),
			child: new Text(
				"Messages",
				style: new TextStyle(
					fontSize: 24.0,
					fontWeight: FontWeight.w600
				)
			),
		),
		actions: [
			new GestureDetector(
				onTap: () => print("Create new chat..."),
				child: new Padding(
					padding: const EdgeInsets.only(top: 15.0, right: 15.0),
					child: new Image.asset(
						create,
						width: 35.0,
						color: Style.primary
					)
				)
			)
		]
	);

	Widget _buildLoadingScreen() => new CustomScrollView(
		slivers: [
			_buildHeader(),
			new SliverList(
				delegate: new SliverChildListDelegate([
					new Padding(
						padding: const EdgeInsets.only(top: 30.0),
						child: new Column(
							children: [
								new CircularProgressIndicator(
									value: null,
									valueColor: new AlwaysStoppedAnimation<Color>(Style.primary),
									strokeWidth: 2.5
								)
							]
						)
					)
				])
			)
		]
	);

	Widget build(BuildContext context) {
		if (!isLoaded) {
			return _buildLoadingScreen();
		}

		return new CustomScrollView(
			slivers: [
				_buildHeader(),
				_buildChatroomList()
			]
		);
	}
}
