import React, { Component } from 'react';
import { TouchableOpacity, Text, View, StyleSheet } from 'react-native';
import { StackNavigator, SwitchNavigator } from 'react-navigation';
import { Button, OutlineButton } from 'src/common/button';
import { Auth } from 'aws-amplify';

class OnboardingScreen extends Component {
	async attemptLogin () {
		// Both alternatives work.
		try {
			await Auth.signIn('admin@example.com', 'Test12345');
			console.log('Signed in! 12345');
			this.props.navigation.navigate('App');
		} catch (err) {
			console.log(err);
		}
	}
	render() {
		return (
			<View style={styles.container}>
				<View style={styles.textContainer}>
					<Text style={styles.logo}>chitchat</Text>
					<Text style={styles.header}>Own your data</Text>
					<Text style={styles.header}>Don't be a product.</Text>
				</View>
				<View style={styles.buttonContainer}>
					<Button
						text='LOGIN'
						onPress={() => this.attemptLogin()}
					/>
					<OutlineButton
						text='REGISTER'
						onPress={() => this.props.navigation.navigate('Register')}
					/>
				</View>
			</View>
		);
	}
}

OnboardingScreen.navigationOptions = ({ navigation: { state: { params = {} } } }) => ({
	header: null
});

const styles = StyleSheet.create({
	container: {
		flex: 1,
		justifyContent: 'space-between',
		backgroundColor: 'white',
		padding: 15,
	},
	buttonContainer: {
		marginBottom: 30,
	},
	textContainer: {
		marginTop: 50,
	},
	header: {
		fontSize: 26,
		color: 'rgb(70,70,70)'
	},
	logo: {
		fontSize: 28,
		marginBottom: 20,
		color: '#09D3CC'
	}
});

export default WelcomeScreen = StackNavigator({
	Welcome: {
		screen: OnboardingScreen
	},
}, {
	initialRouteName: 'Welcome',
});
