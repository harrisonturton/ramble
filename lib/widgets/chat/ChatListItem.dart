import 'package:flutter/material.dart';
import 'package:newsfeed_2/mock/mock.dart';
import 'package:newsfeed_2/widgets/widgets.dart';
import 'package:newsfeed_2/style/style.dart';
import 'package:newsfeed_2/model/model.dart' as Model;

class ChatListItem extends StatelessWidget {
	ChatListItem({this.person});
	Model.Person person;

	Widget _header() {
		return new Row(
			mainAxisSize: MainAxisSize.min,
			children: [
				new Avatar(
					size: 40.0,
					backgroundImage: new ExactAssetImage(person.profilePicture)
				),
				new Padding(
					padding: const EdgeInsets.only(left: 15.0),
					child: new Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							new Text(
								person.fullName,
								style: new TextStyle(
									color: TextDark,
									fontWeight: FontWeight.w600,
									fontSize: 16.0
								)
							),
							new Text(
								"Heyy, how are you today?",
								style: LabelWeak
							)
						]
					),
				)
			]
		);
	}

	@override
	Widget build(BuildContext context) {
		return new Container(
			child: new Column(
				mainAxisSize: MainAxisSize.min,
				children: [
					new Padding(
						padding: const EdgeInsets.all(15.0),
						child: new Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: [
								_header(),
								new Text("3 minutes ago")
							]
						)
					),
					new Divider()
				]
			),
			decoration: new BoxDecoration(
				color: Colors.white,
			)
		);
	}
}
