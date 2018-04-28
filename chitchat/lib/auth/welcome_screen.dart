import "dart:ui";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";
import "package:chitchat/common/style.dart" as Style;
import "package:chitchat/common/common.dart";

class WelcomeScreen extends StatefulWidget<_WelcomeScreenState> {

	@override
	_WelcomeScreenState createState() => new _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
	
	final _formKey = new GlobalKey<FormState>();
	final _emailController = new TextEditingController();
	final _passwordController = new TextEditingController();

	@override
	Widget build(BuildContext context) {
		double height = MediaQuery.of(context).size.height;
		return new Container(
			padding: const EdgeInsets.only(
				left: 30.0, right: 30.0, bottom: 30.0
			),
			child: new Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					new VerticalSpace(height / 12.0),
					new Text(
						"welcome to",
						style: Style.welcomeStyleLight
					),
					new Text(
						"chitchat.",
						style: Style.welcomeStyle
					),
					new Expanded(child: new Column()),
					new Form(
						key: _formKey,
						autovalidate: true,
						child: new Column(
							crossAxisAlignment: CrossAxisAlignment.stretch,
							children: [
								new TextFormField(
									controller: _emailController,
									decoration: new InputDecoration(
										labelText: "Email",
										labelStyle: new TextStyle(
											color: Style.textFaint
										)
									)
								),
								new VerticalSpace(5.0),
								new TextFormField(
									controller: _passwordController,
									obscureText: true,
									decoration: new InputDecoration(
										labelText: "Password",
										labelStyle: new TextStyle(
											color: Style.textFaint
										)
									)	
								),
								new VerticalSpace(15.0),
								new StrongButton(
									onPressed: () {},
									text: "LOGIN"
								),
								new Container(
									padding: const EdgeInsets.symmetric(vertical: 20.0),
									child: new Column(
										children: [
											new Text("OR", style: new TextStyle(color: Style.textLight))
										]
									)
								),
								new LightButton(
									onPressed: () {},
									text: "CREATE ACCOUNT"
								),
							]
						)
					)
				]
			)
		);
	}
}
