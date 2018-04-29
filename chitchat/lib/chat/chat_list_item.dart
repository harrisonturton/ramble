import "package:chitchat/common/style.dart" as Style;
import "package:flutter/material.dart";
import "package:chitchat/common/common.dart";

class ChatListItem extends StatelessWidget {
	ChatListItem({
		this.title="Harrison Turton",
		this.timestamp="3 mins",
		this.recentMessage="yoyo anyone fence jumping"
	});
	final String title;
	final String timestamp;
	final String recentMessage;

	@override
	Widget build(BuildContext context) {
		return new Container(
			padding: const EdgeInsets.only(
				left: 25.0, right: 25.0,
				bottom: 30.0,
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
		);
	}
}
