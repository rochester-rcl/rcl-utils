import os
import argparse
from pyPdf import PdfFileReader

parser = argparse.ArgumentParser(description="Run a script to convert a pdf to jpegs")#Setting up our Argument Parser
parser.add_argument('-i', '--input', help="input pdf file", required="true", type=str)#Adding an input argument
parser.add_argument('-o', '--output', help="Path of output directory", required="true")#Adding an output argument
args = vars(parser.parse_args())#Get some variables from parse_args dictionary (directory, output)
filePath = args['input']
output = args['output']

startHex = "\xff\xd8"
startFix = 0
endHex = "\xff\xd9"
endFix = 2
i = 0

pdfFind = PdfFileReader(open(filePath,'rb'))

noPages = pdfFind.getNumPages()

njpg = 0

pdf = file(filePath, "rb").read()

if pdf != None:
    
    prefix = raw_input("Enter prefix for filename of output jpeg (i.e myfile000.jpg): ")
    
    raw_input("File naming convention will be {}000.jpg. Press return to continue".format(prefix))

    while njpg <= noPages:

        stream = pdf.find("stream", i)

        start = pdf.find(startHex, stream, stream+20)

        if start < 0:
            i = stream+20
            continue
        end = pdf.find("endstream", start)

        if end < 0:
            raise Exception("Can't find end of stream!")

        end = pdf.find(endHex, end-20)

        if end < 0:
                raise Exception("Can't find end of jpeg!")

        start += startFix
        end += endFix
        print "JPEG {} from {} to {}".format(njpg, start, end)

        jpg = pdf[start:end]
        jpgFile = "{}{}{:03d}.jpg".format(output, prefix, njpg)
        jpgOutfile = file(jpgFile, "wb")
        jpgOutfile.write(jpg)
        jpgOutfile.close()
        njpg += 1
        i = end
            

            
