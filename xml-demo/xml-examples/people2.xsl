<?xml version="1.0" encoding="windows-1252"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="utf-8" standalone="yes" 
omit-xml-declaration="no" cdata-section-elements="" indent="yes"/>

<xsl:template match="/">  
	<people> 
	  <xsl:apply-templates select="/" mode="i"/>
	  <xsl:apply-templates select="/people/name"/>	 
	</people>
</xsl:template>

<xsl:template match="name">		
	<name>	  
		<xsl:attribute name="lang">
		   <xsl:value-of select="."/>
		</xsl:attribute>
	 	<xsl:apply-templates select="@*"/>	 
	</name>
</xsl:template>

<xsl:template match="@*">	
	<xsl:element name="{name()}" use-attribute-sets="NameAttributes">	  
		<xsl:value-of select="."/>
	</xsl:element>
</xsl:template>

<xsl:attribute-set name="NameAttributes" use-attribute-sets="NickNameAttributes">
		<xsl:attribute name="name">
		   <xsl:value-of select="name()"/>
		</xsl:attribute>	
</xsl:attribute-set>
		
<xsl:attribute-set name="NickNameAttributes">		 
		<xsl:attribute name="nickname">
		   <xsl:value-of select="."/>
		</xsl:attribute>	 
</xsl:attribute-set>

<xsl:template match="/" mode="i">
	<xsl:copy use-attribute-sets="NickNameAttributes"/>
</xsl:template>
	  

	 
</xsl:stylesheet>
