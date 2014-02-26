<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
    
    <xsl:template match="/">
        <xsl:for-each select="*">
            <xsl:call-template name="printout">
            </xsl:call-template>
        </xsl:for-each>

    </xsl:template> 
    
    <xsl:template name="printout">
        
        <!-- <xsl:value-of select="name(.)"/> -->
        
        <xsl:for-each select="*">
            
            <xsl:if test="count(.) &gt; 0">
                <xsl:call-template name="printout">
                </xsl:call-template>
            </xsl:if>
            
            <xsl:variable name="nodeName" select="./@name"></xsl:variable>
            
            <xsl:if test="$nodeName != ''">
                <xsl:text>[</xsl:text><xsl:value-of select="./@name"/><xsl:text>]</xsl:text>
                <xsl:text>=</xsl:text>
                <xsl:value-of select="text()"/>
                <xsl:text>,</xsl:text>    
            </xsl:if>
            
            <!--
                Interesting but I don't really need this
                <xsl:if test="not(contains(name(.), 'header') or contains(name(.), 'body'))">
                </xsl:if>
            -->
            
        </xsl:for-each>
    </xsl:template>
    
    
</xsl:stylesheet>



