import "dart:ui";
import "package:flutter/material.dart";
import "package:chitchat/common/style.dart" as Style;
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatelessWidget {

	final TextStyle _headerStyle = new TextStyle(
		fontFamily: "Hind",
		fontSize: 20.0,
		fontWeight: FontWeight.w400,
		color: Style.text,
		height: 0.9
	);
	final TextStyle _subheaderStyle = new TextStyle(
		fontFamily: "Hind",
		fontSize: 18.0,
		color: Style.textLight,
		height: 1.25
	);

	Widget buildComment({
		BuildContext context,
		String header,
		String subheader,
		bool isLink=false
	}) {
		double height = MediaQuery.of(context).size.height;
		double width = MediaQuery.of(context).size.width;
		final TextStyle _linkStyle = new TextStyle(
			fontFamily: "Hind",
			fontSize: 20.0,
			fontWeight: FontWeight.w600,
			color: Style.primary,
			decoration: TextDecoration.underline,
		);
		Widget textElem = new Text(
			subheader,
			style: _subheaderStyle,
			textAlign: TextAlign.center
		);
		if (isLink) {
			textElem = new InkWell(
				onTap: () => launch("https://www.google.com.au"),
				child: new Text(
					subheader,
					style: _linkStyle,
				)
			);
		}
		return new Container(
			margin: new EdgeInsets.symmetric(horizontal: width / 6.0),
			child: new Column(
				children: [
					new Padding(padding: new EdgeInsets.only(top: height / 3.0)),
					new Text(
						header,
						style: _headerStyle,
						textAlign: TextAlign.center
					),
					new Padding(padding: const EdgeInsets.symmetric(vertical: 15.0)),
					textElem
				]
			)
		);
	}

	@override
	Widget build(BuildContext context) {
		final double height = MediaQuery.of(context).size.height;
		final TextStyle logoStyle = new TextStyle(
			fontFamily: "Hind",
			fontSize: 42.0,
			fontWeight: FontWeight.w400,
			color: Style.primary,
			height: 0.9
		);
		return new Scaffold(
			backgroundColor: Colors.white,
			body: new DefaultTabController(
				length: 4,
				child: new Container(
					// Need stack otherwise overscroll glow is clipped,
					// and looks bad.
					child: new Stack(
						children: [
							new Container(
								margin: new EdgeInsets.only(top: height / 6.0),
								child: new Row(
									mainAxisAlignment: MainAxisAlignment.center,
									children: [
										new Text(
											"chitchat",
											style: logoStyle
										)
									]
								)
							),
							new TabBarView(
								children: [
									buildComment(
										header: "Own your data.\nDon't be a product.",
										subheader: "Swipe right to learn more 👉",
										context: context
									),
									buildComment(
										header: "We don't spy on your private messages",
										subheader: "Swipe right to learn more 👉",
										context: context
									),
									buildComment(
										header: "We don't sell your data to anyone",
										subheader: "Swipe right to learn more 👉",
										context: context
									),
									buildComment(
										header: "If you delete something, we forget it completely",
										subheader: "Link here",
										context: context,
										isLink: true
									),
								]
							),
							new Column(
								children: [
									// Push buttons to bottom of screen
									new Expanded(child: new Column()),
									new Container(
										margin: const EdgeInsets.only(
											left: 25.0, right: 25.0, bottom: 25.0
										),
										child: new Column(
											crossAxisAlignment: CrossAxisAlignment.stretch,
											children: [
												new FlatButton(
													onPressed: () {},
													shape: new StadiumBorder(),
													color: Style.primary,
													highlightColor: Style.primaryHighlight,
													textColor: Colors.white,
													child: new Padding(
														padding: const EdgeInsets.symmetric(vertical: 12.0),
														child: const Text("REGISTER")
													)
												),
												new Padding(padding: const EdgeInsets.symmetric(vertical: 7.0)),
												new OutlineButton(
													onPressed: () {},
													shape: new StadiumBorder(),
													color: Style.primary,
													highlightColor: Style.primaryHighlight,
													highlightedBorderColor: Style.primaryHighlight,
													highlightElevation: 0.0,
													textColor: Style.primary,
													borderSide: new BorderSide(width: 2.0, color: Style.primary),
													child: new Padding(
														padding: const EdgeInsets.symmetric(vertical: 12.0),
														child: const Text("LOGIN")
													)
												),
											]
										)
									)
								]
							)
						]
					)
				)
			),
		);
	}
}
