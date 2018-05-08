import React, { Component } from 'react';
import { Image, ImageSourcePropType, StyleSheet } from 'react-native';

export default class TabBarIcon extends Component {
	render() {
		return (
			<Image
				source={this.props.focused ? this.props.source : this.props.unfocusedSource}
				style={[
					this.props.style,
					styles.icon
				]}
			/>
		);
	}
}

const styles = StyleSheet.create({
	icon: {
		width: 30,
		height: 30,
		resizeMode: 'contain',
		opacity: 0.8
	},
});
