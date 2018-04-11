import 'package:flutter/material.dart';
import 'package:newsfeed_2/style/style.dart' as Style;
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:newsfeed_2/model/app_state.dart';

class NewAccountScreen extends StatelessWidget {
	NewAccountScreen({this.store});
	Store<AppState> store;

	void _routeToEmail(BuildContext context) {
		Navigator.of(context).push(new MaterialPageRoute(
			builder: (context) {
				return new EmailScreen();
			}
		));
	}

	@override
	Widget build(BuildContext context) {
		return new _SingleQuestionScreen(
			title: "Sign Up",
			question: "We'll guide you through this process!",
			onPressed: () => _routeToEmail(context),
			inputField: null,
		);
	}
}

class EmailScreen extends StatelessWidget {

	void _routeToPassword(BuildContext context) {
		Navigator.of(context).push(new MaterialPageRoute(
			builder: (context) {
				return new PasswordScreen();
			}
		));
	}

	@override
	Widget build(BuildContext context) {
		return new _SingleQuestionScreen(
			title: "Sign Up",
			question: "What is your email?",
			onPressed: () => _routeToPassword(context),
			inputField: new TextField(
				decoration: new InputDecoration(
					hintText: "Email..."
				)
			),
		);
	}
}

class PasswordScreen extends StatelessWidget {

	void _routeToUsername(BuildContext context) {
		Navigator.of(context).push(new MaterialPageRoute(
			builder: (context) {
				return new UsernameScreen();
			}
		));
	}

	@override
	Widget build(BuildContext context) {
		return new _SingleQuestionScreen(
			title: "Sign Up",
			question: "Choose a password...",
			onPressed: () => _routeToUsername(context),
			inputField: new TextField(
				obscureText: true,
				decoration: new InputDecoration(
					hintText: "Password..."
				)
			),
		);
	}
}

class UsernameScreen extends StatelessWidget {

	void _routeToPassword(BuildContext context) {
		Navigator.of(context).push(new MaterialPageRoute(
			builder: (context) {
				return new PasswordScreen();
			}
		));
	}

	@override
	Widget build(BuildContext context) {
		return new _SingleQuestionScreen(
			title: "Sign Up",
			question: "Choose a username! Can be changed later, must be unique.",
			onPressed: () => {},
			inputField: new TextField(
				decoration: new InputDecoration(
					hintText: "Username..."
				)
			),
		);
	}
}

class _SingleQuestionScreen extends StatelessWidget {
	_SingleQuestionScreen({this.title, this.question, this.inputField, this.onPressed});
	final String title;
	final String question;
	final TextField inputField;
	VoidCallback onPressed;

	@override
	Widget build(BuildContext context) {
		double height = MediaQuery.of(context).size.height;
		return new Scaffold(
			body: new Container(
				padding: new EdgeInsets.only(top: height / 5.0),
				child: new Center(
					child: new Column(
						children: [
							new Container(
								padding: const EdgeInsets.all(15.0),
								child: new Text(
									this.title,
									style: Style.OnboardingSubtitle,
									textAlign: TextAlign.center,
								)
							),
							new Container(
								margin: const EdgeInsets.only(top: 50.0, bottom: 15.0, left: 15.0, right: 15.0),
								child: new Text(this.question, style: Style.OnboardingQuestion),
							),
							this.inputField != null
							? new Container(
								margin: const EdgeInsets.only(top: 10.0),
								padding: const EdgeInsets.symmetric(horizontal: 25.0),
								child: this.inputField
							)
							: null,
							new Container(
								margin: const EdgeInsets.only(top: 100.0),
								child: new RaisedButton(
									onPressed: onPressed,
									color: Style.Primary,
									padding: const EdgeInsets.symmetric(
										vertical: 10.0,
										horizontal: 50.0
									),
									child: new Text(
										"Next",
										style: new TextStyle(
											color: Colors.white,
											fontSize: 18.0
										)
									)
								)
							)
						].where((i) => i != null).toList()
					)
				)
			)
		);
	}
}
