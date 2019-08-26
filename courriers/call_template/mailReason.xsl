<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template name="toWhomIsConcerned">
		<table cellspacing="0" cellpadding="5" border="0">
			<tr>
				<td>
					<xsl:for-each select="notification_data">
						<h3>
							<xsl:choose><!--debut de modification 02/02/2018-->
								<xsl:when test="//item_loan/* =51"> Monsieur <xsl:value-of select="receivers/receiver/user/last_name"/>,</xsl:when>
								<xsl:when test="//item_loan/* =52"> Madame <xsl:value-of select="receivers/receiver/user/last_name"/>,</xsl:when>
								<xsl:otherwise>
									<td>@@dear@@ <xsl:value-of select="receivers/receiver/user/last_name"/>,</td>
								</xsl:otherwise>
							</xsl:choose><!--debut de modification 02/02/2018-->
						</h3>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>