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

void LoginMiddleware(Store<AppState> store, dynamic action, NextDispatcher next) async {
	if (action is! Login) {
		next(action);
		return;
	}

	String username = await Firebase.getUsername(action.user);
	next(new Login(
		user: action.user,
		username: username
	));
}
