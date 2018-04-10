import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();

Future<String> _testSignInWithGoogle() async {
	GoogleSignInAccount googleUser = await googleSignIn.signIn();
	GoogleSignInAuthentication googleAuth = await googleUser.authentication;
	FirebaseUser user = await auth.signInWithGoogle(
		accessToken: googleAuth.accessToken,
		idToken: googleAuth.idToken,
	);
	assert(user.email != null);
	assert(user.displayName != null);
	print("This user is signed in ${user}");
	return "signInWithGoogle succeeded: ${user}";
}

void setData() {
	Firestore.instance.collection("users").document().setData({
		"first_name": "Harry",
		"last_name": "Turton",
		"email": "harrisonturton@gmail.com"
	});
}

