import json
import argparse
import csv
from datetime import datetime, timedelta
from itertools import izip_longest, izip

parser = argparse.ArgumentParser(description="Run a script to clean up json files for RAW")#Setting up our Argument Parser
parser.add_argument('-i', '--inputFile', help="input .json file", required="true", type=str)#Adding an input argument
parser.add_argument('-o', '--outputFile', help="output json file / path name", required="true", type=str )
args = vars(parser.parse_args())#Get some variables from parse_args dictionary (directory, output)

jsonInput = args['inputFile']
csvOutput = args['outputFile']

with open(jsonInput, 'rb') as jsonFile, open(csvOutput, 'w') as outFile:
    csvWriter = csv.writer(outFile)
    jsonData = json.load(jsonFile)
    headerRow = ['Pickup No.','Pickup Date and Time', 'Pickup Length In Seconds', 'Session No.','Session Date and Time', 'Session Length In Seconds']
    csvWriter.writerow(headerRow)
    days = jsonData['days']

    pickupIterator = 0
    sessionIterator = 0
    for x in days:
        for i,z in izip_longest(x['pickups'], x['sessions'],fillvalue=None):
            if (i == None):
                pickupDate = ' '
                pickupLength = ' '
            else:
                pickupDate = i['date']
                pickupLength = i['lengthInSeconds']
                pickupIterator += 1
            if (z == None):
                sessionDate = ' '
                sessionLength = ' '
            else:
                sessionDate = z['date']
                sessionLength = z['lengthInMinutes']

                lengthInt = int(sessionLength)

                lengthSec = lengthInt * 60

                sessionIterator += 1

            formatting = pickupIterator, pickupDate, pickupLength, sessionIterator, sessionDate, lengthSec
            csvWriter.writerow(formatting)
