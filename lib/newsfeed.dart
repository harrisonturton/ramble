import 'package:flutter/material.dart';
import 'package:newsfeed_2/widgets/widgets.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/mock/mock.dart';

class Newsfeed extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		var timeDilation = 5.0;
		return new Scaffold(
			backgroundColor: const Color.fromRGBO(251,251,251,1.0),
			body: new Padding(
				padding: const EdgeInsets.only(top: 30.0),
				child: new ListView(
					children: <Widget>[
						new NewPostCard(),
						new PostCardHero(
							post: new MockPost()
						),
						new PostCardHero(
							post: new MockPost()
						),
						new PostCardHero(
							post: new MockPost()
						),
						new PostCardHero(
							post: new MockPost()
						),
					]
				)
			)
		);
	}
}
