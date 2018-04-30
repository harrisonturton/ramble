import "dart:async";
import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_database/firebase_database.dart";

final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseDatabase _db = FirebaseDatabase.instance;

// Login as existing user
Future<FirebaseUser> login({ String email, String password }) {
	return _auth.signInWithEmailAndPassword(
		email: email,
		password: password
	);
}

// Create a new user
Future<FirebaseUser> register({ String email, String password }) {
	return _auth.createUserWithEmailAndPassword(
		email: email,
		password: password
	);
}

void connectPresence(FirebaseUser user) async {
	DatabaseReference statusRef = _db.reference().child("status/$user.uid");
	Map onlineStatus = {
		"status": "online",
		"last_changed": ServerValue.timestamp
	};
	Map offlineStatus = {
		"status": "offline",
		"last_changed": ServerValue.timestamp
	};
	_db.reference().child(".info/connected").onValue.listen((Event event) {
		// If not connected, don't do anything
		if (event.snapshot.value == null) {
			return;	
		}
		print("CONNECTION EVENT...");
		print(event.snapshot.value);
	});
}
