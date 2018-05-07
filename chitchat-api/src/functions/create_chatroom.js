import uuid from 'uuid';
import * as dynamoDbLib from '../lib/database';
import { success, failure  } from '../lib/response';

export async function main(event, context, callback) {
	const data = JSON.parse(event.body);
	const params = {
		TableName: 'chatroom',
		Item: {
			user_id: event.requestContext.identity.cognitoIdentityId,
			chatroom_id: uuid.v1(),
			title: data.chatroom.title,
			recent_message: data.chatroom.recent_message,
			createdAt: Date.now()
		}
	};

	try {
		await dynamoDbLib.call('put', params);
		callback(null, success(params.Item));
	} catch (e) {
		callback(null, failure({ status: false  }));
	}
}
