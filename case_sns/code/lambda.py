import boto3
import json
import logging
import os
import random

from botocore.exceptions import ClientError


logger = logging.getLogger(__name__)
level = logging.getLevelName("INFO")
logger.setLevel(level)


concepts = ["Barcos y extras", "Comisario V", "Señor Pato", "Piñas"]

SNS = boto3.client("sns")
SNS_ARN = os.environ.get("SNS_ARN")


def random_amount():
    return random.uniform(1000, 50000)


def random_concept():
    return random.choice(concepts)


def publish_message(event, lambda_context):
    amount = random_amount()
    concept = random_concept()
    message = f"Se ha expedido una factura por valor de {amount}. Concepto: {concept}"

    try:
        SNS.publish(
            TargetArn=SNS_ARN,
            Message=json.dumps({"default": json.dumps(message)}),
            MessageStructure="json",
        )

        logger.info(
            "Published message %s to topic %s.",
            message,
            SNS_ARN,
        )
    except ClientError:
        logger.exception("Couldn't publish message to topic %s.", SNS_ARN)
        raise
