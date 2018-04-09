import 'package:flutter/material.dart';
import 'package:newsfeed_2/style/style.dart' as Style;
import 'package:newsfeed_2/widgets/widgets.dart';

class CommentInput extends StatelessWidget {

	Widget createInputStadium() {
		return new TextField(
			maxLines: null,
			style: new TextStyle(
				fontSize: 15.0,
				color: Style.TextDark
			),
			decoration: new InputDecoration(
				hintText: "Aa..."	,
				border: InputBorder.none,
			)
		);
	}

	@override
	void build(BuildContext context) {
		return new Container(
			padding: const EdgeInsets.only(
				top: 2.0, bottom: 2.0,
				left: 25.0
			),
			child: createInputStadium(),
			decoration: new BoxDecoration(
				color: Colors.white,
				border: new Border(
					//top: new BorderSide(width: 1.0, color: Colors.grey[300])
				),
				boxShadow: [
					new BoxShadow(
						color: const Color.fromRGBO(0, 0, 0, 0.05),
						offset: new Offset(0.0, -3.5),
						blurRadius: 5.0
					)
				]
			)
		);
		return new Container(
			child: new TextField(
				maxLines: null,
				style: new TextStyle(
					color: Colors.green,
					fontSize: 28.0,
				),
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
