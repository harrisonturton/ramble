import React, { Component } from 'react';
import { TouchableOpacity, Text, View, StyleSheet } from 'react-native';
import { StackNavigator } from 'react-navigation';
import { Button, OutlineButton } from 'app/common/button';

class OnboardingScreen extends Component {
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
						onPress={() => this.props.navigation.navigate('Login')}
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

class LoginScreen extends Component {
	render() {
		return (
			<View>
				<Text>Login</Text>
			</View>
		);
	}
}


class RegisterScreen extends Component {
	render() {
		return (
			<View>
				<Text>Register</Text>
			</View>
		);
	}
}

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
	Login: {
		screen: LoginScreen
	},
	Register: {
		screen: RegisterScreen
	}
}, {
	initialRouteName: 'Welcome',
});
