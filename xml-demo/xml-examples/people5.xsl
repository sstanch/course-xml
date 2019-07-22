<?xml version="1.0" encoding="windows-1252"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">  
	<xsl:for-each select="person/name">
		 <xsl:call-template name="name">
		 	<xsl:with-param name="first"><xsl:value-of select="ime"/></xsl:with-param>
		 	<xsl:with-param name="last"><xsl:value-of select="familia"/></xsl:with-param>
		 </xsl:call-template>
	</xsl:for-each>
</xsl:template>


<xsl:template name="name">
	<xsl:param name="first"><xsl:value-of select="first"/></xsl:param>
	<xsl:param name="last"><xsl:value-of select="last"/></xsl:param>
  <html>
  <body>
    <h2>Person</h2>
	First name: <xsl:value-of select="$first"/> <br/>
	Last name: <xsl:value-of select="$last"/> 
  </body>
  </html>
</xsl:template>
	 
</xsl:stylesheet>
