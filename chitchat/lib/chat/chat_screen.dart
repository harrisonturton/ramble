import "package:chitchat/common/style.dart" as Style;
import "package:flutter/material.dart";
import "package:chitchat/common/common.dart";
import "package:chitchat/chat/chat.dart";

import "package:redux/redux.dart";
import "package:chitchat/state/state.dart";
import "package:flutter_redux/flutter_redux.dart";

class ChatScreen extends StatelessWidget {
	Widget build(BuildContext context) {
		return new StoreConnector<AppState, Store<AppState>>(
			converter: (store) => store,
			builder: (context, store) {
				return new ListView(
					children: store.state.chatrooms.map((ChatRoom room) {
						print(room);
						return new ChatListItem(
							title: room.title,
							recentMessage: room.recentMessage,
							timestamp: room.timestamp
						);
					}).toList()
				);
			}
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
