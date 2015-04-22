#!/usr/bin/env python
import os
import lxml.etree as ET
import argparse

parser = argparse.ArgumentParser(description="Run a script to recursively list the absolute paths of all xml files in a given directory")#Setting up our Argument Parser
parser.add_argument('-i', '--input', help="File you want to prepend to", required="true", type=str)
parser.add_argument('-o', '--output', help="Path of Output File")#Adding an output argument
args = vars(parser.parse_args())#Get some variables from parse_args dictionary (directory, output)
fileInput = args['input']
output = args['output']

tree = ET.parse(fileInput)

newText = ET.fromstring(''' <?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>
<?xml-model href="http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/tei_all.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>
<?xml-model href="http://humanities.lib.rochester.edu/ns/mbragdon.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>''')



root = tree.getroot()

newText.append(root)


print newText

