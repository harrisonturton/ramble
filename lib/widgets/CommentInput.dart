import 'package:flutter/material.dart';
import 'package:newsfeed_2/style/style.dart';

class CommentInput extends StatelessWidget {
	@override
	void build(BuildContext context) {
		return new Container(
			child: new TextField(
				maxLines: null,
				decoration: new InputDecoration(
					hintText: "Aa...",
					border: InputBorder.none,
					contentPadding: new EdgeInsets.all(0.0)
				)
			),
			margin: new EdgeInsets.all(15.0),
			padding: new EdgeInsets.only(
				left: 15.0, right: 15.0,
				top: 10.0, bottom: 5.0
			),
			decoration: new BoxDecoration(
				borderRadius: new BorderRadius.circular(10.0),
				border: new Border.all(
					color: const Color.fromRGBO(135, 160, 181, 0.7),
					width: 1.0),
				color: Colors.white,
			)
		);

	}
}
