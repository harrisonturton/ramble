import 'package:newsfeed_2/model/model.dart';
import 'dart:math';
import 'MockPerson.dart';

var _timestamps = const [
	"Just now",
	"1 minutes ago",
	"3 minutes ago",
	"10 minutes ago",
	"An hour ago",
	"2 hours ago",
	"3 hours ago",
	"8 hours ago",
	"Yesterday",
	"Last Wednesday",
	"3/4/17",
	"29/12/16",
];

var _content = const [
	"Anyone up for a run at like 4:30ish? I was thinking something not too strenuous, like powerlines.",
	"That moment when something slimy touches your leg in the water – times a million! Carp are the worst!",
	"What are ANU students' opinions of the Melbourne Model? If you have strong opinions either for or against it, why?",
	"It's so sunny! Who wants to go to the beach?\nI'm gonna drive over at 3pm, hmu if you wanna come 🌞",
	"MMC 55TH STREET RESIDENTS: I WILL CLEAN YOUR DORM! \$20 for kitchen or bathroom, \$35 for both. I will vacuum too. Please PM me and/or share this! Thank you!",
	"A dangerous hobby known as tinny bashing has been taking off in waterways across the state. Police aren’t impressed, condemning the dangerous stunt.",
	"For sale\nholes \$10 ea.\n*please note you must dig them up yourself* Fair condition.\nSerious buyers only.\nPrice is firm. No low ballers thanks!\nRelisted due to a no show.\n*please delete admin if not allowed*",
	"Had the best day today! Can't wait to go to MovieWorld again",
	"lmao haha m e m e s",
];

var _locations = const [
	"ANU",
	"Canberra",
	"Arboretum",
	"Brisbane",
	"Sydney",
	"McDonals",
	"KFC",
	"Minneapolis"
];


class MockPost implements Post {
	Person author;
	String timestamp;
	String content;
	String location;
	List<Person> isLikedBy;
	List<Comment> comments;

	MockPost() {
		getPost();
	}

	void getPost() {
		Random rand = new Random();
		author = new MockPerson();
		timestamp = _timestamps[rand.nextInt(_timestamps.length)];
		content = _content[rand.nextInt(_content.length)];
		location = _locations[rand.nextInt(_locations.length)];
		isLikedBy = [];
		for (int i = 0; i < rand.nextInt(143); i++) {
			isLikedBy.add(new MockPerson());
		}
		comments = [];
	}

	Person getMockPerson() {
		return new MockPerson();
	}
}
