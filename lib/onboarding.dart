import 'package:flutter/material.dart';
import 'package:newsfeed_2/style/style.dart' as Style;
import 'dart:ui';
import 'home_screen.dart';

class Onboarding extends StatelessWidget {

	void handleLogIn(BuildContext context) {
		print("Trying to log in...");
		Navigator.of(context).pushReplacement(new MaterialPageRoute(
			builder: (context) => new HomeScreen()
		));
	}

	@override
	Widget build(BuildContext context) {
		double height = MediaQuery.of(context).size.height;
		return new Scaffold(
			body: new Container(
				padding: new EdgeInsets.only(top: height / 3.0),
				child: new Column(
					children: [
						new Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								new Text(
									"Welcome to",
									style: new TextStyle(
										color: Style.TextDark,
										fontSize: 24.0
									)
								)
							]
						),
						new Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								new Text(
									"Post",
									style: new TextStyle(
										fontWeight: FontWeight.w300,
										height: 1.15,
										fontSize: 52.0,
										color: Style.Primary
									)
								),
							]
						),
						new Padding(
							padding: const EdgeInsets.only(top: 30.0),
							child: new FlatButton(
								onPressed: () => handleLogIn(context),
								child: const Text("Log In")
							)
						)
					]
				)
			)
		);
	}
}
