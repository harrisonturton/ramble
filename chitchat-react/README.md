![Alt text](design/github_logo.png?raw=true "Title")

ChitChat is a social network that respects user privacy. We are fully transparent — anyone is welcome to browse our code and verify our claims.

This app is built with React Native upon AWS.

### Aims & Mission
- Never use private data (e.g. instant message data) for targeting advertising
- Encrypt private data wherever possible
- Never share data with third-parties (without explicit consent)
- Completely forget deleted data

## Technology

**Front End:**

- React Native

**Backend:**

Unless otherwise stated, these are AWS services. Built using the `aws-amplify` ECMAscript package.

- MobileHub
  - To centralize services & make development easier / faster
- DynamoDB
  - To hold user data,  chatrooms & instant messaging
- Cognito
  - Enables Authentication
- Lambda functions
  - Interacting with backend services (i.e. persisting data, retrieving data)
- API Gateway
  - For an entry point to the Lambda functions

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- React Native
- AWS Account
- Working Android or iOS device

## Authors
- [Harrison Turton](https://github.com/harrisonturton)

## License
Haven't decided upon a license yet. Please contact me for further details.
