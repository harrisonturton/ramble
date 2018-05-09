import React, { Component } from 'react';
import { ActivityIndicator, FlatList, Text, View, Image, StyleSheet } from 'react-native';
import { StackNavigator } from 'react-navigation';
import { API } from 'aws-amplify';
import MessageBubble from './message_bubble';

export default class ChatroomScreen extends Component {
	static navigationOptions = {
		title: 'Chatroom',
		headerMode: 'float'
	};
	constructor() {
		super();
		this.state = {
			isLoaded: false,
			data: []
		};
		this.fetchMessages = this.fetchMessages.bind(this);
	}
	componentWillMount() {
		const chatroomId = this.props.navigation.getParam('chatroomId', 'NO-ID');
		console.log(chatroomId);
		this.fetchMessages(chatroomId);
	}
	async fetchMessages(chatroomId) {
		try {
			messages = await API.get('dev-chitchat-api', '/chatrooms/' + chatroomId);
			this.setState(() => ({
				isLoaded: true,
				data: messages
			}));
		} catch (err) {
			console.log("Error fetching messages for " + chatroomId);
			console.log(err);
		}
	}
	renderMessage({ item }) {
		return (
			<MessageBubble
				isHomeMessage={item['author'] == 'Harrison Turton'}
				author={item['author']}
				message={item['message']}
			/>
		);
	}
	render() {
		if (!this.state.isLoaded) {
			return (
				<View style={styles.loadingContainer}>
					<ActivityIndicator size='large' color='#09D3CC'/>
				</View>
			);
		}
		return (
			<View style={styles.container}>
				<FlatList
					data={this.state.data}
					keyExtractor={(item, index) => item['timestamp']}
					renderItem={this.renderMessage}
				/>
			</View>
		);
	}
}

const styles = StyleSheet.create({
	loadingContainer: {
		flex: 1,
		justifyContent: 'center',
		alignItems: 'center',
		backgroundColor: 'white'
	},
	container: {
		flex: 1,
		backgroundColor: '#FAFAFA'
	},
});
