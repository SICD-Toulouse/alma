<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->
				<br />

				<table cellspacing="0" cellpadding="5" border="0"  style="float:left">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
					<tr>
						<td>
							<h>@@dear@@</h><br /><br />
							<h>@@please_find_below@@</h><br /><br />
						</td>
					</tr>

					<xsl:if test="notification_data/non_active_requests/ful_request_interpated">
					<tr>
						<td>
							<table>
							<xsl:attribute name="style">
								<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
							</xsl:attribute>
								<tr>
								<xsl:attribute name="style">
									<xsl:call-template name="headerTableStyleCss" /> <!-- style.xsl -->
								</xsl:attribute>
									<th>@@title@@</th>
									<th>@@place_in_queue@@</th>
									<th>@@pickup_location@@</th>
								</tr>
								<xsl:for-each select="notification_data/non_active_requests/ful_request_interpated">
								<tr>
									<td><xsl:value-of select="title_display"/></td>
									<td><xsl:value-of select="place_in_queue"/></td>
									<td><xsl:value-of select="pickup_location_display"/></td>
								</tr>
								</xsl:for-each>
							</table><hr/><br />
						</td>
					</tr>
					</xsl:if>
					<xsl:if test="notification_data/process_requests/ful_request_interpated">
					<tr>
						<td>
							<table>
							<xsl:attribute name="style">
								<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
							</xsl:attribute>
								<tr>
								<xsl:attribute name="style">
									<xsl:call-template name="headerTableStyleCss" /> <!-- style.xsl -->
								</xsl:attribute>
									<th>@@title@@</th>
									<th>@@status@@</th>
									<th>@@pickup_location@@</th>
								</tr>

								<xsl:for-each select="notification_data/process_requests/ful_request_interpated">
								<tr>
									<td><xsl:value-of select="title_display"/></td>
									<td><xsl:value-of select="request_status_display"/></td>
									<td><xsl:value-of select="pickup_location_display"/></td>
								</tr>
								</xsl:for-each>
							</table><hr/><br />
						</td>
					</tr>
					</xsl:if>

					<xsl:if test="notification_data/hold_shelf_requests/ful_request_interpated">
					<tr>
						<td>
							<table>
							<xsl:attribute name="style">
								<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
							</xsl:attribute>
								<tr>
								<xsl:attribute name="style">
									<xsl:call-template name="headerTableStyleCss" /> <!-- style.xsl -->
								</xsl:attribute>
									<th>@@title@@</th>
									<th>@@status@@</th>
									<th>@@pickup_location@@</th>
								</tr>
								<xsl:for-each select="notification_data/hold_shelf_requests/ful_request_interpated">
								<tr>
									<td><xsl:value-of select="title_display"/></td>
									<td><xsl:value-of select="request_status_display"/></td>
									<td><xsl:value-of select="pickup_location_display"/></td>
								</tr>
								</xsl:for-each>
							</table><hr/><br />
						</td>
					</tr>
					</xsl:if>
				</table>

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
                       <xsl:call-template name="myAccount" />
		<xsl:call-template name="contactUs" />
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>