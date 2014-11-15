<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">


<xsl:template match="*[@xlink:type='simple']">  
 	<xsl:variable name="myvar" select="@xlink:href" />
	<script>
	function b(variable)
	{
		Simple(variable);
	}
	</script>
	<a href="#" id="dummyId" onclick="b(this.id)"><xsl:apply-templates/></a>
	<script>
		document.getElementById('dummyId').id = '<xsl:value-of select="$myvar"></xsl:value-of>';
		<!--alert(document.getElementById('<xsl:value-of select="$myvar"></xsl:value-of>') );-->
	</script>
	<xsl:for-each select="@*">
  	<!--<script type="text/javascript" src="functions.js">-->
	<script>
            populateAttr('<xsl:value-of select="$myvar"/>','<xsl:value-of select="name()" />','<xsl:value-of select="." />');  
            getAttribute('<xsl:value-of select="$myvar"/>','<xsl:value-of select="name()" />');
	</script>
	</xsl:for-each>
</xsl:template>


<xsl:template match="*[@xlink:type='extended']">
	<xsl:variable name="lab" select="@label"/>
	<xsl:variable name="one">
		<xsl:for-each select="*[@xlink:type='locator']">

			<xsl:call-template name="recursive">
				<xsl:with-param name="value" select="@xlink:href"/>
			</xsl:call-template>


		</xsl:for-each>
	</xsl:variable>	
	<xsl:value-of select="$one"/>
	<a href="#" id="dummyId" onClick="testClick(this.id)"><xsl:value-of select="$lab"/></a>
	<script>
		document.getElementById('dummyId').id = '<xsl:value-of select="$one"></xsl:value-of>';
	</script>
	<xsl:for-each select="@*">
  	<!--<script type="text/javascript" src="functions.js">-->
	<script>
            populateAttr('<xsl:value-of select="$one"/>','<xsl:value-of select="name()" />','<xsl:value-of select="." />');  
	</script>
	</xsl:for-each>
</xsl:template>

<xsl:template name="recursive">
<xsl:param name="value" select="."/>
<xsl:value-of select="concat(concat('',$value),',')"/>
</xsl:template>


</xsl:stylesheet>
