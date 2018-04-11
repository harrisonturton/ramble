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
import 'package:cloud_firestore/cloud_firestore.dart';


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

	void getUsers(Store<AppState> store) {

	}

	void getPosts(Store<AppState> store) {
		final CollectionReference postCollection = Firestore.instance.collection("posts");
		postCollection.getDocuments().then((QuerySnapshot snapshot) {
			List<DocumentSnapshot> docs = snapshot.documents;
			print("Getting documents....");
			List<Model.Post> posts = docs.map((d) => Model.Post.fromMap(d.data)).toList();
			store.dispatch(new FetchPostsSuccess(posts: posts));
		}).catchError((err) {
			print(err);
			store.dispatch(new FetchPostsFailure(error: err));
		});
	}

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
									onPressed: () => getUsers(store),
									child: const Text("Get Users")
								),
								new FlatButton(
									onPressed: () => getPosts(store),
									child: const Text("Get Posts")
								),
								new FlatButton(
									onPressed: () => store.dispatch(
										FetchPostsRequest()
									),
									child: const Text("Test thunk")
								),
								new FlatButton(
									onPressed: () => print(store.state.display()),
									child: const Text("Print store")
								),
								new StoreBuilder<AppState>(
									builder: (context, store) {
										List<Widget> children = new List<Widget>();
										store.state.posts.forEach((Model.Post post) {
											children.add(new Text("${post.content}"));
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
