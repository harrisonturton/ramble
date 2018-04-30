import "package:chitchat/common/style.dart" as Style;
import "package:flutter/material.dart";
import "package:chitchat/common/common.dart";
import "package:chitchat/state/state.dart";
import "package:chitchat/chat/chat.dart";

class ChatListItem extends StatelessWidget {
	ChatListItem({
		this.chatroom,
	});
	final Chatroom chatroom;

	void _openChatroom(BuildContext context) {
		Navigator.of(context).push(new MaterialPageRoute(
			builder: (_) => new ChatroomScreen(chatroom: chatroom)
		));
	}

	@override
	Widget build(BuildContext context) {
		return new InkWell(
			onTap: () => _openChatroom(context),
			child: new Container(
				padding: const EdgeInsets.symmetric(
					horizontal: 25.0,
					vertical: 15.0,
				),
				child: new Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						new Column(
							mainAxisSize: MainAxisSize.min,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								new Text(
									chatroom.title,
									style: Style.chatName
								),
								new VerticalSpace(2.5),
								new Text(
									chatroom.recentMessage,
									style: new TextStyle(
										color: const Color.fromRGBO(128, 137, 153, 1.0)
									)
								)
							]
						),
						new Text(
							chatroom.timestamp,
							style: new TextStyle(
								color: const Color.fromRGBO(128, 137, 153, 1.0)
							)
						)
					]
				)
			)
		);
	}
}
