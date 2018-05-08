import React, { Component } from 'react';
import { Image, Text, View, StyleSheet } from 'react-native';
import { StackNavigator, TabNavigator } from 'react-navigation';
import ChatroomListScreen from 'src/chat/chatroom_list_screen';
import ChatroomScreen from 'src/chat/chatroom_screen';
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

const TabScreen = TabNavigator({
	Newsfeed: NewsfeedScreen,
	ChatroomList: ChatroomListScreen,
}, {
	tabBarPosition: 'bottom',
	navigationOptions: {
		headerTitleStyle: {
			fontFamily: 'Hind-Medium',
			fontWeight: '400',
			fontSize: 24
		},
		headerStyle: {
			paddingTop: 15,
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

export default HomeScreen = StackNavigator({
	Home: TabScreen,
	Chatroom: ChatroomScreen
}, { headerMode: 'none' });
