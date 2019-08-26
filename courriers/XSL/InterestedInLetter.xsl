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
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
                                <br /><p>
					@@You_were_specify@@</p>
				<br />
              <table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
					<tr>
						<th>@@orderNumber@@</th>
						<th>@@title@@</th>
					</tr>
					<tr>

						
						<td><xsl:value-of  select="notification_data/line_number"/></td>
						<td><xsl:value-of  select="notification_data/title"/></td>
                                                
					</tr></table>
				<p><br />@@message@@ <b><xsl:value-of  select="notification_data/message"/></b></p>
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