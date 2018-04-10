import 'package:flutter/material.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/widgets/widgets.dart';

class CommentScreen extends StatelessWidget {
	CommentScreen({Key key, this.post}) : super(key: key);
	final Model.Post post;

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			backgroundColor: const Color.fromRGBO(250,250,250,1.0),
			appBar: new AppBar(
				title: const Text("Thread"),
				elevation: 0.0
			),
			body: new Column(
				children: [
					new Expanded(
						child: new ListView(
							children: [
								new Container(
									decoration: new BoxDecoration(
										boxShadow: [
											new BoxShadow(
												color: const Color.fromRGBO(0,0,0,0.05),
												offset: new Offset(0.0, 3.5),
												blurRadius: 7.0
											)
										]
									),
									child: new PostHero(
										post: post,
										onCommentTap: () => Navigator.of(context).pop()
									),
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

