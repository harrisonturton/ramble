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
				children: [
					new HomeComment(
						author: new MockPerson(),
						content: "This is a comment."
					),
					new AwayComment(
						author: new MockPerson(),
						content: "Notice how it is structured as a chat?"
					),
					new AwayComment(
						author: new MockPerson(),
						content: "Isn't that neat."
					),
					new HomeComment(
						author: new MockPerson(),
						content: "Can we scroll?"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "Ignore this..."
					),
					new HomeComment(
						author: new MockPerson(),
						content: "aAAAAaaaaAAAaaaa"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "aAAAAaaaaAAAaaaa"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "aAAAAaaaaAAAaaaa"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "aAAAAaaaaAAAaaaa"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "aAAAAaaaaAAAaaaa"
					),
					new AwayComment(
						author: new MockPerson(),
						content: "pls stop"
					),
					new AwayComment(
						author: new MockPerson(),
						content: "Can we do multiple lines?"
					),
					new AwayComment(
						author: new MockPerson(),
						content: "aaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbccccccccccccccddddddddddddddddddeeeeeeeeeeeefffffffffffff"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "hell yea"
					)
				]
			),
		);
	}
}
