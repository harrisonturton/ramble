import * as dynamoDbLib from '../lib/database';
import { success, failure  } from '../lib/response';

export async function main(event, context, callback) {
	const params = {
		TableName: 'messages',
		KeyConditionExpression: 'chatroom_id = :chatroom_id',
		ExpressionAttributeValues: {
			':chatroom_id': event.pathParameters.id,
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
