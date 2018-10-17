<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:marc="http://www.loc.gov/MARC21/slim" xmlns:oai="http://www.openarchives.org/OAI/1.1/oai_marc" version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="oai">
	<xsl:template match="oai_marc">
		<marc:record xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

				<xsl:value-of select="@status"/>
				<xsl:value-of select="@type"/>
				<xsl:value-of select="@level"/>				
				<xsl:value-of select="@encLvl"/>
				<xsl:value-of select="@catForm"/>				
			<xsl:apply-templates select="//fixfield[@id='LDR']"/>
			<xsl:apply-templates select="fixfield[@id!='LDR']|varfield"/>
		</marc:record>
	</xsl:template>

	<!-- delete the session-id -->
	<xsl:template match="session-id">
	</xsl:template>	

	<xsl:template match="//fixfield[@id='LDR']">
		<xsl:element name="marc:leader">
			<xsl:value-of
				select="substring(text(),1,string-length(text()))"/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="fixfield[@id!='LDR']">
		<xsl:element name="marc:controlfield">
			<xsl:call-template name="id2tag"/>
			<xsl:value-of
				select="substring(text(),1,string-length(text()))"/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="varfield">
		<xsl:element name="marc:datafield">
			<xsl:call-template name="id2tag"/>

			<xsl:attribute name="ind1">
				<xsl:call-template name="idBlankSpace">
					<xsl:with-param name="value" select="@i1"/>
				</xsl:call-template>
			</xsl:attribute>

			<xsl:attribute name="ind2">
				<xsl:call-template name="idBlankSpace">
					<xsl:with-param name="value" select="@i2"/>
				</xsl:call-template>
			</xsl:attribute>

			<xsl:apply-templates select="subfield"/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="subfield">
		<xsl:element name="marc:subfield">
			<xsl:attribute name="code">
				<xsl:value-of select="@label"/>
			</xsl:attribute>
			<xsl:value-of select="text()"/>
		</xsl:element>
	</xsl:template>

	<xsl:template name="id2tag">
		<xsl:attribute name="tag">
			<xsl:variable name="tag" select="@id"/>
			<xsl:choose>
				<xsl:when test="string-length($tag)=1">
					<xsl:text>00</xsl:text>
					<xsl:value-of select="$tag"/>
				</xsl:when>
				<xsl:when test="string-length($tag)=2">
					<xsl:text>0</xsl:text>
					<xsl:value-of select="$tag"/>
				</xsl:when>
				<xsl:when test="string-length($tag)=3">
					<xsl:value-of select="$tag"/>
				</xsl:when>
			</xsl:choose>
		</xsl:attribute>
	</xsl:template>

	<xsl:template name="idBlankSpace">
		<xsl:param name="value"/>
		<xsl:choose>
			<xsl:when test="string-length($value)=0">
				<xsl:text> </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$value"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c)1998-2002 eXcelon Corp.
<metaInformation>
<scenarios/><MapperInfo srcSchemaPath="oai_marc.xsd" srcSchemaRoot="oai_marc" srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
</metaInformation>
-->