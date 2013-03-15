<xsl:stylesheet version = '1.0'
    xmlns="http://docbook.org/ns/docbook"
    xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns:xlink="http://www.w3.org/1999/xlink"
     >

<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"
    />

<xsl:template match="*">
    <xsl:choose>
        <xsl:when test="local-name() = 'legalnotice'">
            <legalnotice>
                <xsl:copy-of select="@*"/>
                <xsl:call-template name="nc_legal_notice" />
            </legalnotice>
        </xsl:when>
        <xsl:otherwise>
            <xsl:element name="{local-name()}">
                <xsl:copy-of select="@*" />
                <xsl:apply-templates />
            </xsl:element>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="nc_legal_notice">
    <para>
        This document is copyrighted by Shlomi Fish
        under the
        <link xlink:href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Creative
            Commons Attribution
            Noncommercial Share-Alike (Unported) License (CC-by-nc-sa) version
            3.0</link>
        (or at your option, any greater version).
    </para>
    <para>
        Note that the original text of the story and its DocBook source is
        under "CC-by-sa", but the author relicensed the final EPUB to
        "CC-by-nc-sa" upon publishing.
    </para>
</xsl:template>

</xsl:stylesheet>
