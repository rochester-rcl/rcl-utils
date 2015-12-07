<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    
    <xsl:output indent="yes" method="xml" omit-xml-declaration="no"/>
    <xsl:variable name="newline">
        <xsl:text>&#10;</xsl:text>
    </xsl:variable>
    
    <xsl:template match="/">        
            <xsl:processing-instruction name="xml-model">
            <xsl:text> href="http://humanities.lib.rochester.edu/ns/seward.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
        </xsl:processing-instruction>
            <xsl:value-of select="$newline"/>
            <xsl:processing-instruction name="xml-model">
            <xsl:text> href="http://humanities.lib.rochester.edu/ns/seward.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:text>
        </xsl:processing-instruction>
            <xsl:value-of select="$newline"/>
            <xsl:processing-instruction name="xml-model">
            <xsl:text> href="http://humanities.lib.rochester.edu/ns/seward.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:text>
        </xsl:processing-instruction>
            <xsl:value-of select="$newline"/>
            <xsl:comment>FALL ACTIVITY SPREADSHEET: https://goo.gl/fIdxtI</xsl:comment>
            <xsl:value-of select="$newline"/>
        
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <xsl:attribute name="xml:id" select="lower-case(replace(tokenize(base-uri(), '/')[last()], '.xml',''))"/>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Seward Family Digital Archive</title>
                        <respStmt>
                            <resp>transcriber</resp>
                            <persName ref="spp"/>
                        </respStmt>
                        <respStmt>
                            <resp>student editor</resp>
                            <persName ref="spp"/>
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
                            </msIdentifier>
                            <physDesc>
                                <objectDesc form="letter"/>
                            </physDesc>
                            <history>
                                <origin>
                                    <date when="1801-01-01"/>
                                </origin>
                            </history>
                        </msDesc>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <listPrefixDef>
                        <prefixDef ident="psn" matchPattern="([a-z]+)"
                            replacementPattern="http://seward.lib.rochester.edu/tei/persons.xml#$1">
                            <p> In the context of this project, private URIs with the prefix "psn" point to
                                <gi>person</gi> elements in the project's persons.xml authority file. </p>
                        </prefixDef>
                        <prefixDef ident="pla" matchPattern="([a-z]+)"
                            replacementPattern="http://seward.lib.rochester.edu/tei/places.xml#$1">
                            <p> In the context of this project, private URIs with the prefix "pla" point to
                                <gi>place</gi> elements in the project's places.xml authority file. </p>
                        </prefixDef>
                        <prefixDef ident="spp" matchPattern="([a-z]+)"
                            replacementPattern="http://seward.lib.rochester.edu/tei/staff.xml#$1">
                            <p> In the context of this project, private URIs with the prefix "psn" point to
                                <gi>person</gi> elements in the project's staff.xml authority file. </p>
                        </prefixDef>
                        <prefixDef ident="bib" matchPattern="([a-z]+)"
                            replacementPattern="http://seward.lib.rochester.edu/tei/bibl.xml#$1">
                            <p> In the context of this project, private URIs with the prefix "psn" point to
                                <gi>person</gi> elements in the project's bibl.xml authority file. </p>
                        </prefixDef>
                    </listPrefixDef>
                    <tagsDecl>
                        <rendition n="teibp:superscript" scheme="css"> verical-align: super; font-size: 12px; </rendition>
                        <rendition n="teibp:underline" scheme="css"> text-decoration: underline; </rendition>
                        <rendition n="teibp:strikethrough" scheme="css"> text-decoration: line-through; </rendition>
                        <rendition n="teibp:red" scheme="css"> color: red; </rendition>
                    </tagsDecl>
                </encodingDesc>
                <profileDesc>
                    <langUsage>
                        <language ident="en"/>
                    </langUsage>
                    <correspDesc>
                        <correspAction type="sent">
                            <persName ref="psn"/>
                            <placeName ref="pla"/>
                            <date type="creation" when="1801-01-01"/>
                        </correspAction>
                        <correspAction type="received">
                            <persName ref="psn"/>
                            <placeName ref="pla"/>
                        </correspAction>
                    </correspDesc>
                </profileDesc>
                <revisionDesc>
                    <listChange>
                        <change type="transcription" who="spp"/>
                        <change type="revision" when="2015-06-16" who="spp"/>
                    </listChange>
                </revisionDesc>
            </teiHeader>
            <facsimile>
                <graphic url="image.jpg"/>
            </facsimile>
            <text>
                <body>
                    <div><xsl:comment> Begin Transcription </xsl:comment> 
                        <ab>
                            <xsl:apply-templates select="//text/body/div"/>
                        </ab>
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
    
    <xsl:template match="hi">
        <hi>
            <xsl:attribute name="rend" select="@rend"/>
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    
    <xsl:template match="text/body/div/p/note">
        <note>
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    
</xsl:transform>
