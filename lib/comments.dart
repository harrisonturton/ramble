import 'package:flutter/material.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/widgets/widgets.dart';

class Comments extends StatelessWidget {
	Comments({Key key, this.post}) : super(key: key);
	final Model.Post post;

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			backgroundColor: Colors.white,
			appBar: new AppBar(
				title: const Text("Thread"),
				elevation: 2.0
			),
			body: new Column(
				children: [
					new Expanded(
						child: new ListView(
							children: [
								new PostHero(
									post: post,
									onCommentTap: () => Navigator.of(content).pop()
								),
								new ChatFrame()
							]
						),
					),
					//new PostHero(
					//	post: post,
					//	onCommentTap: () => Navigator.of(context).pop()
					//),
					new CommentInput(),
				]
			)
		);
	}
}

