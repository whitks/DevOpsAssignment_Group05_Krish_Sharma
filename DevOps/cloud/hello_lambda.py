import json


def handler(event, context):
    """
    Minimal Lambda handler — returns a greeting.

    Test event: hello_lambda_event.json
    Deploy:  sam build && sam deploy --guided
    """

    name = event.get("queryStringParameters", {}).get("name", "World") \
           if isinstance(event.get("queryStringParameters"), dict) \
           else event.get("name", "World")

    body = {
        "message": f"Hello, {name}!",
        "function": context.function_name,
        "version": getattr(context, "function_version", "unknown"),
    }

    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(body),
    }