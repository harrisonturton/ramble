import * as dynamoDbLib from '../lib/database';
import { success, failure  } from '../lib/response';

export async function main(event, context, callback) {
	const params = {
		TableName: 'chatroom',
		Key: {
			user_id: event.requestContext.identity.cognitoIdentityId,
			chatroom_id: event.pathParameters.id
		}
	};

	try {
		const result = await dynamoDbLib.call('get', params);
		if (result.Item) {
			callback(null, success(result.Item));
		} else {
			callback(null, failure({ status: false, error: "Item not found." }));
		}
	} catch (e) {
		console.log(e);
		callback(null, failure({ status: false }));
	}
}
