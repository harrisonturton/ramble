import 'package:flutter/material.dart';
import 'package:newsfeed_2/widgets/widgets.dart';
import 'package:newsfeed_2/style/style.dart' as Style;
import 'package:newsfeed_2/screens/screens.dart';
import 'package:newsfeed_2/mock/mock.dart';

import 'package:newsfeed_2/actions/actions.dart';
import 'package:newsfeed_2/reducers/reducers.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/model/app_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:newsfeed_2/middleware/middleware.dart';


void main() {
	final store = new Store(
		appReducer,
		initialState: new AppState.initial(),
		middleware: createMiddleware()
	);
	runApp(new App(
		store: store
	));
}

class App extends StatelessWidget {
	App({this.store});
	final Store store;

	@override
	Widget build(BuildContext context) {
		return new StoreProvider<AppState>(
			store: store,
			child: new MaterialApp(
				title: "Social Media App",
				theme: new ThemeData(
					primaryColor: Colors.white,
					fontFamily: "Roboto"
				),
				home: new OnboardingScreen()
			)
		);
	}
}
