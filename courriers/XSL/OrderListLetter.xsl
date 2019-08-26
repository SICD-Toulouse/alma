<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />
<xsl:decimal-format name="france" decimal-separator="." grouping-separator=" "/>
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

				<xsl:for-each select="notification_data/letter_texts">
				<table cellspacing="0" cellpadding="5" border="0">
					<tr>
						<td>@@place_order_introduction@@:</td>
					</tr>
				</table>
				<br />

				</xsl:for-each>
				<xsl:for-each select="notification_data">
			
	                   <table>
                               <tr>
                               <td><b>@@letterName@@ : </b><xsl:value-of select="/notification_data/po/number"/></td>
                              </tr>
					<tr>
						<td><b>@@vendor_account@@: </b><xsl:value-of select="/notification_data/po/vendor_account/description"/></td>
					</tr>
					<tr>
						<td><b>@@shipping_address@@: </b><xsl:value-of select="/notification_data/po/ship_to_address/line1"/>&#160;<xsl:value-of select="/notification_data/po/ship_to_address/line2"/>&#160;<xsl:value-of select="/notification_data/po/ship_to_address/line3"/>&#160;<xsl:value-of select="/notification_data/po/ship_to_address/postal_code"/>&#160;<xsl:value-of select="/notification_data/po/ship_to_address/city"/>&#160;<xsl:value-of select="/notification_data/po/ship_to_address/country"/></td>
					</tr>
					<tr>
						<!-- <td><b>@@shipping_method@@: </b><xsl:value-of select="/notification_data/po/shipping_method"/></td> -->
					</tr>
					<tr>
						<td><b>@@billing_address@@: </b><xsl:value-of select="/notification_data/po/bill_to_address/line1"/>&#160;<xsl:value-of select="/notification_data/po/bill_to_address/line2"/>&#160;<xsl:value-of select="/notification_data/po/bill_to_address/line3"/>&#160;<xsl:value-of select="/notification_data/po/bill_to_address/postal_code"/>&#160;<xsl:value-of select="/notification_data/po/bill_to_address/city"/>&#160;<xsl:value-of select="/notification_data/po/bill_to_address/country"/></td>
					</tr>

<tr>
<td><b>@@note@@ : </b> <xsl:value-of select="po/po_line_list/po_line/vendor_note"/></td>
</tr>

					<xsl:if test="/notification_data/po/erp_number != ''">
						<tr>
							<td><b>@@erp_number@@: </b><xsl:value-of select="/notification_data/po/erp_number"/></td>
						</tr>
					</xsl:if>
				</table>
				</xsl:for-each>
				<br />


				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
					<tr>
						<th>@@po_line_number@@</th>
						<th>@@title@@</th> 
						<th>@@quantity@@</th>
						<th align="right">@@price@@</th>
						
					</tr>
					<xsl:for-each select="notification_data/po/po_line_list/po_line">
					<tr>

						<td><xsl:value-of select="line_reference"/></td>
						<td><xsl:value-of select="item_description"/></td>
						<td><center><xsl:value-of select="total_quantity"/></center></td>
						<td align="right"><xsl:value-of select="total_price_compose/sum"/>&#160;<xsl:value-of select="total_price_compose/currency"/></td>
                                                
					</tr>
					</xsl:for-each>
					<tr align="right">
						<th COLSPAN="3">Total ligne(s) de commande :</th>
						<td COLSPAN="1"><xsl:value-of select="count(notification_data/po/po_line_list/po_line/line_reference)"/></td>
					</tr>
					
					<tr align="right">
						<th COLSPAN="3">Total exemplaire(s):</th>
						<td COLSPAN="1"><xsl:value-of select="sum(notification_data/po/po_line_list/po_line/total_quantity)"/></td> 

					</tr>
					
					
					<tr align="right">
						<th COLSPAN="3">Prix total: </th>
						<td COLSPAN="1" width="120px"><b><xsl:value-of select="format-number(sum(notification_data/po/po_line_list/po_line/total_price_compose/sum), '# ###.00','france')"/>&#160;<xsl:value-of select="notification_data/po/currency"/></b></td>
					</tr>
				</table>

   
<br/>
<br/>
				<table>

						<tr><td>@@sincerely@@,</td></tr>
						<tr><td>@@department@@</td></tr>

				</table>


				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>