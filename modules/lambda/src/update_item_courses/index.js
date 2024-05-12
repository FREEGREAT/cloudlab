const AWS = require("aws-sdk");
const dynamoDB = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event, context) => {
  const updateData = {
    id: event.id, 
    name: event.name
  };

  const params = {
    TableName: process.env.TABLE_NAME,
    Key: {
      id: updateData.id
    },
    UpdateExpression: "set name = :n",
    ExpressionAttributeValues: {
      ":n": updateData.name
    },
    ReturnValues: "ALL_NEW"
  };

  try {
    const updatedData = await dynamoDB.update(params).promise();
    return {
      statusCode: 200,
      body: JSON.stringify(updatedData.Attributes),
    };
  } catch (error) {
    console.error('Error updating item', error);
    return {
      statusCode: 500,
      body: JSON.stringify('Error updating item'),
    };
  }
};