import 'package:flutter/material.dart';
import 'package:newsfeed_2/mock/mock.dart';

class Post extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		MockProfile profile = new MockProfile();
		return new Container(
			margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
			padding: const EdgeInsets.all(20.0),
			child: new Column(
				mainAxisSize: MainAxisSize.min,
				children: <Widget>[
					new _PostHeader(
						name: profile.fullName,
						location: "ANU",
						timestamp: "3 hours ago",
						image: profile.image
					),
					new _PostContent(),
					new _PostActionBar(),
				]
			),
			decoration: new BoxDecoration(
				color: Colors.white,
				borderRadius: new BorderRadius.circular(5.0),
				boxShadow: <BoxShadow>[
					new BoxShadow(
						color: const Color.fromRGBO(135, 160, 181, 0.2),
						offset: new Offset(0.0, 3.5),
						blurRadius: 7.0
					)
				]
			)
		);
	}
}

class _PostActionBar extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: <Widget>[
				new Text(
					"123 Likes",
					style: new TextStyle(
						color: const Color.fromRGBO(135, 160, 181, 1.0),
					)
				),
				new Row(
					children: <Widget>[
						new Image.asset(
							"assets/icons/icon_comment.png",
							color: const Color.fromRGBO(135, 160, 181, 0.7),
							width: 35.0
						),
						new Padding(
							padding: const EdgeInsets.only(left: 5.0),
							child: new Image.asset(
								"assets/icons/icon_heart.png",
								color: const Color.fromRGBO(135, 160, 181, 0.7),
								width: 35.0
							),
						)
					]
				)
			]
		);
	}
}

class _PostContent extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return new Padding(
			padding: new EdgeInsets.symmetric(vertical: 15.0),
			child: new Container(
				child: new Text(
					"#ANUCrush13040\nBoys who play piano so elegantly ;)",
					style: new TextStyle(
						color: const Color.fromRGBO(50, 67, 81, 1.0),
						fontSize: 16.0,
						height: 1.15
					)
				)
			)
		);
	}
}


class _PostHeader extends StatelessWidget {
	_PostHeader({this.name, this.image, this.location, this.timestamp});
	final String name;
	final String image;
	final String location;
	final String timestamp;

	@override
	Widget build(BuildContext context) {
		return new Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: <Widget>[
				new Row(
					children: <Widget> [
						new Avatar(
							size: 40.0,
							backgroundImage: new ExactAssetImage(this.image)
						),
						new Padding(
							padding: new EdgeInsets.only(left: 10.0),
							child: new Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: <Widget>[
									new Text(
										this.name,
										style: new TextStyle(
											fontWeight: FontWeight.bold,
											color: const Color.fromRGBO(60,64,83,1.0),
										)
									),
									new Text(
										this.location + ", " + this.timestamp,
										style: new TextStyle(
											color: const Color.fromRGBO(135, 160, 181, 1.0)
										)
									),
								]
							)
						),
					]
				),
				new Image.asset(
					"assets/icons/icon_vertical_ellipse.png",
					color: const Color.fromRGBO(135, 160, 181, 0.7),
					width: 35.0
				),
			]
		);
	}
}

class Avatar extends StatelessWidget {
	Avatar({this.backgroundImage, this.size});
	final ImageProvider backgroundImage;
	final double size;

	@override
	Widget build(BuildContext context) {
		return new Container(
			constraints: new BoxConstraints(
				minHeight: size,
				maxHeight: size,
				minWidth: size,
				maxWidth: size,
			),
			decoration: new BoxDecoration(
				shape: BoxShape.circle,
				image: new DecorationImage(
					image: backgroundImage,
					fit: BoxFit.cover
				)
			)
		);
	}
}
