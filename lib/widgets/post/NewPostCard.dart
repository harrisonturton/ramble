import 'package:flutter/material.dart';
import 'package:newsfeed_2/style/style.dart';

class NewPostCard extends StatelessWidget {

	void handleTap(BuildContext context) {
		Navigator.of(context).push(new MaterialPageRoute(
			builder: (context) {
				return new Scaffold(
					body: new Container(
						color: Colors.white,
						padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
						child: new TextField(
							maxLines: null,
							style: new TextStyle(
								color: TextDark,
								height: 1.25,
								fontSize: 24.0,
							),
							decoration: new InputDecoration(
								hintText: "Aa...",
							)
						)
					)		
				);
			}
		));
	}

	@override
	Widget build(BuildContext context) {
		return new GestureDetector(
			onTap: () => handleTap(context),
			child: new Container(
				//margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
				padding: const EdgeInsets.all(20.0),
				child: new Column(
					mainAxisSize: MainAxisSize.min,
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						new Text(
							"Aa...",
							style: new TextStyle(
								fontSize: 16.0,
								color: TextLight
							)
						)
					]
				),
				decoration: new BoxDecoration(
					color: Colors.white,
					borderRadius: new BorderRadius.circular(5.0),
					/*boxShadow: <BoxShadow>[
						new BoxShadow(
							color: const Color.fromRGBO(135, 160, 181, 0.2),
							offset: new Offset(0.0, 3.5),
							blurRadius: 7.0
						)
					]*/
				)
			)
		);
	}
}
