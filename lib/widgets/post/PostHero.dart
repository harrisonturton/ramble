import 'package:flutter/material.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/widgets/widgets.dart';

class PostCardHero extends StatelessWidget {
	PostCardHero({this.post});
	Model.Post post;

	void handleTap(BuildContext context) {
		//MaterialPageRoute.debugEnableFadingRoutes = true;
		Navigator.of(context).push(new MaterialPageRoute(
			builder: (context) {
				return new Scaffold(
					body: new GestureDetector(
						onTap: () => Navigator.of(context).pop(),
						child: new PostHero(post: post)
					)
				);
			}
		));
	}

	@override
	void build(BuildContext context) {
		var timeDilation = 5.0;
		return new GestureDetector(
			onTap: () => handleTap(context),
			child: new Hero(
				tag: post,
				child: new PostCard(post: post)
			)
		);
	}
}

class PostHero extends StatelessWidget {
	PostHero({this.post});
	Model.Post post;

	@override
	void build(BuildContext context) {
		var timeDilation = 5.0;
		return new GestureDetector(
			onTap: () => Navigator.of(context).pop(),
			child: new Hero(
				tag: post,
				child: new Post(post: post)
			)
		);
	}
}
