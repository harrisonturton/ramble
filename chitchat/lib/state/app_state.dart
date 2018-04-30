import "package:firebase_auth/firebase_auth.dart";

class AppState {
	AppState({
		this.chatrooms,
		this.user,
		this.isLoggedIn,
	});
	final Map<String, Chatroom> chatrooms;
	final bool isLoggedIn;
	final User user;

	factory AppState.initial() => new AppState(
		chatrooms: Map.unmodifiable({}),
		user: null,
		isLoggedIn: false
	);

	AppState copyWith({
		Map<String, Chatroom> chatrooms,
		bool isLoggedIn,
		User user,
	}) => new AppState(
		chatrooms: chatrooms ?? this.chatrooms,
		user: user ?? this.user,
		isLoggedIn: isLoggedIn ?? this.isLoggedIn
	);
}

class Chatroom {
	Chatroom({
		this.id,
		this.title,
		this.recentMessage,
		this.timestamp
	});
	final String id;
	final String title;
	final String recentMessage;
	final String timestamp;
}

class User {
	User({
		this.firebaseUser,
		this.username
	});
	final FirebaseUser firebaseUser;
	final String username;

	User copyWith({
		FirebaseUser firebaseUser,
		String username
	}) => new User(
		firebaseUser: firebaseUser ?? this.firebaseUser,
		username: username ?? this.username
	);
}
