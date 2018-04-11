import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:newsfeed_2/style/style.dart' as Style;
import 'onboarding/new_account_screen.dart';
import 'onboarding/signin_screen.dart';
import 'main_screen.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:newsfeed_2/model/app_state.dart';
import 'package:newsfeed_2/actions/actions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class OnboardingScreen extends StatelessWidget {

	void _createNewAccount(Store<AppState> store, BuildContext context) {
		Navigator.of(context).push(new MaterialPageRoute(
			builder: (context) {
				return new NewAccountScreen(
					store: store
				);
			}
		));
	}

	void _signInEmail (Store<AppState> store, BuildContext context) {
		Navigator.of(context).push(new MaterialPageRoute(
			builder: (context) {
				return new SignInScreen(
					store: store
				);
			}
		));
	}

	void _signInGoogle (Store<AppState> store, BuildContext context) async {
		final FirebaseAuth _auth = FirebaseAuth.instance;
		final GoogleSignIn _googleSignIn = new GoogleSignIn();
		GoogleSignInAccount googleUser = await _googleSignIn.signIn();
		GoogleSignInAuthentication googleAuth = await googleUser.authentication;
		_auth.signInWithGoogle(
			accessToken: googleAuth.accessToken,
			idToken: googleAuth.idToken,
		).then((user) {
			store.dispatch(new Login(user));
			Navigator.of(context).pushReplacement(new MaterialPageRoute(
				builder: (context) {
					return new MainScreen();
				}
			));
		}).catchError((err) {
			print(err);
		});
	}

	@override
	Widget build(BuildContext context) {
		final FirebaseAuth _auth = FirebaseAuth.instance;
		_auth.currentUser().then((user) {
			if (user != null) {
				Navigator.of(context).pushReplacement(new MaterialPageRoute(
					builder: (context) {
						return new MainScreen();
					}
				));
			}
		});

		double height = MediaQuery.of(context).size.height;
		return new Scaffold(
			body: new StoreConnector<AppState, Store<AppState>>(
				converter: (store) => store,
				builder: (context, store) {
					return new Center(
						child: new Column(
							crossAxisAlignment: CrossAxisAlignment.center,
							mainAxisSize: MainAxisSize.min,
							children: [
								new Text(
									"Welcome to",
									style: new TextStyle(
										color: Style.TextDark,
										fontSize: 24.0
									)
								),
								new Text(
									"Post",
									style: new TextStyle(
										fontSize: 52.0,
										height: 1.15,
										color: Style.Primary,
										fontWeight: FontWeight.w300,
									)
								),
								new Container(
									margin: new EdgeInsets.only(
										top: 100.0,
										bottom: 25.0
									),
									child: new RaisedButton(
										onPressed: () => _createNewAccount(store, context),
										color: Style.Primary,
										padding: const EdgeInsets.symmetric(
											vertical: 10.0,
											horizontal: 35.0,
										),
										child: const Text(
											"Create new Account",
											style: const TextStyle(
												color: Colors.white,
												fontSize: 18.0
											)
										)
									)
								),
								new Container(
									margin: const EdgeInsets.only(bottom: 25.0),
									child: new RaisedButton(
										onPressed: () => _signInEmail(store, context),
										color: const Color.fromRGBO(167, 110, 255, 1.0),
										padding: const EdgeInsets.symmetric(
											vertical: 10.0,
											horizontal: 50.0,
										),
										child: new Text(
											"Sign in via Email",
											style: new TextStyle(
												color: Colors.white,
												fontSize: 18.0
											)
										)
									)
								),
								new RaisedButton.icon(
									onPressed: () => _signInGoogle(store, context),
									color: Colors.white,
									icon: new Image.asset(
										"assets/icons/icon_google_logo.png",
										width: 24.0
									),
									label: const Padding(
										padding: const EdgeInsets.all(10.0),
										child: const Text(
											"Sign in with Google",
											style: const TextStyle(
												color: const Color.fromRGBO(136,136,136,1.0),
												fontSize: 18.0
											)
										)
									)
								),
							]
						)
					);
				}
			)
		);
	}
}

/*
	Future<FirebaseUser> _handleSignIn() async {
		final FirebaseAuth _auth = FirebaseAuth.instance;
		final GoogleSignIn _googleSignIn = new GoogleSignIn();
		GoogleSignInAccount googleUser = await _googleSignIn.signIn();
		GoogleSignInAuthentication googleAuth = await googleUser.authentication;
		FirebaseUser user = await _auth.signInWithGoogle(
			accessToken: googleAuth.accessToken,
			idToken: googleAuth.idToken,
		);
		return user;
	}

	void handleLogIn(BuildContext context, Store<AppState> store) {
		_handleSignIn().then((user) {
			store.dispatch(new Login(user));
			Navigator.of(context).pushReplacement(new MaterialPageRoute(
				builder: (context) => new MainScreen()
			));
		});
	}
*/
