import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/mock/mock.dart';
import 'package:redux/redux.dart';
//import 'package:flutter_redux/';

class AppState {
	AppState({
		this.posts,
		this.friends,
		this.chats
	});
	List<Model.Post> posts;
	List<Model.Person> friends;
	List<Model.Chat> chats;

	factory AppState.initial() {
		return new AppState(
			posts: List.unmodifiable([]),
			friends: List.unmodifiable([]),
			chats: List.unmodifiable([])
		);
	}

	String display() {
		return "posts: ${posts}\nfriends: ${friends}\nchats: ${chats}";
	}

	AppState copyWith({
		List<Model.Post> posts,
		List<Model.Person> friends,
		List<Model.Chat> chats
	}) {
		return new AppState(
			posts: posts ?? this.posts,
			friends: friends ?? this.friends,
			chats: chats ?? this.chats
		);
	}
}
