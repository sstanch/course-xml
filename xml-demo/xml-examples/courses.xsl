<?xml version="1.0" encoding="ISO-8859-1" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <html>
      <body>
        <h2>IPT Courses</h2>
        <table border="3" bordercolor="blue">
          <tr>
            <th width="20%">Course Name</th>
            <th width="15%">Domain</th>
            <th width="15%">Instructor</th>
            <th width="10%">Course Type</th>
            <th>Modules</th>
          </tr>
          <xsl:for-each select="courses/course">
            <tr>
              <td>
                <xsl:value-of select="code" />
                -
                <xsl:value-of select="name" />
              </td>
              <td>
                <xsl:value-of select="domain" />
              </td>
              <td>
                <xsl:value-of select="instructor/first-name" />
                <xsl:value-of select="instructor/family-name" />
                <br />
                <b>
                  <i>
                    <xsl:value-of select="instructor/email" />
                  </i>
                </b>
              </td>
              <td>
                <xsl:value-of select="course-type" />
              </td>
              <td>
                <table>
                  <xsl:for-each select="modules/module">
                    <tr>
                      <td>
                        <xsl:value-of select="name" />
                      </td>
                      <td>
                        Lectures:
                        <xsl:value-of select="hours/lectures" />
                        h - 
						Laboratories:
                        <xsl:value-of select="hours/labs" />
                        h
                      </td>
                      <td>
                        <xsl:value-of select="certificate-type" />
                      </td>
                      <td>
                        <xsl:value-of select="estimation-type" />
                      </td>
                    </tr>
                  </xsl:for-each>
                </table>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>