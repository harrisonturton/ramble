import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:newsfeed_2/model/app_state.dart';

class SignInScreen extends StatelessWidget {
	SignInScreen({this.store});
	Store<AppState> store;

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			body: new Center(
				child: const Text("Sign in via email")
			)
		);
	}
}

