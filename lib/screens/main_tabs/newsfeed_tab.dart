import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:newsfeed_2/widgets/widgets.dart';
import 'package:newsfeed_2/actions/actions.dart';
import 'package:newsfeed_2/style/style.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/model/app_state.dart';
import 'package:newsfeed_2/mock/mock.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsfeedTab extends StatelessWidget {

	Widget newPost() => new PostCardHero(post: new MockPost());

	void fetchPosts(Store<AppState> store) {
		store.dispatch(fetchPostsRequest());
	}

	@override
	Widget build(BuildContext context) {
		return new StoreConnector<AppState, Store<AppState>>(
			converter: (store) => store,
			onInit: fetchPosts,
			builder: (context, store) {
				return new StoreConnector<AppState, List<Model.Post>>(
					converter: (store) => store.state.posts,
					builder: (context, posts) {
						List<Widget> children = new List<Widget>();
						List<Widget> postWidgets = posts.map((p) => new PostCardHero(post: p)).toList();
						children.add(new NewPostCard());
						children.addAll(postWidgets);

						return new ListView(
							padding: const EdgeInsets.all(0.0),
							children: children
						);
					}
				);
			}
		);
	}
}
