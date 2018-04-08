import 'package:flutter/material.dart';
import 'package:newsfeed_2/mock/mock.dart';
import 'package:newsfeed_2/widgets/widgets.dart';
import 'HomeComment.dart';
import 'AwayComment.dart';

class ChatFrame extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new Container(
			padding: const EdgeInsets.all(15.0),
			child: new Column(
				//mainAxisSize: MainAxisSize.min,
				children: [
					new HomeComment(
						author: new MockPerson(),
						content: "Wow! What a good post!"
					),
					new AwayComment(
						author: new MockPerson(),
						content: "Commenting is so fun"
					),
					new AwayComment(
						author: new MockPerson(),
						content: "Weewoo emojis 😍😍😘"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "Noice"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "Noice"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "Noice"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "Noice"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "Noice"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "fuck yea we can scroll"
					),
					new CommentInput()
				]
			)
		);
	}
}
