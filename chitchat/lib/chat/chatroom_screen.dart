import "dart:async";
import "package:flutter/material.dart";
import "package:chitchat/state/state.dart";
import "package:chitchat/common/style.dart" as Style;
import "package:chitchat/common/common.dart";
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

	ScrollController _scrollController = new ScrollController();
	TextEditingController _controller = new TextEditingController();

	void _sendMessage() {
		print("Sending message ${_controller.text}");
		if (_controller.text == "") {
			return;
		}
		// Need to restructure database -- put messages in a collection
		Firestore.instance.collection("chatroom_id_to_messages/${widget.chatroom.id}/messages").add({
			"author": "Harrison Turton",
			"content": _controller.text,
			"timestamp": DateTime.now().toUtc()
		}).then((_) {
			print("Added message ${_controller.text}");
		});
		_controller.clear();
		_scrollController.animateTo(
			0.0,
			curve: Curves.easeOut,
			duration: const Duration(milliseconds: 300),
		);
	}

	@override
	void initState() {
		print("Initiating chatroom state...");
		_getMessages();
	}

	void _getMessages() async {
		Firestore.instance.collection("chatroom_id_to_messages/${widget.chatroom.id}/messages")
			.orderBy("timestamp").snapshots.listen((QuerySnapshot query) {
				print("Inside collection...");
				setState(() {
					isLoaded = true;
					this.messages = query.documents.map((DocumentSnapshot snapshot) => new Message(
						author: snapshot.data["author"],
						content: snapshot.data["content"],
					)).toList();
				});
			});
	}

	Widget _buildBody() {
		List<Widget> messageWidgets = new List();
		messages.forEach((message) => messageWidgets.add(new MessageBubbleHome(
			message: message
		)));
		messageWidgets.add(new VerticalSpace(35.0));
		return new Container(
			color: const Color.fromRGBO(250, 250, 250, 1.0),
			child: new Stack(
				children: [
					new ListView(
						reverse: true,
						controller: _scrollController,
						children: messageWidgets.reversed.toList()
					),
					new Column(
						children: [
							new Expanded(child: new Column()),
							new Padding(
								padding: const EdgeInsets.all(15.0),
								child: new StadiumInput(
									controller: _controller,
									onTap: _sendMessage
								)
							)
						]
					)
				]
			)
		);
		return new Stack(
			children: [
				new Expanded(
					child: new ListView(
						children: messages.map((message) {
							return new MessageBubbleHome(
								message: message
							);
						}).toList()
					)
				),
				new Column(
					children: [
						// Push to bottom of screen
						new Expanded(child: new Column()),
						new StadiumInput(
							controller: _controller,
							onTap: _sendMessage
						)
					]
				)
			]
		);
	}

	@override
	Widget build(BuildContext context) {
		Widget body = new Center(
			child: new CircularProgressIndicator(
				value: null,
				valueColor: new AlwaysStoppedAnimation<Color>(Style.primary),
				strokeWidth: 2.5
			)
		);
		if (isLoaded) {
			body = _buildBody();
		}
		return new Scaffold(
			backgroundColor: Colors.white,
			appBar: new AppBar(
				title: new Text(
					widget.chatroom.title,
				),
				backgroundColor: const Color.fromRGBO(250, 250, 250, 1.0),
				elevation: 0.0
			),
			body: body
		);
	}
}
