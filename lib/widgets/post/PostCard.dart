import 'package:flutter/material.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'post.dart';

class PostCard extends StatelessWidget {
	PostCard({this.post, this.hasActionBar=true});
	Model.Post post;
	bool hasActionBar;

	@override
	Widget build(BuildContext context) {
		return new Container(
			//margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
			child: new Post(
				post: post,
				hasActionBar: hasActionBar
			),
			decoration: new BoxDecoration(
				color: Colors.white,
				borderRadius: new BorderRadius.circular(5.0),
				//boxShadow: <BoxShadow>[
				//	new BoxShadow(
				//		color: const Color.fromRGBO(135, 160, 181, 0.2),
				//		offset: new Offset(0.0, 3.5),
				//		blurRadius: 7.0
				//	)
				//]
			)
		);
	}
}
