import os
import boto3
import requests
from requests.auth import HTTPBasicAuth

def lambda_handler(event, context):
    jenkins_url = os.environ['JENKINS_URL']
    username = os.environ['USERNAME']
    api_token = os.environ['API_TOKEN']
    instance_id = os.environ['INSTANCE_ID']

    try:
        api_url = f"{jenkins_url}/computer/api/json?depth=1"
        response = requests.get(api_url, auth=HTTPBasicAuth(username, api_token))
        response.raise_for_status()
        data = response.json()

        busy = any(computer['busy'] for computer in data['computer'])

        if not busy:
            ec2 = boto3.client('ec2')
            ec2.stop_instances(InstanceIds=[instance_id])
            return {"statusCode": 200, "body": f"Jenkins idle. Stopped instance {instance_id}"}
        else:
            return {"statusCode": 200, "body": "Jenkins busy. No action taken."}

    except Exception as e:
        return {"statusCode": 500, "body": str(e)}
