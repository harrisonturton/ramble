import 'package:newsfeed_2/model/model.dart';
import 'dart:math';

var _firstNames = const [
	"Harry",
	"Tess",
	"Tim",
	"Rishi",
	"Albie",
	"Howard",
	"Michael",
	"Jacob",
	"Morgan",
	"Jonathan",
	"Yiechang",
	"Eliza",
	"Ian",
	"Lesley",
	"Sarah",
	"Zoe",
	"Cruz",
	"Nelson",
	"Jim",
	"Illa",
	"Yasmin",
	"Dorian",
];

var _lastNames = const [
	"Turton",
	"Morrison",
	"Lin",
	"Leong",
	"Omglol",
	"Maxfield",
	"Skates",
	"Alcott",
	"Smith",
	"Presson",
	"Arms",
	"Cole",
	"Real",
	"Limon",
	"Johnson",
	"Miller",
	"Jones",
	"Thompson",
	"Lewis",
	"Walker",
	"Campbell"
];

final int _ageLowerBound = 14;
final int _ageUpperBound = 94;

var _genders = const [
	"Male",
	"Female",
	"Intersex",
	"Trans",
	"Cis",
	"Non-Binary",
	"Genderfluid"
];

var _emails = const [
	"carreras@live.com",
	"amaranth@sbcglobal.net",
	"moonlapse@aol.com",
	"kingma@yahoo.ca",
	"esasaki@icloud.com",
	"baveja@msn.com",
	"rtanter@aol.com",
	"eimear@icloud.com",
	"sassen@verizon.net",
	"uncled@mac.com",
	"pkilab@me.com",
	"jfinke@msn.com",
];

var _profilePictures = const [
	"profile_harry.jpg",
	"profile_tess.jpg",
	"profile_robert.jpg",
	"profile_tim.jpg",
	"profile_albie.jpg",
	"profile_cat.jpg",
	"profile_jo.jpg",
	"profile_corey.jpg",
];

class MockPerson implements Person {
	String firstName;
	String lastName;
	String fullName;
	int age;
	String gender;
	String email;
	String profilePicture;

	final String _imagePathPrefix = "assets/mock/profile_pictures/";

	MockPerson() {
		getNewPerson();
	}

	void getNewPerson() {
		Random rand = new Random();
		firstName = _firstNames[rand.nextInt(_firstNames.length)];
		lastName = _lastNames[rand.nextInt(_lastNames.length)];
		fullName = firstName + " " + lastName;
		age = _getRandomAge(_ageLowerBound, _ageUpperBound);
		gender = _genders[rand.nextInt(_genders.length)];
		email = _emails[rand.nextInt(_emails.length)];
		profilePicture = _profilePictures[rand.nextInt(_profilePictures.length)];
		profilePicture = _imagePathPrefix + profilePicture;
	}

	int _getRandomAge(int lowerBound, int upperBound) {
		Random rand = new Random();
		var randAge = rand.nextInt(upperBound);
		while (randAge < lowerBound) {
			randAge = rand.nextInt(upperBound);
		}
		return randAge;
	}
}
