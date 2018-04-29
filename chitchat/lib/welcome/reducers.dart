import "package:redux/redux.dart";
import "package:chitchat/state/state.dart";
import "actions.dart";

List<Reducer<AppState>> reducers = [
	new TypedReducer<AppState, Login>(login),
	new TypedReducer<AppState, AddChatroom>(addChatroom),
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

AppState addChatroom(AppState prevState, AddChatroom action) {
	print("ADD CHATROOM REDUCER");
	List<ChatRoom> newRooms = List.from(prevState.chatrooms);
	newRooms.add(action.chatroom);
	return prevState.copyWith(
		chatrooms: List.unmodifiable(newRooms)
	);
}
