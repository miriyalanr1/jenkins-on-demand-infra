import boto3
import os

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')
    instance_id = os.environ.get('INSTANCE_ID')
    if instance_id:
        ec2.start_instances(InstanceIds=[instance_id])
        return {"statusCode": 200, "body": f"Started instance {instance_id}"}
    else:
        return {"statusCode": 400, "body": "INSTANCE_ID not found in environment"}