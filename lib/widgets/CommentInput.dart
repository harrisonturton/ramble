import 'package:flutter/material.dart';

class CommentInput extends StatelessWidget {
	@override
	void build(BuildContext context) {
		return new Container(
			child: new TextField(),
			margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
			decoration: new BoxDecoration(
				borderRadius: new BorderRadius.circular(50.0),
				color: Colors.white,
			)
		);

	}
}
