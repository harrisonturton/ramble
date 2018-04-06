import 'package:flutter/material.dart';

class TappableHeart extends StatefulWidget {
	TappableHeart({Key key, this.isLiked}) : super(key: key);
	bool isLiked;

	@override
	_TappableHeartState createState() => new _TappableHeartState();	
}

class _TappableHeartState extends State<TappableHeart> with SingleTickerProviderStateMixin {

	AnimationController _likeAnimationController;
	Animation<double> _likeAnimation;

	@override
	void initState() {
		super.initState();
		_likeAnimationController = new AnimationController(
			vsync: this,
			duration: new Duration(milliseconds: 500),
		);
		_likeAnimation = new CurvedAnimation(
			parent: _likeAnimationController,
			curve: Curves.elasticOut
		);
		_likeAnimation.addListener(() => this.setState((){}));
		_likeAnimationController.value = 1.0;
		//_likeAnimationController.reset();
		//_likeAnimationController.forward();
	}

	@override
	dispose() {
		_likeAnimationController.dispose();
		super.dispose();
	}

	void toggleLiked() {
		setState(() {
			widget.isLiked = !widget.isLiked;
		});
		_likeAnimationController.reset();
		_likeAnimationController.forward();
	}

	@override
	Widget build(BuildContext context) {
		return new GestureDetector(
			onTap: toggleLiked,
			child: new ScaleTransition(
				scale: _likeAnimation,
				alignment: FractionalOffset.center,
				child: new Image.asset(
					widget.isLiked ? "assets/icons/icon_heart_filled.png" : "assets/icons/icon_heart.png",
					color: widget.isLiked ? Colors.red : const Color.fromRGBO(135, 160, 181, 0.7),
					width: 35.0
				)
			)
		);
	}
}
