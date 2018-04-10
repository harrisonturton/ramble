import 'package:redux/redux.dart';
import 'package:newsfeed_2/actions/actions.dart';
import 'package:newsfeed_2/model/app_state.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newsfeed_2/model/model.dart' as Model;

List<Middleware<AppState>> createMiddleware() {
	return [
		loggingMiddleware,
		getAllUsers,
	];
}

// Docs: https://pub.dartlang.org/documentation/cloud_firestore/0.5.0/cloud_firestore/QuerySnapshot-class.html
void getAllUsers(Store<AppState> store, action, NextDispatcher next) {
	print("Getting users from Firestore...");
	final CollectionReference userCollection = Firestore.instance.collection("users");
	userCollection.getDocuments().then((QuerySnapshot snap) {
		List<DocumentSnapshot> docs = snap.documents;
		List<Model.Person> users = new List<Model.Person>();
		docs.forEach((DocumentSnapshot doc) {
			users.add(new Model.Person.fromMap(doc.data));
		});
		users.forEach((Model.Person person) {
			print("${person.fullName}");
		});
	});

	next(action);
}

/*
Future addUser(Store<AppState> store, action, NextDispatcher next) async {
	print("Adding new user to database...");
	final CollectionReference userCollection = Firestore.instance.collection("users");
	await userCollection.document().setData(action.person.toMap()).then(() {
		print("User successfully added");
	}).catchError((err) {
		print(err);	
	});
}*/

void loggingMiddleware(Store<AppState> store, action, NextDispatcher next) {
	print("Dispatching ${action.type}");
	print("Old state =================\n" + store.state.display());
	next(action);
	print("New state =================\n" + store.state.display());
}
