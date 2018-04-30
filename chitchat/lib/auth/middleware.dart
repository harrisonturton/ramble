import "dart:async";
import "package:redux/redux.dart";
import "package:chitchat/state/state.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "actions.dart";

void LoginMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) async {
	if (action is! Login) {
		next(action);
		return;
	}

	print("Inside login middleware");
	String username =
		await Firestore.instance.collection("uid_to_username")
		.document(action.user.uid).get()
		.then((DocumentSnapshot snapshot) => snapshot.data["username"]);
	next(new Login(
		user: action.user,
		username: username
	));

	Firestore.instance.collection("uid_to_chats").document(action.user.uid).snapshots.listen((DocumentSnapshot snapshot) {
		print("Snapshot: ${snapshot.data}");
		Map<String, ChatRoom> newChatrooms = new Map();
		snapshot.data.keys.forEach((key) {
			Map rawData = snapshot.data[key];
			newChatrooms.putIfAbsent(key, () => new ChatRoom(
				title: rawData["title"],
				recentMessage: rawData["recent_message"],
				timestamp: rawData["timestamp"],
			));
		});
		store.dispatch(new ReplaceChatrooms(chatrooms: newChatrooms));
	});

	/*
	// Gets all documents ONCE, need to somehow stream updates? Possibly poll, maybe put this on the user?
	Firestore.instance.collection("uid_to_chats").document(action.user.uid).get().then((DocumentSnapshot snapshot) {
		print(snapshot.data);
		snapshot.data.keys.forEach((key) {
			Map rawData = snapshot.data[key];
			store.dispatch(new AddChatroom(
				key: key,
				chatroom: new ChatRoom(
					title: rawData["title"],
					recentMessage: rawData["recent_message"],
					timestamp: rawData["timestamp"],
				)
			));
		});
	});*/
}
