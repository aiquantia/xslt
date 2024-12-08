<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="company-page" page-height="11in" page-width="8.5in" margin="1in">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <!-- Company Information on a Separate Page -->
            <fo:page-sequence master-reference="company-page">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block text-align="center" space-after="20mm">
                        <fo:external-graphic src="{Profile/Company/Logo}" content-width="200%" scaling="uniform"/>
                        <fo:block font-size="24pt" font-weight="bold" space-before="5mm">
                            <xsl:value-of select="Profile/Company/Name"/>
                        </fo:block>
                        <fo:block font-size="14pt" font-weight="bold">
                            <fo:basic-link external-destination="{concat('url(', Profile/Company/Website, ')')}">
                                <xsl:value-of select="Profile/Company/Website"/>
                            </fo:basic-link>
                        </fo:block>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>

            <!-- Individual Pages for Each Person -->
            <xsl:for-each select="Profile/People/Person">
                <fo:page-sequence master-reference="company-page">
                    <fo:flow flow-name="xsl-region-body">
                        <fo:block border-bottom="2pt solid black" padding-bottom="5mm" margin-bottom="5mm">
                            <fo:block font-size="18pt" font-weight="bold">
                                <xsl:value-of select="Name"/>
                            </fo:block>
                            <fo:block font-size="12pt">
                                <xsl:value-of select="Role"/>
                            </fo:block>
                            <fo:block text-align="center">
                                <fo:external-graphic src="{Image}" content-height="100mm" content-width="auto"/>
                            </fo:block>
                        </fo:block>
                    </fo:flow>
                </fo:page-sequence>
            </xsl:for-each>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
