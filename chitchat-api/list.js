import * as dynamoDbLib from './lib/database';
import { success, failure  } from './lib/response';

export async function main(event, context, callback) {
	const params = {
		TableName: 'chatroom',
		KeyConditionExpression: 'user_id = :user_id',
		ExpressionAttributeValues: {
			':user_id': event.pathParameters.id,
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
