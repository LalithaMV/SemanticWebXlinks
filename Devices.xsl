<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">

<xsl:import href="import.xsl"/>
<xsl:template match="/">
<xsl:apply-templates/>
</xsl:template>
</xsl:stylesheet>
<!--<xsl:template match="/">
  <xsl:apply-imports/>
</xsl:template>

<xsl:template match="/">
<html>
<body>
<ul>  
<xsl:for-each select="accessory/title">
<li><xsl:value-of select="Freq"/></li>
</xsl:for-each>
</ul>
<xsl:apply-templates/>
</body>
<div id="xslDiv" />
</html>
</xsl:template>
</xsl:stylesheet>-->
