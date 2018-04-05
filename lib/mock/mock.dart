import 'dart:math';

final Map _postData = {
	0: {
		"firstName": "Harrison",
		"familyName": "Turton",
		"age": 19,
		"email": "harrisonturton@gmail.com",
		"gender": "male",
		"image": "profile_harry.jpg",
	},
	1: {
		"firstName": "Tess",
		"familyName": "Morrison",
		"age": 18,
		"email": "tessmorrison@gmail.com",
		"gender": "female",
		"image": "profile_tess.jpg",
	},
	2: {
		"firstName": "Timothy",
		"familyName": "Leong",
		"age": 19,
		"email": "timolongo@hotmail.com",
		"gender": "male",
		"image": "profile_tim.jpg",
	},
	3: {
		"firstName": "Robert",
		"familyName": "Petrie",
		"age": 20,
		"email": "xXk1llerSniperXx@hotmail.com",
		"gender": "male",
		"image": "profile_robert.jpg",
	},
};

class MockProfile {
	String fullName;
	String firstName;
	String familyName;
	int age;
	String gender;
	String email;
	String image;

	final String _imagePathPrefix = "assets/mock/profile_pictures/";
	
	MockProfile() {
		getNewProfile();
	}

	void getNewProfile() {
		Random rand = new Random();
		Map randProfile = _postData[rand.nextInt(_postData.keys.length)];
		this.firstName = randProfile["firstName"];
		this.familyName = randProfile["familyName"];
		this.fullName = this.firstName + " " + this.familyName;
		this.age = randProfile["age"];
		this.gender = randProfile["gender"];
		this.email = randProfile["email"];
		this.image = _imagePathPrefix + randProfile["image"];
	}
}
