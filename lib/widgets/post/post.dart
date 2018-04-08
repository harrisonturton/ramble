import 'package:flutter/material.dart';
import 'package:newsfeed_2/mock/mock.dart';
import 'package:newsfeed_2/style/style.dart';
import 'package:newsfeed_2/model/model.dart' as Model;
import 'package:newsfeed_2/widgets/widgets.dart';

class Post extends StatelessWidget {
	Post({this.post, this.hasActionBar=true, this.onCommentTap, this.onHeartTap});
	Model.Post post;
	bool hasActionBar;
	VoidCallback onCommentTap;
	VoidCallback onHeartTap;

	@override
	Widget build(BuildContext context) {
		bool notNull(Object o) => o != null;
		return new Container(
			padding: const EdgeInsets.only(
				left: 20.0,
				right: 20.0,
				top: 10.0,
				bottom: 25.0
			),
			child: new Column(
				mainAxisSize: MainAxisSize.min,
				children: <Widget>[
					new _PostHeader(post: post),
					new _PostContent(post: post),
					hasActionBar
					? new _PostActionBar(
						post: post,
						onCommentTap: onCommentTap != null ? onCommentTap : (){},
						onHeartTap: onHeartTap != null ? onHeartTap : (){}
					)
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
										"${post.location}, ${post.timestamp}",
										style: LabelWeak
									)
								]
							)
						),
					]
				),
				new ImageButton(
					image: vertical_ellipse,
					color: const Color.fromRGBO(135, 160, 181, 0.7),
					width: 35.0,
					onTap: () {
						showDialog(
							context: context,
							child: new Dialog(
								child: new Container(
								padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
									child: new Column(
										mainAxisSize: MainAxisSize.min,
										crossAxisAlignment: CrossAxisAlignment.start,
										children: [
											new FlatButton(
												onPressed: () {},
												child: new Text(
													"Hide this post",
													style: LabelNormal
												)
											),
											new FlatButton(
												onPressed: () {},
												child: new Text(
													"Report this post",
													style: LabelNormal
												)
											),
											new FlatButton(
												onPressed: () {},
												child: new Text(
													"Block ${post.author.firstName}",
													style: LabelNormal
												)
											),
										]
									)
								)
							)
						);
					}
				),
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
				alignment: Alignment.centerLeft,
				child: new Text(
					post.content,
					style: PostBody
				)
			)
		);
	}
}

class _PostActionBar extends StatelessWidget {
	_PostActionBar({this.post, this.onCommentTap, this.onHeartTap});
	Model.Post post;
	VoidCallback onCommentTap;
	VoidCallback onHeartTap;

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
					children: [
						new TappableImageButton(
							image: comment,
							activeImage: comment,
							color: const Color.fromRGBO(135, 160, 181, 0.7),
							activeColor: const Color.fromRGBO(135, 160, 181, 0.7),
							width: 35.0,
							onTap: onCommentTap,
							isTapped: false,
						),
						new Padding(
							padding: const EdgeInsets.only(left: 5.0),
							child: new TappableImageButton(
								image: heart_border,
								activeImage: heart,
								color: const Color.fromRGBO(135, 160, 181, 0.7),
								activeColor: Colors.red,
								width: 35.0,
								onTap: onHeartTap,
								isTapped: false
							)
						)
					]
				)
			]
		);
	}
}
