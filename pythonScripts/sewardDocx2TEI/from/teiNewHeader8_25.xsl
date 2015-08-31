<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0">
    
    <xsl:output indent="yes" method="xml" omit-xml-declaration="no"/>
    
    <xsl:template match="/">
        <xsl:processing-instruction name="xml-model">
            <xsl:text> href="http://seward.lib.rochester.edu/ns/seward.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"</xsl:text>
        </xsl:processing-instruction>
        <xsl:processing-instruction name="xml-model">
            <xsl:text> href="http://seward.lib.rochester.edu/ns/seward.rng" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:text>
        </xsl:processing-instruction>
        <xsl:processing-instruction name="xml-model">
            <xsl:text> href="http://seward.lib.rochester.edu/ns/seward.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:text>
        </xsl:processing-instruction>
        <TEI xmlns:xi="http://www.w3.org/2001/XInclude" xmlns="http://www.tei-c.org/ns/1.0"
            xml:id="l_18440209lmw_ahs1v3">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>Letter Title Here</title>
                        <respStmt>
                            <resp>transcriber</resp>
                            <persName ref="spp:anb"/>
                        </respStmt>
                        <respStmt>
                            <resp>student editor</resp>
                            <persName ref="spp:sss"/>
                        </respStmt>
                    </titleStmt>
                    <publicationStmt>
                        <distributor>Seward Family Papers Project</distributor>
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
                                    <date when="1844-02-09"/>
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
                            <persName ref="psn:WORl_1068"/>
                            <placeName ref="pla:CAN_1332"/>
                            <date type="creation" when="1844-02-09"/>
                        </correspAction>
                        <correspAction type="received">
                            <persName ref="psn:SEWa_815"/>
                            <placeName ref="pla:POI_1454"/>
                        </correspAction>
                    </correspDesc>
                </profileDesc>
                <revisionDesc>
                    <listChange>
                        <change type="transcription" who="spp:anb"/>
                        <change type="revision" when="2015-06-16" who="spp:ekk"/>
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
            <xsl:attribute name="rendition">
                <xsl:value-of select="@rend"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    <xsl:template match="text/body/div/p/note">
        <note>
            <xsl:apply-templates/>
        </note>
    </xsl:template>
    
   
</xsl:transform>
