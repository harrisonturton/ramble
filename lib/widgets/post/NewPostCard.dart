import 'package:flutter/material.dart';
import 'package:newsfeed_2/style/style.dart';

class NewPostCard extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new Container(
			margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
			padding: const EdgeInsets.only(
				left: 20.0, right: 20.0,
				top: 10.0, bottom: 20.0
			),
			child: new Column(
				mainAxisSize: MainAxisSize.min,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					new TextField(
						decoration: new InputDecoration(
							hintText: "Aa..."
						)
					)
				]
			),
			decoration: new BoxDecoration(
				color: Colors.white,
				borderRadius: new BorderRadius.circular(5.0),
				boxShadow: <BoxShadow>[
					new BoxShadow(
						color: const Color.fromRGBO(135, 160, 181, 0.2),
						offset: new Offset(0.0, 3.5),
						blurRadius: 7.0
					)
				]
			)
		);
	}
}
