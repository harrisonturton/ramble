import 'package:flutter/material.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/style/style.dart' as Style;
import 'Comment.dart';

class HomeComment extends StatelessWidget {
	HomeComment({this.author, this.content});
	Model.Person author;
	String content;

	@override
	Widget build(BuildContext context) {
		return new Comment(
			author: author,
			content: content,
			alignment: Alignment.centerRight,
			color: Style.HomeComment,
			fontColor: Colors.white
		);
	}
}
