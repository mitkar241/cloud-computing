import json
import time
from time import gmtime, strftime
import os
import logging
import atexit
from subprocess import PIPE, run

import signal

# Epoch time conversion
fmt = "%Y-%m-%dT%H:%M:%S"
containername = os.environ["container_name"]
hostport = os.environ["host_port"]
lambda_function_name = os.environ["lambda_function_name"]

logfile_name = "{}.log".format(containername)

def handler(signum, frame):
    stored_logfile_name = "{}-{}.log".format(containername, strftime("%Y-%m-%dT%H-%M-%S", gmtime()))
    os.system("sudo mv /var/log/{} /var/log/{}".format(logfile_name, stored_logfile_name))

signal.signal(signal.SIGABRT, handler)
signal.signal(signal.SIGINT, handler)
signal.signal(signal.SIGTERM, handler)

def out(command):
    result = run(command, stdout=PIPE, stderr=PIPE, universal_newlines=True, shell=True)
    return result.stdout

def rename_logfile():
    stored_logfile_name = "{}-{}.log".format(containername, strftime("%Y-%m-%dT%H-%M-%S", gmtime()))
    os.system("sudo mv /var/log/{} /var/log/{}".format(logfile_name, stored_logfile_name))
    print ("Logger has stopped ...")

atexit.register(rename_logfile)

logging.basicConfig(filename='/var/log/{}'.format(logfile_name), format="%(message)s", level=logging.INFO)
latest_eventId = 0
is_null = True

while(is_null):
    cwstr = out("aws --endpoint-url http://localhost:" + hostport + " logs filter-log-events --log-group-name /aws/lambda/" + lambda_function_name)
    if cwstr:
        cwlog = json.loads(cwstr)
        event = cwlog["events"][0]
        logging.info("time=\"{}\" logstream=\"{}\" msg=\"{}\"".format(time.strftime(fmt, time.localtime(event["timestamp"]/1000)), event["logStreamName"],  event["message"]))
        is_null = False
    time.sleep(1)

while(True):
    cwstr = out("aws --endpoint-url http://localhost:" + hostport + " logs filter-log-events --log-group-name /aws/lambda/" + lambda_function_name)
    cwlog = json.loads(cwstr)
    last_event = cwlog["events"][-1]
    if int(last_event["eventId"]) > latest_eventId:
        for event in cwlog["events"]:
            if int(event["eventId"]) <= latest_eventId:
                continue
            logging.info("time=\"{}\" logstream=\"{}\" msg=\"{}\"".format(time.strftime(fmt, time.localtime(event["timestamp"]/1000)), event["logStreamName"],  event["message"]))
            latest_eventId = int(event["eventId"])
    time.sleep(5)
