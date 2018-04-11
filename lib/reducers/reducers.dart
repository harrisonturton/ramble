import 'package:redux/redux.dart';
import 'package:newsfeed_2/actions/actions.dart';
import 'package:newsfeed_2/model/app_state.dart';

Reducer<AppState> appReducer = combineReducers([
	//new TypedReducer<AppState, FetchPostsRequest>(fetchPostsSuccess)
	//new TypedReducer<AppState, AddFriend>(addFriendReducer),
	new TypedReducer<AppState, FetchPostsSuccess>(fetchPostsSuccess),
	new TypedReducer<AppState, CreatePostSuccess>(createPostSuccess),
]);

AppState createPostSuccess(AppState prevState, CreatePostSuccess action) {
	return prevState.copyWith(
		posts: _addImmutable(prevState.posts, action.post)
	);
}

AppState fetchPostsSuccess(AppState prevState, FetchPostsSuccess action) {
	return prevState.copyWith(
		posts: _addAllImmutable(prevState.posts, action.posts)
	);
}

/*
// Add a new friend to the state
AppState addFriendReducer(AppState prevState, AddFriend action) {
	return prevState.copyWith(
		friends: _addImmutable(prevState.friends, action.friend)
	);
}

// Remove a friend from the state
AppState removeFriendReducer(AppState prevState, RemoveFriend action) {
	return prevState.copyWith(
		friends: _removeImmutable(prevState.friends, action.friend)
	);
}*/

List<T> _addImmutable<T>(List<T> list, T newItem) {
	return new List<T>()..addAll(list)..add(newItem);
}

List<T> _addAllImmutable<T>(List<T> list, List<T> newItems) {
	List<T> result = new List<T>();
	result.addAll(list);
	result.addAll(newItems);
	return result;
}

List<T> _removeImmutable<T>(List<T> list, T removeItem) {
	if (list.length == 0) {
		return new List<T>();
	}
	var result = new List<T>();
	list.forEach((T item) {
		if (item != removeItem) {
			result.add(item);
		}
	});
	return result;
}
