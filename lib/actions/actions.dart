import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:redux/redux.dart';
import 'package:newsfeed_2/model/app_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePostSuccess {
	final Model.Post post;

	CreatePostSuccess(this.post);
}

class FetchPostsSuccess {
	final List<Model.Post> posts;

	FetchPostsSuccess(this.posts);
}

final createPostRequest = (Model.Post post) {
	return (Store<AppState> store) {
		final CollectionReference postCollection = Firestore.instance.collection("posts");
		postCollection.document().setData({
			"author": "users/" + post.author.id,
			"content": post.content,
			"location": "ANU",
			"timestamp": new DateTime.now().millisecondsSinceEpoch
		});
	};
};

final fetchPostsRequest = () {
	return (Store<AppState> store) {
		final CollectionReference postCollection = Firestore.instance.collection("posts");
		postCollection.getDocuments().then((QuerySnapshot snapshot) {
			return snapshot.documents.map((snap) => new Model.Post.fromSnapshot(snap)).toList();
		}).then((posts) {
			store.dispatch(new FetchPostsSuccess(posts));
		});
	};
};

/*
called like: store.dispatch(login(context, username, password));
final login = (BuildContext context, String username, String password) {
	return (Store<AppState> store) {
		store.dispatch(new LoginRequest());
		if (username == "harry" && password == "turton") {
			store.dispatch(new LoginSuccess());
		} else {
			store.dispatch(new LoginFailure());
		}
	}
}*/
/*
final FetchPostsRequest = (Store<AppState> Store) async {
	final CollectionReference postCollection = Firestore.instance.collection("posts");
	await postCollection.getDocuments().then((QuerySnapshot snapshot) {
		List<DocumentSnapshot> snaps = snapshot.documents;
		print("Getting documents....");
		List<Model.Post> posts = snaps.map((s) => new Model.Post.fromSnapshot(s)).toList();
		return posts;
	}).then((posts) {
		store.dispatch(new FetchPostsSuccess(posts: posts));
	});
}

final FetchPostsRequest = () {
	return (Store<AppState> store) async {
		final CollectionReference postCollection = Firestore.instance.collection("posts");
		postCollection.getDocuments().then((QuerySnapshot snapshot) {
			List<DocumentSnapshot> snaps = snapshot.documents;
			print("Getting documents....");
			List<Model.Post> posts = snaps.map((s) => new Model.Post.fromSnapshot(s)).toList();
			store.dispatch(new FetchPostsSuccess(posts: posts));
		});
	};
};

final CreatePostRequest = (Model.Post post) {
	return (Store<AppState> store) async {
		final CollectionReference postCollection = Firestore.instance.collection("posts");
		postCollection.document().setData(post.toMap()).then(() => {
			store.dispatch(new CreatePostSuccess(post: post));
		});
	};
};*/
