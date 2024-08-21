import json
import boto3

# Initialize the DynamoDB client
dynamodb = boto3.resource('dynamodb')


def lambda_handler(event, context):
    # Initialize a DynamoDB resource object for the specified region

    # Select the DynamoDB table named 'studentData'
    table = dynamodb.Table('Students')

    # Scan the table to retrieve all items
    response = table.scan()
    data = response['Items']

    # If there are more items to scan, continue scanning until all items are retrieved
    while 'LastEvaluatedKey' in response:
        response = table.scan(ExclusiveStartKey=response['LastEvaluatedKey'])
        data.extend(response['Items'])

    # Return the retrieved data
    return data