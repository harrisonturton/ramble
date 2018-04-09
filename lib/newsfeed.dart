import 'package:flutter/material.dart';
import 'package:newsfeed_2/widgets/widgets.dart';
import 'package:newsfeed_2/style/style.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/mock/mock.dart';
import 'dart:async';

class Newsfeed extends StatelessWidget {

	Widget newPost() => new PostCardHero(post: new MockPost());

	Future onRefresh() async {
		//this.request?.timeout(const Duration());
		return true;
	}

	@override
	Widget build(BuildContext context) {
		return new RefreshIndicator(
			onRefresh: onRefresh,
			color: Primary,
			child: new ListView(
				padding: const EdgeInsets.all(0.0),
				children: [
					new NewPostCard(),
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
			)
		);
	}
}
