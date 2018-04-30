import "package:flutter/material.dart";
import "package:chitchat/state/state.dart";
import "package:chitchat/chat/chat.dart";
import "package:chitchat/common/style.dart" as Style;

class MessageBubbleAway extends StatelessWidget {
	MessageBubbleAway({
		this.message,
	});
	final Message message;

	@override
	Widget build(BuildContext context) {
		return new MessageBubble(
			message: message,
			alignment: Alignment.centerLeft,
			color: Style.awayMessageBubble,
			contentStyle: Style.awayMessageContent
		);
	}
}
