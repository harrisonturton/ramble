import "dart:math";
import "dart:ui";
import "package:chitchat/common/style.dart" as Style;
import "package:flutter/material.dart";
import "package:chitchat/common/common.dart";
import "package:chitchat/common/firebase.dart" as Firebase;
import "package:chitchat/chat/chat.dart";
import "package:chitchat/state/state.dart";

import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";


class ChatScreen extends StatefulWidget<_ChatScreenState> {
	ChatScreen(this.firebaseUser);
	final FirebaseUser firebaseUser;

	@override
	_ChatScreenState createState() => new _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
	
	List<Chatroom> chatrooms = new List();
	List<UserData> searchResults = new List();
	bool isLoaded = false;
	bool isSearch = false;
	bool isSearchLoaded = false;

	@override
	void initState() => _beginStreamChatrooms();

	// Stream (listen to) chatrooms from database.
	// Replace "chatrooms" every time the database changes.
	void _beginStreamChatrooms() {
		String userUid = widget.firebaseUser.uid;
		Firebase.streamChatrooms(userUid).listen((List<Chatroom> rooms) {
			setState(() {
				this.isLoaded = true;
				this.chatrooms = rooms;
			});
		});
	}

	void _openSearchScreen(BuildContext context) {
		Navigator.of(context).push(new MaterialPageRoute(
			builder: (context) => new CustomScrollView(
				slivers: [
					_buildAppbar(title: "Search"),
				]
			)
		));
	}

	// Go into "search state", where the messages
	// list is replaces by the search results.
	void _toggleSearch() {
		this.isSearch = !this.isSearch;
		Firebase.getDataFromUids([ "nLjqn36sbddbIFC3S8u4kyLGCPy2", "0hKPEVkI3DVXvLKHtEFngWdGxIY2" ]).then((data) {
			setState(() {
				this.isSearchLoaded = true;
				this.searchResults = data;
			});
		});
		setState(() {
			this.isSearchLoaded = false;
			this.searchResults = new List();
		});
	}

	// Full-screen loading indicator
	Widget _buildLoadScreen() => new Center(
		child: new CircularProgressIndicator(
			value: null,
			valueColor: new AlwaysStoppedAnimation<Color>(Style.primary),
			strokeWidth: 2.5
		)
	);

	// The app bar is consistent between search state & default state,
	// so abstracted into function.
	Widget _buildAppbar({ String title="messages" }) => new SliverAppBar(
		floating: true,
		elevation: 0.0,
		backgroundColor: Colors.white,
		title: new Padding(
			padding: const EdgeInsets.only(left: 10.0, top: 20.0),
			child: new Text(
				title,
				style: new TextStyle(
					fontSize: 24.0,
					fontWeight: FontWeight.w600
				)
			)
		),
		bottom: new PreferredSize(
			preferredSize: new Size.fromHeight(50.0),
			child: new Padding(
				padding: const EdgeInsets.symmetric(horizontal: 25.0),
				child: new GestureDetector(
					onTap: _toggleSearch,
					child: new SearchBar()
				)
			)
		)
	);

	// Build the list that is shown during the search state.
	Widget _buildSearchList() => new SliverList(
		delegate: new SliverChildListDelegate(
			searchResults.map((UserData data) => new FriendListItem(
				name: "${data.firstName} ${data.lastName}",
				username: data.username
			)).toList()
		)
	);

	// Built the list that is shown during the default "messages" state.
	Widget _buildMessagesList() => new SliverList(
		delegate: new SliverChildListDelegate(
			chatrooms.map((Chatroom chatroom) => new ChatListItem(
				chatroom: chatroom
			)).toList()
		)
	);

	Widget build(BuildContext context) {
		if (!isSearch && !isLoaded) {
			return _buildLoadScreen();
		} else if (!isSearch && isLoaded) {
			return new CustomScrollView(
				slivers: [
					_buildAppbar(),
					_buildMessagesList()
				]
			);
		}

		if (isSearch && !isSearchLoaded) {
			//return _buildLoadScreen();
			return new CustomScrollView(
				slivers: [
					_buildAppbar(),
					new SliverList(
						delegate: new SliverChildListDelegate([
							new Padding(
								padding: const EdgeInsets.only(top: 30.0),
								child: new Column(
									children: [
										new CircularProgressIndicator(
											value: null,
											valueColor: new AlwaysStoppedAnimation<Color>(Style.primary),
											strokeWidth: 2.5
										)
									]
								)
							)
						])
					),
				]
			);
		} else if (isSearch && isSearchLoaded){
			return new CustomScrollView(
				slivers: [
					_buildAppbar(),
					_buildSearchList()
				]
			);
		}

	}
}
