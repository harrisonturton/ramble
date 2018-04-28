import "dart:async";
import "package:firebase_auth/firebase_auth.dart";

final FirebaseAuth _auth = FirebaseAuth.instance;

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
