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
				home: new Scaffold(
					body: new Center(
						child: new ListView(
							children: [
								new FlatButton(
									onPressed: () => store.dispatch(
										new AddFriend(friend: new MockPerson())
									),
									child: const Text("Add Friend")
								),
								new FlatButton(
									onPressed: () => store.dispatch(
										new RemoveFriend(friend: store.state.friends[0])
									),
									child: const Text("Remove Friend")
								),
								new FlatButton(
									onPressed: () => store.dispatch(
										new CreatePost(post: new MockPost())
									),
									child: const Text("Test Firestore connection (Check console)")
								),
								new FlatButton(
									onPressed: () => print(store.state.display()),
									child: const Text("Print store")
								),
								new StoreBuilder<AppState>(
									builder: (context, store) {
										List<Widget> children = new List<Widget>();
										store.state.friends.forEach((Model.Person friend) {
											children.add(new Text("${friend.firstName}"));
										});
										return new Column(
											children: children
										);
									}	
								)
							]
						)
					)
				)
			)
		);
	}
}
