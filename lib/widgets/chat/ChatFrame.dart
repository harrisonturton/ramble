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
						content: "weee"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "weee"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "weee"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "weee"
					),
					new HomeComment(
						author: new MockPerson(),
						content: "weee"
					),
				]
			),
		);
	}
}
