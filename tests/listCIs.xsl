<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  >
<xsl:output method="text"/>

  <xsl:param name="type"/>
  
  <xsl:template match="configItem">
    <xsl:if test="name(..) = $type">
      <xsl:value-of select="./name"/>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
