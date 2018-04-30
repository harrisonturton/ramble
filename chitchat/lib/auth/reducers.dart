import "package:redux/redux.dart";
import "package:chitchat/state/state.dart";
import "actions.dart";

List<Reducer<AppState>> reducers = [
	new TypedReducer<AppState, Login>(login),
	new TypedReducer<AppState, ReplaceChatrooms>(replaceChatrooms),
];

AppState login(AppState prevState, Login action) {
	print("LOGIN REDUCER");
	return prevState.copyWith(
		isLoggedIn: true,
		user: new User(
			firebaseUser: action.user,
			username: action.username
		)
	);
}

AppState replaceChatrooms(AppState prevState, ReplaceChatrooms action) {
	return prevState.copyWith(
		chatrooms: Map.unmodifiable(action.chatrooms)
	);
}
