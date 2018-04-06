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
	"#ANUCrush13040\nBoys who play piano so elegantly 😉",
	"(Creepy ex-ressie post) Anyone up for a run at like 4:30ish? I was thinking something not too strenuous, like powerlines.",
	"That moment when something slimy touches your leg in the water – times a million!\nCarp make up 80% of the total weight of fish in Australian waterways. This is no fish tail! To find out more about what is being done to tackle the issue, visit www.carp.gov.au #clearerwaters",
	"#ANUCrush13349\nwww.brodyhannan.com your website makes me want to pass out on the burgmann front lawn with you",
	"#ANUCrush13370\nKate Bailey from Bruce,\nPlease be my tractor wife",
	"and if you ain't a hoOOOoooOOoooOOOOooOo, get up out my trap houUUUoOOooouuUUooUUuuuOuse",
	"What are ANU students' opinions of the Melbourne Model? If you have strong opinions either for or against it, why? Asking because I teach IELTS and it is a really hot topic among my students.",
	"MMC 55TH STREET RESIDENTS: I WILL CLEAN YOUR DORM! \$20 for kitchen or bathroom, \$35 for both. I will vacuum too. Please PM me and/or share this! Thank you!",
	"Overheard #508\nA: \"So in bed would you prefer your English name or your Chinese name?\"\nB: \"I prefer Master.",
	"Our 2019 IBM Graduate Roles are Now Open!\nWe are so excited to share with you that the 2019 Graduate roles are now open on our career portal\nView details 134268BR - 2019 IBM Graduate Consulting Positions-Technical and Business–Canberra\nhttps:\/\/goo.gl\/Pj1ak5\nWe are offering two intakes - Jan\/Feb and July; and have both technical and business roles available.\nPlease ensure that you upload a version of your academic transcripts+passport OR birth certificate+Driver licence.",
	"A dangerous hobby known as tinny bashing has been taking off in waterways across the state. Police aren’t impressed, condemning the dangerous stunt.",
	"For sale\nholes \$10 ea.\n*please note you must dig them up yourself* Fair condition.\nSerious buyers only.\nPrice is firm. No low ballers thanks!\nRelisted due to a no show.\n*please delete admin if not allowed*",
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
	List<Person> likedBy;
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
		likedBy = [];
		for (int i = 0; i < rand.nextInt(17); i++) {
			likedBy.add(new MockPerson());
		}
		comments = [];
	}

	Person getMockPerson() {
		return new MockPerson();
	}
}
