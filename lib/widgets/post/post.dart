import 'package:flutter/material.dart';
import 'package:newsfeed_2/widgets/Avatar.dart';
import 'package:newsfeed_2/mock/mock.dart';
import 'package:newsfeed_2/style/style.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'heart.dart';

class Post extends StatelessWidget {
	Post({this.post, this.hasActionBar=true});
	Model.Post post;
	bool hasActionBar;

	@override
	Widget build(BuildContext context) {
		bool notNull(Object o) => o != null;
		return new Container(
			padding: const EdgeInsets.only(
				left: 20.0,
				right: 20.0,
				top: 25.0,
				bottom: 15.0
			),
			child: new Column(
				mainAxisSize: MainAxisSize.min,
				children: <Widget>[
					new _PostHeader(post: post),
					new _PostContent(post: post),
					hasActionBar
					? new _PostActionBar(post: post)
					: null
				].where(notNull).toList()
			),
			decoration: new BoxDecoration(
				color: Colors.white,
				borderRadius: new BorderRadius.circular(5.0),
			)
		);
	}
}

class _PostHeader extends StatelessWidget {
	_PostHeader({this.post});
	final Model.Post post;

	@override
	void build(BuildContext context) {
		return new Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: <Widget>[
				new Row(
					children: <Widget>[
						new Avatar(
							size: 40.0,
							backgroundImage: new ExactAssetImage(post.author.profilePicture)
						),
						new Padding(
							padding: new EdgeInsets.only(left: 10.0),
							child: new Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: <Widget>[
									new Text(
										post.author.fullName,
										style: LabelStrong
									),
									new Text(
										post.location + ", " + post.timestamp,
										style: LabelWeak
									)
								]
							)
						),
					]
				),
				new Image.asset(
					"assets/icons/icon_vertical_ellipse.png",
					color: const Color.fromRGBO(135, 160, 181, 0.7),
					width: 35.0
				)
			]
		);
	}
}

class _PostContent extends StatelessWidget {
	_PostContent({this.post});
	Model.Post post;

	@override
	void build(BuildContext context) {
		return new Padding(
			padding: new EdgeInsets.symmetric(vertical: 15.0),
			child: new Container(
				child: new Text(
					post.content,
					style: PostBody
				)
			)
		);
	}
}

class _PostActionBar extends StatelessWidget {
	_PostActionBar({this.post});
	Model.Post post;

	@override
	void build(BuildContext context) {
		return new Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: <Widget>[
				new Text(
					post.isLikedBy.length.toString() + " Likes",
					style: LabelWeak
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
							child: new TappableHeart(isLiked: false)
						)
					]
				)
			]
		);
	}
}
