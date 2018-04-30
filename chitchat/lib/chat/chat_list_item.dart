import "package:chitchat/common/style.dart" as Style;
import "package:flutter/material.dart";
import "package:chitchat/common/common.dart";
import "package:chitchat/chat/chat.dart";

class ChatListItem extends StatelessWidget {
	ChatListItem({
		this.id,
		this.title="Harrison Turton",
		this.timestamp="3 mins",
		this.recentMessage="yoyo anyone fence jumping"
	});
	final String id;
	final String title;
	final String timestamp;
	final String recentMessage;

	void _openChatroom(BuildContext context) {
		Navigator.of(context).push(new MaterialPageRoute(
			builder: (_) => new ChatroomScreen(id: id)
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
									this.title,
									style: Style.chatName
								),
								new VerticalSpace(2.5),
								new Text(
									this.recentMessage,
									style: new TextStyle(
										color: const Color.fromRGBO(128, 137, 153, 1.0)
									)
								)
							]
						),
						new Text(
							this.timestamp,
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
