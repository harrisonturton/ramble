import "package:flutter/material.dart";
import "package:chitchat/state/state.dart";
import "package:chitchat/chat/chat.dart";
import "package:chitchat/common/style.dart" as Style;

class MessageBubbleHome extends StatelessWidget {
	MessageBubbleHome({
		this.message,
	});
	final Message message;

	@override
	Widget build(BuildContext context) {
		return new MessageBubble(
			message: message,
			alignment: Alignment.centerRight,
			color: Style.homeMessageBubble,
			contentStyle: Style.homeMessageContent
		);
	}
}
