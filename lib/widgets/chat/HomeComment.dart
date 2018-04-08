import 'package:flutter/material.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
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
			color: const Color.fromRGBO(66, 134, 245, 1.0),
			fontColor: Colors.white
		);
	}
}
