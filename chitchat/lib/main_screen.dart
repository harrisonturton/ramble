import "package:flutter/material.dart";
import "package:chitchat/chat/chat.dart";
import "package:chitchat/common/style.dart" as Style;

class MainScreen extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return new DefaultTabController(
			length: 3,
			child: new Scaffold(
				backgroundColor: Colors.white,
				body: new NestedScrollView(
					headerSliverBuilder: (BuildContext context, bool isScrolled) {
						return [
							new SliverAppBar(
								elevation: 0.7,
								floating: true,
								pinned: true,
								forceElevated: true,
								snap: true,
								backgroundColor: Colors.white,
								title: new Padding(
									padding: const EdgeInsets.only(left: 5.0),
									child: new Text(
										"Newsfeed",
										style: new TextStyle(
											fontWeight: FontWeight.w600,
										)
									)
								),
								bottom: new TabBar(
									labelColor: Style.primary,
									unselectedLabelColor: Style.textLight,
									indicatorColor: Style.primary,
									indicatorPadding: const EdgeInsets.symmetric(horizontal: 10.0),
									tabs: [
										new Padding(
											padding: const EdgeInsets.symmetric(vertical: 10.0),
											child: const Text("Newsfeed")
										),
										new Padding(
											padding: const EdgeInsets.symmetric(vertical: 10.0),
											child: const Text("Notifications")
										),
										new Padding(
											padding: const EdgeInsets.symmetric(vertical: 10.0),
											child: const Text("Chat")
										),
									]
								)
							),
						];
					},
					body: new TabBarView(
						children: [
							new Text("Newsfeed"),
							new ChatScreen(),
							new Text("Notifactions"),
						]
					)
				),
			)
		);
	}
}
