import "dart:async";
import "package:flutter/material.dart";
import "package:chitchat/state/state.dart";
import "package:chitchat/chat/chat.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class ChatroomScreen extends StatefulWidget<_ChatroomScreenState> {
	ChatroomScreen({this.chatroom});
	final Chatroom chatroom;

	_ChatroomScreenState createState() => new _ChatroomScreenState();

}

class _ChatroomScreenState extends State<ChatroomScreen> {

	bool isLoaded = false;
	List<Message> messages = null;

	@override
	void initState() {
		print("Initiating chatroom state...");
		_getMessages();
	}

	void _getMessages() async {
		Firestore.instance.collection("chatroom_id_to_messages")
			.document(widget.chatroom.id).snapshots.listen((DocumentSnapshot snapshot) {
				print(snapshot.data);
				List<Message> newMessages = new List();
				snapshot.data["messages"].forEach((data) {
					newMessages.add(new Message(
						author: data["author"],
						content: data["content"]
					));
				});
				setState(() {
					messages = newMessages;
					isLoaded = true;
				});
			});
	}

	Widget _buildBody() {
		return new Container(
			padding: const EdgeInsets.all(15.0),
			child: new Column(
				children: [
					new Expanded(
						child: new ListView(
							children: messages.map((message) =>
								new MessageBubbleHome(
									message: message
								)).toList()
						)
					),
					// Input here
				]
			)
		);
	}

	@override
	Widget build(BuildContext context) {
		Widget body = new Center(
			child: const Text("Loading...")
		);
		if (isLoaded) {
			body = _buildBody();
		}
		return new Scaffold(
			backgroundColor: Colors.white,
			appBar: new AppBar(
				title: new Text(widget.chatroom.title),
				backgroundColor: Colors.white,
				elevation: 0.0
			),
			body: body
		);
	}
}
