import "package:firebase_auth/firebase_auth.dart";

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

class Message {
	Message({
		this.author,
		this.content
	});
	final String author;
	final String content;
}

class User {
	User({
		this.firebaseUser,
		this.username,
		this.userData=null,
		this.hasLoadedUserData=false
	});
	final FirebaseUser firebaseUser;
	final String username;
	final UserData userData;
	final bool hasLoadedUserData;

	User copyWith({
		FirebaseUser firebaseUser,
		String username,
		final UserData userData,
		final bool hasLoadedUserData
	}) => new User(
		firebaseUser: firebaseUser ?? this.firebaseUser,
		username: username ?? this.username,
		userData: userData ?? this.userData,
		hasLoadedUserData: hasLoadedUserData ?? this.hasLoadedUserData
	);
}

class UserData {
	UserData({
		this.firstName,
		this.lastName,
		this.username,
	});
	final String firstName;
	final String lastName;
	final String username;
}
