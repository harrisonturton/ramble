import "package:flutter/material.dart";

class ChatroomScreen extends StatefulWidget<_ChatroomScreenState> {
	ChatroomScreen({this.id});
	final String id;

	_ChatroomScreenState createState() => new _ChatroomScreenState();

}

class _ChatroomScreenState extends State<ChatroomScreen> {

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(
				title: new Text("Chatroom ${widget.id}"),
			),
			body: new Center(
				child: const Text("Howdy")
			)
		);
	}
}
