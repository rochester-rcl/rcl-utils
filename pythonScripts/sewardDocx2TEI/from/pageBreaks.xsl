<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="tei">
   
    
    
    <xsl:output indent="yes" method="xml"/>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
        <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
     </xsl:template>


    <xsl:template match="tei:text/tei:body/tei:div/tei:p/tei:pb">
    <pb>
        <xsl:attribute name="n">
            <xsl:number/><xsl:value-of select="tei:text/tei:body/tei:div/tei:p/tei:pb"/>
        </xsl:attribute>
    </pb>
    </xsl:template> 

</xsl:transform>