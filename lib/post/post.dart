import 'package:flutter/material.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/widgets/Avatar.dart';
import 'heart.dart';
import 'package:newsfeed_2/style/style.dart';

class Post extends StatefulWidget {
	Post({Key key, this.post}) : super(key: key);
	Model.Post post;

	@override
	createState() => new _PostState();
}

class _PostState extends State<Post> {

	@override
	Widget build(BuildContext context) {
		return new Container(
			margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
			padding: const EdgeInsets.all(20.0),
			child: new Column(
				mainAxisSize: MainAxisSize.min,
				children: <Widget>[
					new _PostHeader(
						name: widget.post.author.fullName,
						location: widget.post.location,
						timestamp: widget.post.timestamp,
						image: widget.post.author.profilePicture
					),
					new _PostContent(
						content: widget.post.content
					),
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
					style: LabelWeak,
					//new TextStyle(
					//	color: const Color.fromRGBO(135, 160, 181, 1.0),
					//)
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
							child: new TappableHeart(isLiked: false),
							//child: new Image.asset(
							//	"assets/icons/icon_heart.png",
							//	color: const Color.fromRGBO(135, 160, 181, 0.7),
							//	width: 35.0
							//),
						)
					]
				)
			]
		);
	}
}

class _PostContent extends StatelessWidget {
	_PostContent({this.content});
	final String content;

	@override
	Widget build(BuildContext context) {
		return new Padding(
			padding: new EdgeInsets.symmetric(vertical: 15.0),
			child: new Container(
				child: new Text(
					content,
					style: PostBody
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
										style: LabelStrong
									),
									new Text(
										this.location + ", " + this.timestamp,
										style: LabelWeak
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
