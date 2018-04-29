import "package:flutter/material.dart";
import "package:chitchat/common/style.dart" as Style;
import "package:chitchat/welcome/welcome.dart";
import "main_screen.dart";

void main() => runApp(new App());

class App extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: "ChitChat",
			theme: ThemeData(
				primaryColor: Style.primary,
				hintColor: Style.textFaint,
				primaryTextTheme: new TextTheme(
					title: Style.header,
				)
			),
			home: new Scaffold(
				body: new MainScreen(),
			)
		);
	}
}
