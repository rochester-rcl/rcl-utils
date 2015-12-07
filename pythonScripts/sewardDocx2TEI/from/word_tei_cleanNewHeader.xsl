<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    
    <!-- DEPRECATED: This template file was replaced by teiNewHeader8_25.xsl
         Joe Easterly, December 2015
    -->
    
    <xsl:output indent="yes" method="xml"/>
    
    <xsl:template match="/">
        <xsl:comment>Written by Luke Kortepeter June 2013</xsl:comment>
        <xsl:processing-instruction name="xml-model">
            <xsl:text> href="http://seward.lib.rochester.edu/tei/tei_all.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
        </xsl:processing-instruction>
        <xsl:processing-instruction name="xml-stylesheet">
            <xsl:text>type="text/xsl" href="http://seward.lib.rochester.edu/sites/default/files/TEI-Boilerplate/content/teibp.xsl"</xsl:text>
        </xsl:processing-instruction>
        <TEI xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:svg="http://www.w3.org/2000/svg"
            xmlns:math="http://www.w3.org/1998/Math/MathML" xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title type="main">Seward Family Digital Archive</title>
                        <respStmt>
                            <resp ref="Transcriber"/>
                            <persName ref="spp:"/><xsl:comment>Enter three-letter transcriber ID here "ref="spp:zzz"</xsl:comment>
                        </respStmt>
                        <respStmt>
                            <resp ref="Student Editor"/>
                            <persName ref="spp:"/><xsl:comment>Enter three-letter student editor ID here "ref="spp:zzz"</xsl:comment>
                        </respStmt>
                    </titleStmt>
                    <publicationStmt>
                        <distributor>Seward Family Digital Archive</distributor>
                    </publicationStmt>
                    <sourceDesc>
                        <msDesc>
                            <msIdentifier>
                                <institution>University of Rochester</institution>
                                <repository>Rare Books and Special Collections</repository>
                                <collection></collection><xsl:comment>Include Collection Name: "Seward Family Papers," "William H. Seward Public Papers," "Grier Papers," "Chesebro Papers," "Miller Papers"</xsl:comment>
                                <idno></idno><xsl:comment>Include File Drawer or Box Number, Digital File???</xsl:comment>
                                <msName> </msName><xsl:comment> Include ... </xsl:comment>
                            </msIdentifier>
                            <physDesc>
                                <additions>
                                    <figure n="1"><xsl:comment>Add page number of letter here</xsl:comment>
                                        <graphic url="http://seward.lib.rochester.edu/tei/web_letters/titleofLetter/titleOfLetter.jpg"></graphic><xsl:comment>Add url to jpeg file of scanned letter</xsl:comment>
                                    </figure>
                                    <figure n="2"><xsl:comment>Add page number of letter here</xsl:comment>
                                        <graphic url="http://seward.lib.rochester.edu/tei/web_letters/titleofLetter/titleOfLetter.jpg"></graphic><xsl:comment>Add url to jpeg file of scanned letter</xsl:comment>
                                    </figure>
                                    <figure n="3"><xsl:comment>Add page number of letter here</xsl:comment>
                                        <graphic url="http://seward.lib.rochester.edu/tei/web_letters/titleofLetter/titleOfLetter.jpg"></graphic><xsl:comment>Add url to jpeg file of scanned letter</xsl:comment>
                                    </figure>
                                    <figure n="4"><xsl:comment>Add page number of letter here</xsl:comment>
                                        <graphic url="http://seward.lib.rochester.edu/tei/web_letters/titleofLetter/titleOfLetter.jpg"></graphic><xsl:comment>Add url to jpeg file of scanned letter</xsl:comment>
                                    </figure>
                                    <xsl:comment>Add any additional pages here</xsl:comment>
                                </additions>
                            </physDesc>
                            <history>
                                <origin>
                                    <date when="1830-01-01"/><xsl:comment> Include date in yyyy-mm-dd w/ certainty att. if not 100% </xsl:comment>
                                </origin>
                            </history>
                        </msDesc>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <listPrefixDef>
                        <prefixDef
                            ident="psn"
                            matchPattern="([a-z]+)"
                            replacementPattern="http://seward.lib.rochester.edu/tei/persons.xml#$1">
                            <p> In the context of this project, private URIs with the prefix
                                "psn" point to <gi>person</gi> elements in the project's
                                personography.xml file.
                            </p>
                        </prefixDef>
                    </listPrefixDef>
                    <tagsDecl>
                        <rendition xml:id="superscript" n="teibp:superscript" scheme="css"> verical-align:
                            super; font-size: 12px; </rendition>
                        <rendition xml:id="underline" n="teibp:underline" scheme="css"> text-decoration:
                            underline; </rendition>
                        <rendition xml:id="strikethrough" n="teibp:strikethrough" scheme="css"> text-decoration:
                            line-through; </rendition>
                        <rendition xml:id="red" n="teibp:red" scheme="css"> color: red; </rendition>
                    </tagsDecl>
                </encodingDesc>
                <profileDesc>
                    <creation>
                        <address>
               <persName xml:id="blah1"/><xsl:comment> Include valid person name of sender: "xml:id=SEWf_828"</xsl:comment>
               <placeName xml:id="blah2"/><xsl:comment>Include valid place name: "xml:id=ALB_1318" or "unknown" for either.</xsl:comment>
            </address>
                        <address>
            <persName xml:id="blah3"/><xsl:comment> Include valid person name of sender: "xml:id=SEWw_829"</xsl:comment>
               <placeName xml:id="blah4"/><xsl:comment> Include valid place name: "xml:id=AUB_1319" or "unknown" for either.</xsl:comment>
            </address>
                    </creation>
                    <langUsage>
                        <language ident="en"/>
                    </langUsage>
                </profileDesc>
                <revisionDesc>
                    <listChange>
                        <change type="Transcription" when="2014-01-01" who="spp:"/><xsl:comment> Include valid change type: "Transcription," "Revision," or "Publication" with "when=" and valid date" </xsl:comment>
                        <change type="Revision" when="2014-01-01" who="spp:"/>
                        <change type="Publication" when="2014-01-01" who="spp:"/>
                    </listChange>
                </revisionDesc>
            </teiHeader>
            <text>
                <body>
                    <div><xsl:comment> Begin Transcription </xsl:comment> 
                        <p>
                            <xsl:apply-templates select="//text/body/div"/>
                        </p>
                    </div>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="text/body/div/p">
        <xsl:apply-templates/>
        <lb/>
    </xsl:template>
    
    <xsl:template match="text/body/div/p/text()[contains(., '[page ')]">
        
        <xsl:element name="pb">
            <xsl:apply-templates/>
        </xsl:element>

    </xsl:template>
    
    <xsl:template match="text/body/div/p/hi">
        <hi>
            <!--<xsl:attribute name="rend">
                <xsl:value-of select="@rendition"/>
            </xsl:attribute>-->
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <xsl:template match="text/body/div/p/note">
        <note>
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    
   
</xsl:transform>
