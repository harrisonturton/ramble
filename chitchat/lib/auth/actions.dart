import "dart:async";
import "package:redux/redux.dart";
import "package:chitchat/state/state.dart";
import "package:chitchat/common/firebase.dart" as Firebase;
import "package:firebase_auth/firebase_auth.dart";

class Login {
	Login({
		this.user,
		this.username=null,
	});
	final FirebaseUser user;
	final String username;
}

class ReplaceChatrooms {
	ReplaceChatrooms({this.chatrooms});
	final Map<String, Chatroom> chatrooms;
}
