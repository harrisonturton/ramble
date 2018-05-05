import "package:flutter/material.dart";
import "package:chitchat/state/state.dart";
import "package:chitchat/common/common.dart";
import "package:chitchat/common/firebase.dart" as Firebase;
import "package:chitchat/common/style.dart" as Style;
import "friend_list_item.dart";

class NewFriendScreen extends StatefulWidget<_NewFriendScreenState> {

	@override
	_NewFriendScreenState createState() => new _NewFriendScreenState();
}

class _NewFriendScreenState extends State<NewFriendScreen> {

	bool isLoaded = false;
	List<UserData> searchResults = new List();

	TextEditingController _controller = new TextEditingController();

	@override
	void initState() {
		super.initState();
		_controller.addListener(() {
			if (_controller.text == "") {
				isLoaded = true;
				searchResults = new List();
				return;
			}
			setState(() => this.isLoaded = false);
			_fetchResults();
		});
	}

	void _fetchResults() {
		Firebase.getSimilarUsers(_controller.text).then((List<UserData> data) {
			setState(() {
				this.isLoaded = true;
				this.searchResults = data;
			});
		});
	}

	Widget _buildResultList() => new ListView(
		children: searchResults.map((UserData data) => new FriendListItem(
			name: "${data.firstName} ${data.lastName}",
			username: data.username
		)).toList()
	);

	Widget _buildLoadingScreen() => new Center(
		child: new CircularProgressIndicator(
			value: null,
			valueColor: new AlwaysStoppedAnimation<Color>(Style.primary),
			strokeWidth: 2.5
		)
	);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			backgroundColor: Colors.white,
			appBar: new AppBar(
				elevation: 1.0,
				backgroundColor: Colors.white,
				title: new TextField(
					controller: _controller,
					autofocus: true,
					decoration: new InputDecoration(
						border: InputBorder.none,
					)
				)
			),
			body: this.isLoaded ? _buildResultList() : _buildLoadingScreen()
		);
	}
}
