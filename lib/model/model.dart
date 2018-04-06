
class Person {
	String firstName;
	String lastName;
	String fullName;
	int age;
	String gender;
	String email;
	String profilePicture;
}

class Comment {
	Person author;
	Post parentPost;
	String content;
}

class Post {
	Person author;
	String timestamp;
	String content;
	String location;
	List<Person> likedBy;
	List<Comment> comments;
}
