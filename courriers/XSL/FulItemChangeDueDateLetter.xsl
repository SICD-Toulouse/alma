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
				<div class="messageArea">
          <div class="messageBody">

			<table cellspacing="0" cellpadding="5" border="0">
              <tr>
              	<td>
	                					<xsl:if test="notification_data/message='DUE_DATE_CHANGE_ONLY'">
						<b>@@message@@</b>
					</xsl:if>
					
					<br/><br/>
                </td>
              </tr>

                <tr>
                <td>
                	<table cellpadding="5" class="listing">
						<xsl:attribute name="style">
							<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
						</xsl:attribute>
						<tr>
							<th>@@title@@</th>
							<th>@@author@@</th>
							<th>@@old_due_date@@</th>
							<th>@@new_due_date@@</th>
							<th>@@library@@</th>
						</tr>

                		<xsl:for-each select="notification_data/item_loans/item_loan">
						<tr>
							<td><xsl:value-of select="title"/></td>
							<td><xsl:value-of select="author"/></td>
							<td><xsl:value-of select="old_due_date_str"/></td>
							<td><xsl:value-of select="new_due_date_str"/></td>
							<td><xsl:value-of select="library_name"/></td>
						</tr>
						</xsl:for-each>

                	</table>
                </td>
              </tr>
             </table>

			<br />
			<table>
				<tr><td>@@sincerely@@</td></tr>
				<tr><td>@@department@@</td></tr>
			</table>

          </div>
        </div>

				<!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
         <xsl:call-template name="myAccount" />
		<xsl:call-template name="contactUs" />
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>