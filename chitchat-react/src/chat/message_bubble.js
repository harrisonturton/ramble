import React, { Component } from 'react';
import { View, Text, StyleSheet } from 'react-native';

export default class MessageBubble extends Component {
	styles = StyleSheet.create({
		container: {
			alignItems: this.props.isHomeMessage ? 'flex-end' : 'flex-start',
			margin: 15,
			marginBottom: 0
		},
		message: {
			fontSize: 16,
			color: this.props.isHomeMessage ? 'white' : 'black',
		},
		bubble: {
			alignSelf: 'flex-start',
			backgroundColor: this.props.isHomeMessage ? '#0084FF' : '#EAEAEA',
			padding: 10,
			borderRadius: 10
		},
		author: {
			fontSize: 14,
			marginBottom: 3,
			opacity: 0.7,
			fontWeight: '400'
		}
	});
	render() {
		isHome = this.props.isHomeMessage;
		return (
			<View style={this.styles.container}>
				<Text style={this.styles.author}>{this.props.author}</Text>
				<View style={this.styles.bubbleContainer}>
					<View style={this.styles.bubble}>
						<Text style={this.styles.message}>{this.props.message}</Text>
					</View>
				</View>
			</View>
		);
	}
}
