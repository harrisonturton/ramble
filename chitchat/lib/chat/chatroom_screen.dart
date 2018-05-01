import "dart:async";
import "package:flutter/material.dart";
import "package:chitchat/state/state.dart";
import "package:chitchat/common/style.dart" as Style;
import "package:chitchat/common/common.dart";
import "package:chitchat/common/firebase.dart" as Firebase;
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


	@override
	void initState() {
		print("Initiating chatroom state...");
		_getMessages();
		_scrollController.addListener(() {
			print(_scrollController.offset);
		});
	}

	void _getMessages() {
		Firebase.streamMessages(widget.chatroom.id).listen((List<Message> messages) {
			setState(() {
				this.isLoaded = true;
				this.messages = messages;
			});
		});
	}

	void _sendMessage() {
		if (_controller.text == "") return;
		Firebase.sendMessageDev(
			name: "Harrison Turton",
			chatroomId: widget.chatroom.id,
			content: _controller.text
		).then((_) {
			_controller.clear();
			_scrollController.animateTo(
				_scrollController.position.maxScrollExtent + 100.0,
				curve: Curves.easeOut,
				duration: const Duration(milliseconds: 300)
			);
		});
	}

	@override
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

		List<Widget> listItems = new List();
		messages.forEach((Message message) => listItems.add(new MessageBubbleHome(
			message: message
		)));
		listItems.add(new VerticalSpace(35.0));

		return new Scaffold(
			body: new Stack(
				children: [
					new CustomScrollView(
						controller: _scrollController,
						slivers: [
							new SliverAppBar(
								floating: true,
								elevation: 0.0,
								backgroundColor: const Color.fromRGBO(250, 250, 250, 1.0),
								title: new Text(widget.chatroom.title),
							),
							new SliverList(
								delegate: new SliverChildListDelegate(
									listItems
								)
							)
						]
					),
					new Column(
						children: [
							// Push to bottom of screen
							new Expanded(child: new Column()),
							new Padding(
								padding: const EdgeInsets.only(
									left: 15.0, right: 15.0,
									bottom: 15.0
								),
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
	}
}
