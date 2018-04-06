import 'package:flutter/material.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/widgets/widgets.dart';

class Comments extends StatelessWidget {
	Comments({Key key, this.post}) : super(key: key);
	final Model.Post post;

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			body: new Container(
				child: new PostHero(
					post: post,
				),
				decoration: new BoxDecoration(
					boxShadow: <BoxShadow>[
						new BoxShadow(
							color: const Color.fromRGBO(135, 160, 181, 0.2),
							offset: new Offset(0.0, 3.5),
							blurRadius: 15.0
						)
					]
				)
			)
		);
	}
}

