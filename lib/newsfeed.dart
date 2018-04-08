import 'package:flutter/material.dart';
import 'package:newsfeed_2/widgets/widgets.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/mock/mock.dart';

class Newsfeed extends StatelessWidget {

	Widget newPost() => new PostCardHero(post: new MockPost());

	@override
	Widget build(BuildContext context) {
		return new ListView(
			children: [
				newPost(),
				newPost(),
				newPost(),
				newPost(),
				newPost(),
				newPost(),
				newPost(),
				newPost(),
				newPost(),
				newPost(),
				newPost(),
				newPost(),
				newPost(),
				newPost(),
			]
		);
	}
}
