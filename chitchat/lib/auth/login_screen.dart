import "package:flutter/material.dart";
import "package:chitchat/common/style.dart" as Style;

class LoginScreen extends StatefulWidget<_LoginScreenState> {

	@override
	_LoginScreenState createState () => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

	final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

	@override
	Widget build(BuildContext context) {
		double height = MediaQuery.of(context).size.height;
		return new Scaffold(
			backgroundColor: Colors.white,
			body: new Column(
				crossAxisAlignment: CrossAxisAlignment.stretch,
				children: [
					new Expanded(
						child: new Container(
							padding: const EdgeInsets.symmetric(horizontal: 30.0),
							child: new Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									new Padding(padding: new EdgeInsets.symmetric(vertical: height / 16.0)),
									new Text(
										"Welcome back!",
										style: new TextStyle(
											color: Style.text,
											fontSize: 26.0,
											fontWeight: FontWeight.w600
										)
									),
									new Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
									new Text(
										"It's good to see you again 😊",
										style: new TextStyle(
											color: Style.textLight,
											fontSize: 18.0,
											fontWeight: FontWeight.w400
										)
									),
									new Padding(padding: const EdgeInsets.symmetric(vertical: 10.0)),
									new Form(
										key: _formKey,
										autovalidate: true,
										child: new Column(
											crossAxisAlignment: CrossAxisAlignment.start,
											children: [ 
												new TextFormField(
													autofocus: true,
													validator: (val) => !val.contains("@") ? "Not a valid email." : null,
													decoration: new InputDecoration(
														labelText: "Email",
														hintText: "coolclown99@aol.com",
														border: new UnderlineInputBorder(borderSide: new BorderSide(width: 2.0, color: Style.primary))
													)
												),
												new Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
												new TextFormField(
													obscureText: true,
													decoration: new InputDecoration(
														labelText: "Password",
														border: new UnderlineInputBorder(borderSide: new BorderSide(width: 2.0, color: Style.primary))
													)
												),
											]
										)
									),
								]
							)
						)
					),
					new Container(
						margin: const EdgeInsets.only(
							left: 25.0, right: 25.0, bottom: 25.0
						),
						child: new OutlineButton(
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
					),
				]
			)
		);
	}
}
