import * as dynamoDbLib from '../lib/database';
import { success, failure  } from '../lib/response';

export async function main(event, context, callback) {
	// AWS prepends the location, e.g. 'us-east-1:cognito_identity_id',
	// so remove it before querying.
	var cognitoId = event.requestContext.identity.cognitoIdentityId;
	cognitoId = cognitoId.split(':').pop();

	const params = {
		TableName: 'chatroom',
		KeyConditionExpression: 'user_id = :user_id',
		ExpressionAttributeValues: {
			':user_id': cognitoId,
		}
	};

	try {
		const result = await dynamoDbLib.call('query', params);
		callback(null, success(result.Items));
	} catch (e) {
		console.log(e);
		callback(null, failure({ status: false }));
	}
}
