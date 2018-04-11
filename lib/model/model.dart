import 'package:newsfeed_2/mock/mock.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DatabaseObject {
	String id;
}

class Person extends DatabaseObject {
	Person({
		this.id,
		this.firstName,
		this.lastName,
		this.fullName,
		this.profilePicture
	});
	String id;
	String firstName;
	String lastName;
	String fullName;
	String profilePicture;

	factory Person.fromSnapshot(DocumentSnapshot snapshot) {
		return new Person(
			id: snapshot.documentID,
			firstName: snapshot.data["first_name"],
			lastName: snapshot.data["last_name"],
			fullName: snapshot.data["first_name"] + " " + data["last_name"],
			profilePicture: "assets/mock/profile_pictures/profile_harry.jpg"
		);
	}

	Map toMap() => {
		"first_name": this.firstName,
		"last_name": this.lastName,
	};
}

class Post extends DatabaseObject {
	Post({
		this.id,
		this.author,
		this.timestamp,
		this.content,
		this.isLikedBy,
		this.comments
	});
	String id;
	Person author;
	String timestamp;
	String content;
	List<Person> isLikedBy;
	List<Comment> comments;

	factory Post.fromSnapshot(DocumentSnapshot snapshot) {
		return new Post(
			id: snapshot.documentID,
			author: new MockPerson(),
			timestamp: snapshot.data["timestamp"].toString(),
			content: snapshot.data["content"],
			isLikedBy: new List<Person>(),
			comments: new List<Comment>()
		);
	}

	Map toMap() => {
		"author": "users/" + author.id,
		"timestamp": timestamp,
		"content": content,
	};
}

class Comment {
	Person author;
	Post parentPost;
	String content;
}


class Chat {
	List<Person> members;
	List<Person> admins;
	List<Message> messages;
}

class Message {
	Person author;
	Chat parentChat;
	String content;
}

