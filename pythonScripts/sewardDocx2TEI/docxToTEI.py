
import os
import lxml.etree as ET
import argparse
import zipfile
import subprocess
import sys
from StringIO import StringIO

parser = argparse.ArgumentParser(description="Converting docx to TEI")#Setting up our Argument Parser
parser.add_argument('-d', '--directory', help="Absolute Path of Docx File Directory", required=True, type=str)#Adding a directory argument
parser.add_argument('-o', '--output', help="Path of Output Directory", required=False)#Adding an output argument
parser.add_argument('-sax', '--saxon', help="Path to Saxon", required=False)
args = vars(parser.parse_args())#Get some variables from parse_args dictionary (directory, output)
directory = args['directory']
output = args['output']
saxonDir = args['saxon']

#Global functions defined
def saxonCheck():

    if (args['saxon'] != None):
        saxonDir = args['saxon']
        return saxonDir
    
    elif (os.path.exists('/Applications/Oxygen/oxygen/lib/saxon9ee.jar')):
        print 'Found Saxon'
        saxonDir = '/Applications/Oxygen/oxygen/lib/saxon9ee.jar'

        return saxonDir
    
    else :
        sys.exit("Unable to Detect Saxon Automatically. Please specify Saxon path with '-sax' or '--saxon'")

def outputCheck():

    if (args['output'] != None):

        outputDir = args['output']
        print 'Finished Files Will be Saved to ' + outputDir
        
        return outputDir
    
    else:

        outputDir = args['directory']
        print 'Finished Files Will be Saved to ' + outputDir
        return outputDir
#End of global functions
    
class docTransform: #Class for handling all transformation related methods
    
    def __init__(self, directory):
        
        self.directory = directory 


    def createTempDir(self):
        tempDirectoryName = self.directory + "temp/"
        if not os.path.exists(tempDirectoryName):
            os.makedirs(tempDirectoryName)
        else :
            print "Temp Directory Exists"

        return tempDirectoryName

    def cleanTempDir(self, directory):
        for dirname, dirnames, filenames in os.walk(directory):
            for filename in filenames:
                filePath = os.path.abspath(os.path.join(dirname, filename))
                if '.docx' not in filePath:
                    os.remove(filePath)
    


    def unzipFiles(self, tempDirectoryName, saxonDir):
        for dirname, dirnames, filenames in os.walk(self.directory):
            for filename in filenames:
                if '.docx' in filename:
                    print "Extracting to " + tempDirectoryName
                    filePath = os.path.abspath(os.path.join(dirname, filename))
                    with zipfile.ZipFile(filePath, "r") as zf:

                        outputSplit = filePath.split('.')

                        outputName = outputSplit[0] + '.xml'
                    
                        zf.extractall(tempDirectoryName)
                    
                        docFile = tempDirectoryName + "word/document.xml"
                    
                        cwd = os.path.dirname(__file__)
                    
                        xsltPath = cwd + "/from/docxtotei.xsl"

                        docFile = '-s:' + docFile

                        xsltPath = '-xsl:' + xsltPath

                        outputName = '-o:' + outputName

                        xslCommand = ['java','-jar',saxonDir,docFile,xsltPath,outputName]

                        print "Running Initial Transformation" 

                        subprocess.call(xslCommand)

                        print "Cleaning up Temp Directories"

                        self.cleanTempDir(tempDirectoryName)

    def transformFiles(self, saxonDir):

        print self.directory
        for dirname, dirnames, filenames in os.walk(self.directory):
            for filename in filenames:
                if '.xml' in filename:
                    
                    filePath = os.path.abspath(os.path.join(dirname, filename))

                    cwd = os.path.dirname(__file__)

                    xsltPath = cwd + "/from/word_tei_cleanNewHeader.xsl"

                    inFile = '-s:' + filePath

                    xsltPath = '-xsl:' + xsltPath

                    outputName = '-o:' + filePath

                    xslCommand = ['java','-jar',saxonDir,inFile,xsltPath,outputName]

                    print "Applying Some More Transformations" 

                    subprocess.call(xslCommand)
                    
    def pageBreaks(self, outputDir):
        for dirname, dirnames, filenames in os.walk(self.directory):
            for filename in filenames:
                if '.xml' in filename:
                    
                    filePath = os.path.abspath(os.path.join(dirname, filename))

                    output = os.path.abspath(os.path.join(outputDir, filename))

                    cwd = os.path.dirname(__file__)

                    xsltPath = cwd + "/from/pageBreaks.xsl"

                    xmlFile = ET.parse(filePath)

                    xslt = ET.parse(xsltPath)

                    transform = ET.XSLT(xslt)

                    pageBreaks = transform(xmlFile)

                    if (output != filePath):
                        
                       pageBreaks.write(output, pretty_print=True, encoding="utf-8")

                       
                    else:
                        
                       pageBreaks.write(filePath, pretty_print=True, encoding="utf-8") 
                    
#End of class docTransform

#################################### The Main Program ###############################
                       
saxon = saxonCheck()

outputDir = outputCheck()

#Do the setup steps first ^

                    
myDoc = docTransform(directory)                

tempDir = myDoc.createTempDir()

myDoc.unzipFiles(tempDir, saxon)

myDoc.transformFiles(saxon)

myDoc.pageBreaks(outputDir)

myDoc.cleanTempDir(directory)

#Done 


                    
                    




