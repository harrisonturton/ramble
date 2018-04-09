import 'package:flutter/material.dart';
import 'package:newsfeed_2/widgets/widgets.dart';
import 'package:newsfeed_2/style/style.dart' as Style;
import 'newsfeed.dart';
import 'messages.dart';
import 'onboarding.dart';

void main() => runApp(new App());

class App extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new MaterialApp(
			title: "Social Media App"	,
			theme: new ThemeData(
				primaryColor: Colors.white,
				fontFamily: "Roboto"
			),
			home: new Onboarding()
		);
	}
}
