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
		 <xsl:for-each select="@*"> 
		 <td>	 
			 <xsl:variable name="bold">
				<bd>xyz</bd>
			 </xsl:variable>
      		<xsl:copy-of select="$bold"/>
		 </td>
		 </xsl:for-each>
		 </tr>
      </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>
	 
</xsl:stylesheet>
