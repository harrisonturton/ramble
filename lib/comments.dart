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
			body: new Container(
				color: Colors.white,
				child: new SingleChildScrollView(
					child: new Column(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: [
							new PostHero(
								post: post,
								onCommentTap: () => Navigator.of(context).pop()
							),
							new ChatFrame(),
							new CommentInput()
						]
					)
				)
			)
		);
	}
}

