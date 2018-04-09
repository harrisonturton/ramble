import 'package:flutter/material.dart';
import 'package:newsfeed_2/widgets/widgets.dart';
import 'package:newsfeed_2/mock/mock.dart';

class Messages extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new ListView(
			padding: const EdgeInsets.all(0.0),
			children: [
				new ChatListItem(
					person: new MockPerson()
				),
				new ChatListItem(
					person: new MockPerson()
				),
				new ChatListItem(
					person: new MockPerson()
				),
				new ChatListItem(
					person: new MockPerson()
				),
				new ChatListItem(
					person: new MockPerson()
				),
				new ChatListItem(
					person: new MockPerson()
				),
				new ChatListItem(
					person: new MockPerson()
				),
				new ChatListItem(
					person: new MockPerson()
				),
			]
		);
	}
}

