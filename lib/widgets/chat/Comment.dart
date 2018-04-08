import 'package:flutter/material.dart';
import 'package:newsfeed_2/model/model.dart' as Model;

class Comment extends StatelessWidget {
	Comment({this.author, this.content, this.color, this.fontColor, this.alignment});
	Model.Person author;
	Color color;
	Color fontColor=Colors.black;
	String content;
	AlignmentGeometry alignment;

	@override
	Widget build(BuildContext context) {
		//Scrollable.ensureVisible(context);
		return new Align(
			alignment: alignment,
			child: new Container(
				padding: const EdgeInsets.symmetric(
					horizontal: 15.0,
					vertical: 12.0
				),
				margin: const EdgeInsets.symmetric(vertical: 2.5),
				child: new Text(
					"${content}",
					style: new TextStyle(
						fontSize: 15.5,
						color: fontColor
					)
				),
				decoration: new BoxDecoration(
					color: color,
					borderRadius: new BorderRadius.circular(10.0)
				)
			)
		);
	}
}
