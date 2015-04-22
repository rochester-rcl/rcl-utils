#!/usr/bin/env python
import os
import fnmatch
import lxml.etree as ET
import argparse

parser = argparse.ArgumentParser(description="Run a script to recursively list the absolute paths of all xml files in a given directory")#Setting up our Argument Parser
parser.add_argument('-d', '--directory', help="Absolute Path of Directory You Want to Scan", required="true", type=str)#Adding a directory argument
parser.add_argument('-o', '--output', help="Path of Output File", required="true")#Adding an output argument
args = vars(parser.parse_args())#Get some variables from parse_args dictionary (directory, output)
directory = args['directory']
output = args['output']

root = ET.Element("list")#Set up our root level in our xml file

for dirname, dirnames, filenames in os.walk(directory): # Loop through the directory passed from --directory argument
    for file in filenames:
        if '.xml' in file: #Look for xml files only
            filePath =  os.path.abspath(os.path.join(dirname, file))# Join the absolute path to the file
            filename = ET.SubElement(root, "file")# Create the "file" child 
            filename.text = filePath #Add absolute path of file as content
tree = ET.ElementTree(root)# Create our DOM tree 
tree.write(output, pretty_print=True, xml_declaration=True, encoding="utf-8")#Write our file, with location passed from --output argument 
