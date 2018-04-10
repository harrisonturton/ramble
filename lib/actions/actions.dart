import 'package:newsfeed_2/model/model.dart' as Model;

enum Actions {
	AddFriend,
	RemoveFriend,
	CreatePost,
	DeletePost,
	CreateChat,
	DeleteChat,
	CreateMessage,
	DeleteMessage,
	DeleteAll
}

abstract class Action {
	final Actions type;
}

class AddFriend extends Action {
	AddFriend({this.friend});
	final Actions type = Actions.AddFriend;
	final Model.Person friend;
}

class RemoveFriend extends Action {
	RemoveFriend({this.friend});
	final Actions type = Actions.RemoveFriend;
	final Model.Person friend;
}

class CreatePost extends Action {
	CreatePost({
		this.post
	});
	final Model.Post post;
}

class DeletePost extends Action {
	DeletePost({this.post});
	final Actions type = Actions.DeletePost;
	final Model.Post post;
}
