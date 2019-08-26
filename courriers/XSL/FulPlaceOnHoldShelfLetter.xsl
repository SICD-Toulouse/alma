<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:include href="recordTitle.xsl" />

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

				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->



					<div class="messageArea">
				<div class="messageBody">
					<table cellspacing="0" cellpadding="5" border="0">
						<tr>
							<td>@@following_item_requested_on@@ <xsl:value-of select="notification_data/request/create_date"/>, @@can_picked_at@@ <strong><xsl:value-of select="notification_data/request/assigned_unit_name"/></strong>.</td>
						</tr>

						<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
						<tr>
							<td>
							 @@note_item_held_until@@ <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>.
							 </td>
						</tr>
							</xsl:if>
						<tr>
							<td><xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl --></td>
						</tr>
						</table>
				</div>
			</div>
				<br />
				<table>

						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>

				</table>




				<!-- footer.xsl -->
<xsl:call-template name="lastFooter" />
         <xsl:call-template name="myAccount" />
		<xsl:call-template name="contactUs" />
			</body>
	</html>
	</xsl:template>



</xsl:stylesheet>
