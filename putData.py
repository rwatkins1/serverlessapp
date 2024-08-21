import json
import boto3

# Initialize the DynamoDB client
dynamodb = boto3.resource('dynamodb')

# Use the DynamoDB object to select our table
table = dynamodb.Table('Students')

# Define the handler function that the Lambda service will use as an entry point
def lambda_handler(event, context):
    # Extract values from the event object we got from the Lambda service and store in variables
    student_id = event['student_id']
    student_name = event['name']      # Corrected variable name
    student_age = event['age']        # Corrected variable name
    student_class = event['class']    # Corrected variable name
    
    # Write student data to the DynamoDB table and save the response in a variable
    response = table.put_item(
        Item={
            'student-id': student_id,  # Make sure this matches the attribute name in your DynamoDB table
            'name': student_name,
            'class': student_class,
            'age': student_age
        }
    )
    
    # Return a properly formatted JSON object
    return {
        'statusCode': 200,
        'body': json.dumps('Student data saved successfully!')
    }
