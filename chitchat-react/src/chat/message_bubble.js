import React, { Component } from 'react';
import { View, Text, StyleSheet } from 'react-native';

export default class MessageBubble extends Component {
	render() {
		return (
			<View style={styles.container}>
				<Text style={styles.author}>{this.props.author}</Text>
				<View style={styles.bubbleContainer}>
					<View style={[styles.bubble, this.props.isHomeMessage ? styles.homeBubble : styles.awayBubble]}>
						<Text style={styles.message}>{this.props.message}</Text>
					</View>
				</View>
			</View>
		);
	}
}

const styles = StyleSheet.create({
	container: {
		alignItems: 'flex-end',
		margin: 15,
		marginBottom: 0
	},
	homeBubble: {
		backgroundColor: '#0084FF',
	},
	awayBubble: {
		backgroundColor: '#EAEAEA'
	},
	bubble: {
		alignSelf: 'flex-start',
		padding: 10,
		borderRadius: 10.0,
	},
	message: {
		fontSize: 16,
		color: 'white'
	},
	author: {
		fontSize: 14,
		marginBottom: 3,
		opacity: 0.7,
		fontWeight: '400'
	}
});
