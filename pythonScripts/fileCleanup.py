import os
import sys
import argparse

parser = argparse.ArgumentParser(description="Run a script to clean up files in a directory")#Setting up our Argument Parser
parser.add_argument('-d', '--directory', help="input directory w/ files 132kb in size", required="true", type=str)#Adding an input argument
args = vars(parser.parse_args())#Get some variables from parse_args dictionary (directory, output)
directory = args['directory']

filesToBeDeleted = []

for dirname, dirnames, filenames in os.walk(directory):
    for filename in filenames:
        filePath = os.path.abspath(os.path.join(dirname, filename))

        fileSize = os.path.getsize(filePath)

        if fileSize == 132:
            filesToBeDeleted.append(filePath)


noOfFiles = len(filesToBeDeleted)

if noOfFiles == 0:
    print "None of the files are 132 bytes in size\n"
    sys.exit("Exiting now...")
    
else:

    for fileName in filesToBeDeleted:
        print fileName

    print "The Above {} files will be deleted".format(noOfFiles)

    raw_input("Press return to confirm the deletion. You won't get these files back, you know ")

    for fileName in filesToBeDeleted:
        os.remove(fileName)

    print "{} files removed forever".format(noOfFiles)
            
            
            

