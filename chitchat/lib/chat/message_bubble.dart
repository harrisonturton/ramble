import "package:flutter/material.dart";
import "package:chitchat/state/state.dart";

class MessageBubble extends StatelessWidget {
	MessageBubble({
		this.message,
		this.color,
		this.contentStyle,
		this.alignment,
	});
	final Message message;
	final Color color;
	final TextStyle contentStyle;
	AlignmentGeometry alignment;

	@override
	Widget build(BuildContext context) {
		return new Align(
			alignment: alignment,
			child: new Container(
				margin: const EdgeInsets.symmetric(
					horizontal: 15.0,
					vertical: 2.5
				),
				padding: const EdgeInsets.symmetric(
					horizontal: 15.0,
					vertical: 12.0,
				),
				child: new Text(
					message.content,
					style: contentStyle
				),
				decoration: new BoxDecoration(
					color: color,
					borderRadius: new BorderRadius.circular(22.0)
				)
			),
		);
	}
}
