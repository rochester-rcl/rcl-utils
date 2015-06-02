#!/usr/bin/env python
import argparse
import csv

parser = argparse.ArgumentParser(description="Run a script to add the content of a csv file to an XML file")#Setting up our Argument Parser
parser.add_argument('-i', '--input', help="input csv file", required="true", type=str)#Adding an input argument
parser.add_argument('-o', '--output', help="Path of output directory", required="true")#Adding an output argument
args = vars(parser.parse_args())#Get some variables from parse_args dictionary (directory, output)
input = args['input']
output = args['output']



with open ('/Users/joshr/Documents/csvScript/bragdonDatesTest.csv', 'rb') as file1:
    csvreader = csv.reader(file1, delimiter=',', quotechar='"')
    for row in csvreader:
        
            rootOpen = '<?xml version="1.0" encoding="UTF-8"?><TEI>'
            
            rootClose = "</TEI>"
             
            firstColumn = row[0]
            secondColumn = row[1]
            
            outputName = output + firstColumn
            content = rootOpen + secondColumn + rootClose
                
            with open(outputName, 'w') as outputFile:

                outputFile.write(content)
                
                


            