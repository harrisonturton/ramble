import "model.dart";

class AppState {
	AppState({
		this.chatrooms,
		this.user,
		this.isLoggedIn,
	});
	final Map<String, Chatroom> chatrooms;
	final bool isLoggedIn;
	final User user;

	factory AppState.initial() => new AppState(
		chatrooms: Map.unmodifiable({}),
		user: null,
		isLoggedIn: false
	);

	AppState copyWith({
		Map<String, Chatroom> chatrooms,
		bool isLoggedIn,
		User user,
	}) => new AppState(
		chatrooms: chatrooms ?? this.chatrooms,
		user: user ?? this.user,
		isLoggedIn: isLoggedIn ?? this.isLoggedIn
	);
}
