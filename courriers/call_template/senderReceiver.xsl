<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template name="senderReceiver">
		<table width="100%">
			<tr>
				<td width="40%">
					<xsl:for-each select="notification_data/organization_unit">
						<table>
							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>
							<tr>			  
								<td><br/><br/><br/>
									<xsl:value-of select="name"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="address/line1"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="address/line2"/>
								</td>
							</tr>
                                                         <tr>
								<td>
									<xsl:value-of select="address/line3"/>
								</td>
							</tr>
                                                         <tr>
								<td>
									<xsl:value-of select="address/line4"/>
								</td>
							</tr>
                                                        <tr>
								<td><xsl:value-of select="address/postal_code"/> <xsl:value-of select="address/city"/></td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="address/country_display"/>
								</td>
							</tr>
						</table>
					</xsl:for-each>
				</td>
				<td width="50%" align="left" style="padding-right: 10%;padding-left: 10%;">
					<xsl:choose>
						<xsl:when test="notification_data/user_for_printing">
							<table cellspacing="0" border="0">
								<xsl:attribute name="style">
									<xsl:call-template name="listStyleCss"/>
									<!-- style.xsl -->
								</xsl:attribute>
								<xsl:choose>
									<xsl:when test="notification_data/user_for_printing/name =''"/>
									<xsl:otherwise>
										<tr>
											<td>
												<b><br/><br/><br/>
													<xsl:value-of select="notification_data/user_for_printing/name"/>
												</b>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="notification_data/user_for_printing/address1 =''"/>
									<xsl:otherwise>
										<tr>
											<td>
												<xsl:value-of select="notification_data/user_for_printing/address1"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="notification_data/user_for_printing/address2 =''"/>
									<xsl:otherwise>
										<tr>
											<td>
												<xsl:value-of select="notification_data/user_for_printing/address2"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="notification_data/user_for_printing/address3 =''"/>
									<xsl:otherwise>
										<tr>
											<td>
												<xsl:value-of select="notification_data/user_for_printing/address3"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="notification_data/user_for_printing/address4 =''"/>
									<xsl:otherwise>
										<tr>
											<td>
												<xsl:value-of select="notification_data/user_for_printing/address4"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:choose>
									<xsl:when test="notification_data/user_for_printing/address5 =''"/>
									<xsl:otherwise>
										<tr>
											<td>
												<xsl:value-of select="notification_data/user_for_printing/address5"/>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<tr>
									<td><xsl:value-of select="notification_data/user_for_printing/postal_code"/> <xsl:value-of select="notification_data/user_for_printing/city"/></td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/user_for_printing/state"/>
										<xsl:value-of select="notification_data/user_for_printing/country"/>
									</td>
								</tr>
							</table>
						</xsl:when>
						<xsl:when test="notification_data/receivers/receiver/user">
							<xsl:for-each select="notification_data/receivers/receiver/user">
								<table>
									<xsl:attribute name="style">
										<xsl:call-template name="listStyleCss"/>
										<!-- style.xsl -->
									</xsl:attribute>
									<tr>
										<td>
											<b><br/><xsl:value-of select="last_name"/> <xsl:value-of select="first_name"/></b>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:value-of select="user_address_list/user_address/line1"/>
										</td>
									</tr>
									<tr>
										<td>
											<xsl:value-of select="user_address_list/user_address/line2"/>
										</td>
									</tr>
									<tr>
										<td><xsl:value-of select="user_address_list/user_address/postal_code"/> <xsl:value-of select="user_address_list/user_address/city"/></td>
									</tr>
									<tr>
										<td>
											<xsl:value-of select="user_address_list/user_address/state_province"/>
											<xsl:value-of select="user_address_list/user_address/country_display"/>
										</td>
									</tr>
								</table>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>