import 'package:flutter/material.dart';
import 'package:newsfeed_2/style/style.dart' as Style;
import 'package:newsfeed_2/widgets/widgets.dart';

class CommentInput extends StatelessWidget {

	Widget createInputStadium() {
		return new TextField(
			maxLines: null,
			style: new TextStyle(
				fontSize: 16.0,
				color: Style.TextDark
			),
			decoration: new InputDecoration(
				hintText: "Aa..."	,
				border: InputBorder.none,
			)
		);
	}

	@override
	Widget build(BuildContext context) {
		return new Container(
			padding: const EdgeInsets.only(
				top: 2.0, bottom: 2.0,
				left: 25.0
			),
			child: new Row(
				children: [
					new Flexible(
						child: createInputStadium()
					),
					new Container(
						padding: const EdgeInsets.only(right: 5.0),
						child: new Material(
							color: Colors.white,
							child: new IconButton(
								icon: new Icon(Icons.send),
								iconSize: 20.0,
								onPressed: () {},
								color: Style.Primary
							)
						)
					)
				]
			),
			decoration: new BoxDecoration(
				color: Colors.white,
				boxShadow: [
					new BoxShadow(
						color: const Color.fromRGBO(0, 0, 0, 0.05),
						offset: new Offset(0.0, -3.5),
						blurRadius: 5.0
					)
				]
			)
		);
	}
}
