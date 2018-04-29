import "package:redux/redux.dart";
import "package:chitchat/state/state.dart";
import "actions.dart";

List<Reducer<AppState>> reducers = [
	new TypedReducer<AppState, Login>(login)
];

AppState login(AppState prevState, Login action) {
	print("LOGIN REDUCER");
	return prevState.copyWith(
		isLoggedIn: true,
		user: prevState.user.copyWith(
			firebaseUser: action.user,
			username: action.username
		)
	);
}
