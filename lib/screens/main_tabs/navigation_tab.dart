import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newsfeed_2/screens/onboarding_screen.dart';
import 'dart:async';

class NavigationTab extends StatelessWidget {
	
	void _handleLogout(BuildContext context) async {
		FirebaseAuth _auth = FirebaseAuth.instance;
		await _auth.signOut();
		Navigator.of(context).pushReplacement(new MaterialPageRoute(
			builder: (context) {
				return new OnboardingScreen();
			}
		));
	}

	@override
	Widget build(BuildContext context) {
		return new ListView(
			children: [
				new RaisedButton(
					onPressed: () => _handleLogout(context),
					child: const Text("Log out")
				),
				const Text("Navigation"),
				const Text("Navigation"),
				const Text("Navigation"),
				const Text("Navigation"),
				const Text("Navigation"),
				const Text("Navigation"),
			]
		);
	}
}
