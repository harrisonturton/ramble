import "package:chitchat/common/style.dart" as Style;
import "package:flutter/material.dart";
import "package:chitchat/common/common.dart";
import "package:chitchat/chat/chat.dart";

class ChatScreen extends StatelessWidget {
	Widget build(BuildContext context) {
		return new ListView(
			children: [
				new ChatListItem(),
				new ChatListItem(),
				new ChatListItem(),
				new ChatListItem(),
				new ChatListItem(),
				new ChatListItem(),
			]		
		);
	}
}

/*
						new Container(
							padding: const EdgeInsets.symmetric(
								vertical: 15.0,
								horizontal: 25.0
							),
							child: new Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: [
									new Text(
										"ChitChat",
										style: Style.header
									),
									new Icon(Icons.search, color: Style.text),
								]
							)
						),*/
