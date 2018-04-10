import 'package:flutter/material.dart';
import 'package:newsfeed_2/style/style.dart' as Style;
import 'dart:ui';
import 'main_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();

void setData() {
	Firestore.instance.collection("users").document().setData({
		"first_name": "Harry",
		"last_name": "Turton",
		"email": "harrisonturton@gmail.com"
	});
}

Future<String> _testSignInWithGoogle() async {
	GoogleSignInAccount googleUser = await googleSignIn.signIn();
	GoogleSignInAuthentication googleAuth = await googleUser.authentication;
	FirebaseUser user = await auth.signInWithGoogle(
		accessToken: googleAuth.accessToken,
		idToken: googleAuth.idToken,
	);
	assert(user.email != null);
	assert(user.displayName != null);
	print("This user is signed in ${user}");
	return "signInWithGoogle succeeded: ${user}";
}

class OnboardingScreen extends StatelessWidget {

	void handleLogIn(BuildContext context) {
		print("Trying to log in...");
		setData();
		//_testSignInWithGoogle();
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
