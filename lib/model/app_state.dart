import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/mock/mock.dart';
import 'package:redux/redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_redux/';
import 'dart:async';

class AppState {
	AppState({
		this.user,
		this.posts,
		this.friends,
		this.chats,
	});
	FirebaseUser user;
	List<Model.Post> posts;
	List<Model.Person> friends;
	List<Model.Chat> chats;

	factory AppState.initial() {
		return new AppState(
			user: null,
			posts: List.unmodifiable([]),
			friends: List.unmodifiable([]),
			chats: List.unmodifiable([])
		);
	}

	String display() {
		return "posts: ${posts}\nfriends: ${friends}\nchats: ${chats}";
	}

	AppState copyWith({
		FirebaseUser user,
		List<Model.Post> posts,
		List<Model.Person> friends,
		List<Model.Chat> chats
	}) {
		return new AppState(
			user: user ?? this.user,
			posts: posts ?? this.posts,
			friends: friends ?? this.friends,
			chats: chats ?? this.chats
		);
	}
}
