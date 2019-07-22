<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Edited with XML Spy v2007 (http://www.altova.com) -->
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <body>
    <h2>My CD Collection</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>Title</th>
        <th>Artist</th>
        <th>Year</th>
		<th>Price</th>
	</tr>
	  <xsl:for-each select="CATALOG/CD[YEAR &lt; 1990]">
	  <xsl:sort select="YEAR"/>
	  <xsl:choose>
  		<xsl:when test="PRICE &lt; 9.50">
	      <tr>
	        <td><xsl:value-of select="TITLE"/></td>
	        <td><xsl:value-of select="ARTIST"/></td>
        	<td><xsl:value-of select="YEAR"/></td>
        	<td><xsl:value-of select="PRICE"/></td>
	      </tr>	   
	  	</xsl:when>
	  	<xsl:otherwise>
	      <tr style="background-color:#FF6600">
	        <td><xsl:value-of select="TITLE"/></td>
	        <td><xsl:value-of select="ARTIST"/></td>
			<td><xsl:value-of select="YEAR"/></td>
			<td><xsl:value-of select="PRICE"/></td>
	      </tr>	   
	  	</xsl:otherwise> 
	  </xsl:choose>
	  </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
