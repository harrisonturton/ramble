import React, { Component } from 'react';
import { ActivityIndicator, FlatList, Text, View, StyleSheet } from 'react-native';
import { StackNavigator } from 'react-navigation';
import { API } from 'aws-amplify';
import ChatroomListItem from './chatroom_list_item';

class HeaderRight extends Component {
	render() {
		return (
			<Text>Create new chat</Text>
		);
	}
}

export default class ChatroomListScreen extends Component {
	static navigationOptions = {
		title: 'Messages',
		headerRight: <HeaderRight />,
	};
	constructor() {
		super();
		this.state = {
			isLoaded: false,
			data: []
		};
	}
	componentWillMount() {
		this.fetchChatrooms();
	}
	async fetchChatrooms() {
		try {
			chatrooms = await API.get('dev-chitchat-api', '/chatrooms');
			this.setState(prevState => ({
				isLoaded: true,
				data: chatrooms
			}));
			console.log(chatrooms);
		} catch (err) {
			console.log("Error fetching chatroom list");
			console.log(err);
		}
	}
	renderItem({ item }) {
		return (
			<ChatroomListItem
				chatroomId={item['chatroom_id']}
				title={item['title']}
				recentMessage={item['recent_message']}
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
			<View style={styles.listContainer}>
				<FlatList
					data={this.state.data}
					keyExtractor={(item, index) => item['chatroom_id']}
					renderItem={this.renderItem}
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
	listContainer: {
		flex: 1,
		padding: 15,
		backgroundColor: 'white'
	},
});
