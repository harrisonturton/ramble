import React, { Component } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { TabNavigator } from 'react-navigation';
import TestScreen from './Test';

class HomeScreen extends Component {
	render() {
		return (
			<View style={{ flex: 1, alignItems: 'center', justifyContent: 'center'  }}>
				<Text>Home Screen</Text>
			</View>
		);
	}
}

const RootStack = TabNavigator({
	Newsfeed: {
		screen: HomeScreen
	},
	Messages: {
		screen: TestScreen
	},
	Friends: {
		screen: TestScreen
	}
}, {
	initialRouteName: 'Newsfeed',
	tabBarPosition: 'bottom'
});

export default class App extends Component {
	render() {
		return <RootStack/>;
	}
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
