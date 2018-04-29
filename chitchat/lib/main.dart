import "package:flutter/material.dart";
import "package:chitchat/common/style.dart" as Style;
import "package:chitchat/welcome/welcome.dart";
import "main_screen.dart";

import "package:redux/redux.dart";
import "package:chitchat/state/state.dart";
import "package:flutter_redux/flutter_redux.dart";

void main() {
	final store = new Store(
		appReducer,
		initialState: new AppState.initial(),
		middleware: [LoginMiddleware]
	);
	runApp(new App(store));
}

class App extends StatelessWidget {
	App(this.store);
	final Store<AppState> store;

	@override
	Widget build(BuildContext context) {
		return new StoreProvider<AppState>(
			store: store,
			child: new MaterialApp(
				title: "ChitChat",
				theme: ThemeData(
					primaryColor: Style.primary,
					hintColor: Style.textFaint,
					primaryTextTheme: new TextTheme(
						title: Style.header,
					)
				),
				home: new Scaffold(
					body: new WelcomeScreen(),
				)
			)
		);
	}
}
