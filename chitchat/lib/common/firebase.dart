import "dart:async";
import "package:chitchat/state/state.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_database/firebase_database.dart";

final FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseDatabase _db = FirebaseDatabase.instance;

final CHAT_ID_TO_MESSAGES = "chatroom_id_to_messages";

// Login as existing user
Future<FirebaseUser> login({ String email, String password }) {
	return _auth.signInWithEmailAndPassword(
		email: email,
		password: password
	);
}

Stream<List<Message>> streamMessages(String chatroomId) {
	final String path = "${CHAT_ID_TO_MESSAGES}/${chatroomId}/messages";
	return Firestore.instance.collection(path)
		.orderBy("timestamp")
		.snapshots.map((QuerySnapshot query) {
			return query.documents.map((DocumentSnapshot snapshot) {
				return new Message(
					author: snapshot.data["author"],
					content: snapshot.data["content"]
				);
			}).toList();
	});
}

Stream<List<Chatroom>> streamChatrooms(String uid) {
	final String path = "uid_to_chatrooms/${uid}/chatrooms";
	return Firestore.instance.collection(path)
		.orderBy("timestamp")
		.snapshots.map((QuerySnapshot query) {
			return query.documents.map((DocumentSnapshot snapshot) {
				return new Chatroom(
					id: snapshot.documentID,
					title: snapshot.data["title"],
					recentMessage: snapshot.data["recent_message"],
					timestamp: snapshot.data["timestamp"].hour.toString(),
				);
			}).toList();
		});
}

Future<DocumentReference> sendMessage(User author, String chatroomId, String message) {
	return Firestore.instance.collection("chatroom_id_to_messages/${chatroomId}/messages").add({
		"author": author.firebaseUser.uid,
		"content": message,
		"timestamp": DateTime.now().toUtc()
	});
}

Future<DocumentReference> sendMessageDev({
	String name,
	String chatroomId,
	String content
}) {
	return Firestore.instance.collection("chatroom_id_to_messages/${chatroomId}/messages").add({
		"author": name,
		"content": content,
		"timestamp": DateTime.now().toUtc()
	});
}

Future<List<UserData>> getSimilarUsers(String username) {
	String searchInput = username.toLowerCase();
	return Firestore.instance.collection("username_to_user_data")
		.getDocuments().then((QuerySnapshot query) => query.documents)
		.then((List<DocumentSnapshot> snapshots) {
			return snapshots
				.where((DocumentSnapshot snapshot) => snapshot.data["username"].startsWith(searchInput))
				.map((DocumentSnapshot snapshot) => new UserData(
					username: snapshot.data["username"],
					firstName: snapshot.data["first_name"],
					lastName: snapshot.data["last_name"],
				)).toList();
		});
}

Future<List<UserData>> getFriends(String uid) {
	return Firestore.instance.document("uid_to_friends/$uid").get().then((DocumentSnapshot doc) {
		List<UserData> result = new List();
		doc.data["friends"].forEach((String friendUid) {
			Firestore.instance.document("uid_to_user_data/$friendUid").get().then((DocumentSnapshot doc) {

			});
		});
	});
}
