import "package:flutter/material.dart";
import "package:chitchat/state/state.dart";
import "package:chitchat/common/common.dart";
import "package:chitchat/common/style.dart" as Style;
import "friend_list_item.dart";

class NewFriendScreen extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			backgroundColor: Colors.white,
			appBar: new AppBar(
				backgroundColor: Colors.white,
				title: new TextField(
					autofocus: true,
					decoration: new InputDecoration(
						border: InputBorder.none,
					)
				)
			),
			body: new ListView(
				children: [
					new FriendListItem(),
					new FriendListItem(),
					new FriendListItem(),
					new FriendListItem(),
					new FriendListItem(),
					new FriendListItem(),
					new FriendListItem(),
					new FriendListItem(),
				]
			)
		);
	}
}
