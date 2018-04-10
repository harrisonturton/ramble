import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:newsfeed_2/style/style.dart' as Style;
import 'package:newsfeed_2/actions/actions.dart';
import 'package:newsfeed_2/reducers/reducers.dart';
import 'package:newsfeed_2/model/app_state.dart';
import 'main_screen.dart';

class OnboardingScreen extends StatelessWidget {

	void handleLogIn(BuildContext context) {
		Navigator.of(context).pushReplacement(new MaterialPageRoute(
			builder: (context) => new MainScreen()
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
							padding: new EdgeInsets.only(top: height / 3.0),
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
