import "dart:ui";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";
import "package:chitchat/common/style.dart" as Style;
import "package:chitchat/common/firebase.dart" as Firebase;
import "package:chitchat/common/common.dart";
import "package:chitchat/state/state.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:chitchat/main_screen.dart";

import "package:redux/redux.dart";
import "package:flutter_redux/flutter_redux.dart";
import "actions.dart";

class WelcomeScreen extends StatelessWidget {

	void _attemptLogin(BuildContext context, Store<AppState> store) {
		MaterialPageRoute.debugEnableFadingRoutes = true;
		Firebase.login(
			email: "harrisonturton@gmail.com",
			password: "test123"
		).then((FirebaseUser user) {
			store.dispatch(new Login(user: user));
			Navigator.of(context).pushAndRemoveUntil(
				new MaterialPageRoute(
					builder: (_) => new MainScreen()
				),
				(Route<dynamic> route) => false
			);
		}).catchError((err) => print("LOGIN ERROR: ${err}"));
	}

	Widget _buildText(String header, BuildContext context, { bool hasHint=true }) {
		double height = MediaQuery.of(context).size.height;
		return new Container(
			padding: const EdgeInsets.symmetric(horizontal: 30.0),
			child: new Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					new VerticalSpace(height / 14.0),
					new VerticalSpace(15.0),
					new Text(
						header,
						style: Style.welcomeStyleLight
					),
					new VerticalSpace(5.0),
					hasHint ?
						new Text(
							"Swipe right to learn more",
							style: Style.welcomeHint
						) : null,
				].where((i) => i != null).toList()
			)
		);
	}

	@override
	Widget build(BuildContext context) {
		double height = MediaQuery.of(context).size.height;
		return new StoreConnector<AppState, Store<AppState>>(
			converter: (store) => store,
			builder: (context, store) {
				return new DefaultTabController(
					length: 3,
					// Otherwise overscroll glow is clipped within TabBarView
					child: new Stack(
						children: [
							new Container(
								padding: new EdgeInsets.only(top: height / 14.0, left: 30.0),
								child: new Text(
									"chitchat",
									style: Style.welcomeStyle
								)
							),
							new TabBarView(
								children: [
									_buildText(
										"Own your data.\nDon't be a product.",
										context,
									),
									_buildText(
										"We'll never sell your data.",
										context,
									),
									_buildText(
										"When you delete something, we forget it completely.",
										context,
										hasHint: false
									),
								]
							),
							new Container(
								padding: const EdgeInsets.only(
									left: 30.0,
									right: 30.0,
									bottom: 30.0,
								),
								child: new Column(
									crossAxisAlignment: CrossAxisAlignment.stretch,
									children: [
										// Push children to bottom of screen
										new Expanded(child: new Column()),
										new StrongButton(
											onPressed: () => _attemptLogin(context, store),
											text: "LOGIN"
										),
										new VerticalSpace(5.0),
										new Column(
											children: [
												new Text(
													"OR",
													style: new TextStyle(color: Style.textLight)
												)
											]
										),
										new VerticalSpace(5.0),
										new LightButton(
											onPressed: () {},
											text: "CREATE ACCOUNT"
										),
										new VerticalSpace(5.0),
										new Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: [
												new TabPageSelector(
													indicatorSize: 10.0,
													color: Colors.white,
													selectedColor: Style.primary
												)
											]
										)
									]
								)
							)
						]
					)
				);
			}
		);
	}
}
