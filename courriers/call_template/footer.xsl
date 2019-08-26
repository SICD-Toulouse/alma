<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="salutation">

</xsl:template>
<xsl:template name="lastFooter">
	<table id="lastFooter">
	<xsl:attribute name="style">
		<xsl:call-template name="footerTableStyleCss" /> <!-- style.xsl -->
	</xsl:attribute>
	<tr>
	<xsl:for-each select="notification_data/organization_unit">

		<xsl:attribute name="style">
			<xsl:call-template name="listStyleCss" /> <!-- style.xsl -->
		</xsl:attribute>
			<td align="center"><xsl:value-of select="name"/>&#160;<xsl:value-of select="line1"/>&#160;<xsl:value-of select="line2"/>&#160;<xsl:value-of select="city"/>&#160;<xsl:value-of select="postal_code"/>&#160;<xsl:value-of select="country"/></td>

	</xsl:for-each>
	</tr>
	</table>
</xsl:template>
<xsl:template name="contactUs">
	<table id="contactUs" align="left">
	<tr>
	<td align="left">
	<a>
                        <xsl:attribute name="href">
                          http://bibliotheques.univ-toulouse.fr/unequestion
                        </xsl:attribute>
						@@contact_us@@
					</a>
	</td>
</tr>
	</table>
</xsl:template>
<xsl:template name="myAccount">
	<table id="myAccount" align="right">
	<tr>
	<td align="right">
		<xsl:for-each select="/notification_data/receivers/receiver/user">
				<xsl:choose>
								<xsl:when test="campus_code='UT1'"><a href="https://catalogue-archipel.univ-toulouse.fr/primo-explore/account?vid=33UT1_VU1">Accéder à mon compte</a></xsl:when>
								<xsl:when test="campus_code='UT2J'"><a href="https://catalogue-archipel.univ-toulouse.fr/primo-explore/account?vid=33UT2_VU1">Accéder à mon compte</a></xsl:when>
								<xsl:when test="campus_code='UPS'"><a href="https://catalogue-archipel.univ-toulouse.fr/primo-explore/account?vid=33UT3_VU1">Accéder à mon compte</a></xsl:when>
								<xsl:when test="campus_code='INP'"><a href="https://catalogue-archipel.univ-toulouse.fr/primo-explore/account?vid=33INPT_VU1">Accéder à mon compte</a></xsl:when>
								<xsl:when test="campus_code='INSA'"><a href="https://catalogue-archipel.univ-toulouse.fr/primo-explore/account?vid=33INSA_VU1">Accéder à mon compte</a></xsl:when>
								<xsl:when test="campus_code='ISAE'"><a href="https://catalogue-archipel.univ-toulouse.fr/primo-explore/account?vid=33ISAE_VU1">Accéder à mon compte</a></xsl:when>
								<xsl:when test="campus_code='CHAMP'"><a href="https://catalogue-archipel.univ-toulouse.fr/primo-explore/account?vid=33INUC_VU1">Accéder à mon compte</a></xsl:when>
								<xsl:when test="campus_code='ENAC'"><a href="https://catalogue-archipel.univ-toulouse.fr/primo-explore/account?vid=33ENAC_VU1">Accéder à mon compte</a></xsl:when>
								<xsl:when test="campus_code='MINALBI'"><a href="https://catalogue-archipel.univ-toulouse.fr/primo-explore/account?vid=33MINALBI_VU1">Accéder à mon compte</a></xsl:when>
								<xsl:otherwise>
									Connectez-vous à votre compte personnel depuis Archipel
								</xsl:otherwise>
							</xsl:choose>
					</xsl:for-each>
	</td>
</tr>
	</table>
</xsl:template>



</xsl:stylesheet>