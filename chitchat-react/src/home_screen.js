import React, { Component } from 'react';
import { Image, Text, View, StyleSheet } from 'react-native';
import { TabNavigator } from 'react-navigation';
import ChatroomListScreen from 'src/chat/chatroom_list_screen';
import TabBarIcon from 'src/common/tab_bar_icon';

class NewsfeedScreen extends Component {
	static navigationOptions = {
		title: 'Newsfeed',
		tabBarIcon: ({ focused }) => (
			<TabBarIcon
				focused={focused}
				source={require('assets/icons/home_solid.png')}
				unfocusedSource={require('assets/icons/home_outline.png')}
			/>
		)
	}
	render() {
		return (
			<View style={{ flex: 1, backgroundColor: 'white' }}>
				<Text>Newsfeed!</Text>
				<Image
					style={styles.tabIcon}
					source={require('assets/icons/bell_outline.png')}
				/>
			</View>
		);
	}
}

const styles = StyleSheet.create({
	tabIcon: {
		resizeMode: 'contain',
		width: 50
	}
});

export default HomeScreen = TabNavigator({
	Newsfeed: NewsfeedScreen,
	ChatroomList: ChatroomListScreen,
}, {
	tabBarPosition: 'bottom',
	navigationOptions: {
		headerStyle: {
			elevation: 0,
			shadowOpacity: 0
		}
	},
	tabBarOptions: {
		showIcon: true,
		showLabel: false,
		style: {
			backgroundColor: 'white',
			elevation: 0
		},
		labelStyle: {
			color: 'black'
		},
		indicatorStyle: {
			backgroundColor: '#09D3CC',
			top: 0
		},
	}
});
