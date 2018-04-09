import 'package:flutter/material.dart';
import 'package:newsfeed_2/widgets/widgets.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/style/style.dart' as Style;

class ChatScreen extends StatelessWidget {
	ChatScreen({this.person});
	Model.Person person;

	void openOptionsScreen(BuildContext context) {
		MaterialPageRoute.debugEnableFadingRoutes = true;
		Navigator.of(context).push(new MaterialPageRoute(
			builder: (context) {
				return new Scaffold(
					appBar: new AppBar(
						backgroundColor: Style.Primary,
						leading: new BackButton(color: Colors.white),
						title: new Text(
							"Options",
							style: new TextStyle(
								color: Colors.white
							)
						)
					)
				);
			}
		));
	}

	@override
	build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(
				title: new Text(
					"${person.fullName}",
					style: new TextStyle(
						color: Colors.white
					)
				),
				leading: new BackButton(color: Colors.white),
				actions: [
					new ImageButton(
						image: vertical_ellipse,
						color: Colors.white,
						width: 35.0,
						onTap: () => openOptionsScreen(context),
					)
				],
				backgroundColor: Style.Primary,
				elevation: 2.0
			),
			body: new Column(
				children: [
					new Expanded(
						child: new ListView(
							children: [
								new ChatFrame()
							]
						)
					),
					new CommentInput()
				]
			)
		);
	}
}

