![Alt text](design/github_logo.png?raw=true "Title")

ChitChat is a social network that respects user privacy. We are fully transparent — anyone is welcome to browse our code and verify our claims.

### Aims & Mission
- Never use private data (e.g. instant message data) for targeting advertising
- Encrypt private data wherever possible
- Never share data with third-parties (without explicit consent)
- Completely forget deleted data

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- [Flutter](https://flutter.io/)
- [Dart (comes with Flutter)](https://www.dartlang.org/)
- [Firebase Account](https://firebase.google.com/)
- Working Android or iOS device

### Installing

**Setting up the local project**
Clone the repository
```
git clone https://github.com/harrisonturton/chitchat
```
Install the dependencies
```
cd chitchat && flutter packages get
```

**Configuring Firebase**
1. Enable Email authentication
2. Enable Firestore
3. Configure the schema in Firestore
4. Add Android/iOS App
5. Save `google-services.json` to `android/app`
7. Add the following:

*Inside `android/build.grade`:*
```
repositories {
	// ... Other stuff
    maven {
        url "https://maven.google.com" // Google's Maven repository
    }   
}
```

*Inside `android/app/build.grade`, at the very bottom:*
```
apply plugin: 'com.google.gms.google-services'
```

**Running Locally**
Simply connect your device, and execute:
```
$ flutter run
```

## Deployment

**Android**
```
$ flutter build apk --release
$ flutter install
```
**Note:** If you cannot see your changes, run `flutter clean` before building & installing again.

## Contributing
Pull Requests welcome! For large changes, please open an issue so we can discuss the solution.

## Built With
- Flutter, Dart & Firebase

## Authors
- [Harrison Turton](https://github.com/harrisonturton)

## License
Haven't decided upon a license yet. Please contact me for further details.
