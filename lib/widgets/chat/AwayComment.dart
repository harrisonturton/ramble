import 'package:flutter/material.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/style/style.dart' as Style;
import 'Comment.dart';

class AwayComment extends StatelessWidget {
	AwayComment({this.author, this.content});
	Model.Person author;
	String content;

	@override
	Widget build(BuildContext context) {
		return new Comment(
			author: author,
			content: content,
			alignment: Alignment.centerLeft,
			color: Style.AwayComment,
		);
	}
}
