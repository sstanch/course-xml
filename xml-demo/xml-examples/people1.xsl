<?xml version="1.0" encoding="windows-1252"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
    <h2>My CD Collection</h2> 
    <table border="1">
      <tr bgcolor="#9acd32">
        <th align="left">First Name</th> 
        <th align="left">Middle Name</th> 
        <th align="left">Last Name</th> 
      </tr>
      <xsl:for-each select="people/name">
      <tr>
        <td><xsl:value-of select="@first" /></td>
        <td><xsl:value-of select="@middle" /></td>
        <td><xsl:value-of select="@last" /></td>
      </tr>
      </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>

<xsl:template name="bold">
	<b><xsl:value-of select="."/></b>
</xsl:template>
</xsl:stylesheet>
