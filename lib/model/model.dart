
class Person {
	Person({
		this.firstName,
		this.lastName,
		this.fullName,
		this.profilePicture,
	});
	String firstName;
	String lastName;
	String fullName;
	String profilePicture;

	factory Person.fromMap(Map<String, dynamic> data) {
		return new Person(
			firstName: data["first_name"],
			lastName: data["last_name"],
			fullName: data["first_name"] + " " + data["last_name"],
			profilePicture: data["profile_picture"]
		);
	}

	Map toMap() => {
		"first_name": this.firstName,
		"last_name": this.lastName,
		"profile_picture": this.profilePicture
	};
}

class Post {
	Person author;
	String timestamp;
	String content;
	String location;
	List<Person> isLikedBy;
	List<Comment> comments;
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

