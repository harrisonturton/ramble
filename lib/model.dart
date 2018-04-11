import 'package:newsfeed_2/mock/mock.dart';

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

	factory Person.fromMap(Map<String, dynamic> data) {
		return new Person(
			firstName: data["first_name"],
			lastName: data["last_name"],
			fullName: data["first_name"] + " " + data["last_name"],
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
	List<Commment> comments;

	factory Post.fromMap(Map<String, dynamic> data) {
		return new Post(
			author: new MockPerson(),
			timestamp: data["timestamp"].toString(),
			content: data["content"],
			location: data["location"],
			isLikedBy: new List<Person>(),
			comments: new List<Comment>()
		);
	}

	Map toMap() => {
		"author": "users/" + author.id,
		"timestamp": timestamp,
		"content": content,
		"location": location,
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

