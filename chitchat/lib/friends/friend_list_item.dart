import "package:chitchat/common/style.dart" as Style;
import "package:flutter/material.dart";
import "package:chitchat/common/common.dart";
import "package:chitchat/state/state.dart";
import "package:chitchat/chat/chat.dart";

class FriendListItem extends StatelessWidget {
	FriendListItem({
		this.name="Harrison Turton",
		this.username="hazza99"
	});
	final String name;
	final String username;

	@override
	Widget build(BuildContext context) {
		return new InkWell(
			onTap: () => print("Open profile"),
			child: new Container(
				padding: const EdgeInsets.symmetric(
					horizontal: 25.0,
					vertical: 15.0,
				),
				child: new Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						new Row(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								new CircleAvatar(
									backgroundColor: Colors.grey[400],
									radius: 25.0
								),
								new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0)),
								new Column(
									mainAxisSize: MainAxisSize.min,
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										new Text(
											this.name,
											style: Style.chatName
										),
										new VerticalSpace(2.5),
										new Text(
											this.username,
											style: new TextStyle(
												color: const Color.fromRGBO(128, 137, 153, 1.0)
											)
										)
									]
								)
							]
						),
						new Image.asset(
							person_outline,
							color: Style.primary,
							width: 35.0
						)
					]
				)
			)
		);
	}
}
