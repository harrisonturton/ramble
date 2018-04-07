import 'package:flutter/material.dart';
import 'package:newsfeed_2/widgets/widgets.dart';

class TappableImageButton extends StatefulWidget {
	TappableImageButton({
		Key key,
		this.image,
		this.activeImage,
		this.color,
		this.activeColor,
		this.width=35.0,
		this.onTap,
		this.isTapped=false,
	}) : super(key: key);

	String image;
	String activeImage;
	Color color;
	Color activeColor;
	double width;
	VoidCallback onTap;
	bool isTapped;

	@override
	_TappableImageButtonState createState() => new _TappableImageButtonState();	
}

class _TappableImageButtonState extends State<TappableImageButton> with SingleTickerProviderStateMixin {

	AnimationController _tapAnimationController;
	Animation<double> _tapAnimation;

	@override
	void initState() {
		super.initState();
		_tapAnimationController = new AnimationController(
			vsync: this,
			duration: new Duration(milliseconds: 500),
		);
		_tapAnimation = new CurvedAnimation(
			parent: _tapAnimationController,
			curve: Curves.elasticOut
		);
		_tapAnimation.addListener(() => this.setState((){}));
		_tapAnimationController.value = 1.0;
	}

	@override
	dispose() {
		_tapAnimationController.dispose();
		super.dispose();
	}

	void toggleTapped() {
		widget.onTap();
		setState(() {
			widget.isTapped = !widget.isTapped;
		});
		_tapAnimationController.reset();
		_tapAnimationController.forward();
	}

	@override
	Widget build(BuildContext context) {
		return new GestureDetector(
			onTap: toggleTapped,
			child: new ScaleTransition(
				scale: _tapAnimation,
				alignment: FractionalOffset.center,
				child: new Image.asset(
					widget.isTapped ? widget.activeImage : widget.image,
					color: widget.isTapped ? widget.activeColor : widget.color,
					width: widget.width
				)
			)
		);
	}
}
