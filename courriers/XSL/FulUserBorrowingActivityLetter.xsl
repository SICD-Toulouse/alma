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
		<xsl:choose><!--debut de modification 02/02/2018-->
			<xsl:when test="/notification_data/item_loans/item_loan/barcode='quitus'"><!--Condition pour vérifier s'il y a un quitus -->
				<html>
					<head>
						<xsl:call-template name="generalStyle-sans-hover" />
					</head>
					<body>
						<xsl:attribute name="style">
							<xsl:call-template name="bodyStyleCss" />
							<!-- style.xsl -->
						</xsl:attribute>

						<div>
							<div>
								<table border="2" rules="none" cellpadding="10">
									<tr>
									<xsl:for-each select="notification_data">
										<table border="0">
										<td align="center" width="200">
														<img src="http://bibliotheques.univ-toulouse.fr/sites/bibliotheques.univ-toulouse.fr/files/imagecache/Image200x200/ut1.jpg" width="100" text-align="center"/><br/><br/>
														<img src="http://bibliotheques.univ-toulouse.fr/sites/bibliotheques.univ-toulouse.fr/files/imagecache/Image200x200/ut2j.jpg" width="150" text-align="center"/><br/><br/>
														<img src="http://bibliotheques.univ-toulouse.fr/sites/bibliotheques.univ-toulouse.fr/files/imagecache/Image200x200/ut3.jpg" width="150" text-align="center"/><br/><br/>
														<img src="http://bibliotheques.univ-toulouse.fr/sites/bibliotheques.univ-toulouse.fr/files/imagecache/Image200x200/INPT.jpg" width="100" text-align="center"/><br/><br/>
														<img src="http://bibliotheques.univ-toulouse.fr/sites/bibliotheques.univ-toulouse.fr/files/imagecache/Image200x200/insa.jpg" width="150" text-align="center"/><br/><br/>
														<img src="http://bibliotheques.univ-toulouse.fr/sites/bibliotheques.univ-toulouse.fr/files/imagecache/Image200x200/champ.jpg" width="100" text-align="center"/><br/><br/>
														<img src="http://bibliotheques.univ-toulouse.fr/sites/bibliotheques.univ-toulouse.fr/files/imagecache/Image200x200/enac.jpg" width="100" text-align="center"/><br/><br/>
														<img src="http://bibliotheques.univ-toulouse.fr/sites/bibliotheques.univ-toulouse.fr/files/imagecache/Image200x200/mines-albi.jpg" width="150" text-align="center"/><br/><br/>
										</td>		
											<td width="450">
											<h1 align="center"><b>QUITUS DE BIBLIOTHEQUES</b></h1>
														<br/><br/><br/><br/><br/><br/>
															Le Service Inter-établissements de coopération documentaire de Toulouse certifie que :<br/><br/><br/>
													<xsl:choose>
																<xsl:when test="//item_loan/* =51">
																	<br/>Monsieur&#160;<b> <xsl:value-of select="receivers/receiver/user/last_name"/>&#160;<xsl:value-of select="receivers/receiver/user/first_name"/></b>,</xsl:when>
																<xsl:when test="//item_loan/* =52">
																	<br/>Madame&#160;<b><xsl:value-of select="receivers/receiver/user/last_name"/>&#160;<xsl:value-of select="receivers/receiver/user/first_name"/></b>,</xsl:when>
																<xsl:otherwise>
																	<br/>Melle,&#160;Mme,&#160;M.&#160;:&#160;<b><xsl:value-of select="receivers/receiver/user/last_name"/>&#160;<xsl:value-of select="receivers/receiver/user/first_name"/></b>,
																</xsl:otherwise>
															</xsl:choose>
															<br/>

															<br/>N° UNR&#160;: <xsl:for-each select="user_for_printing/identifiers/code_value"><xsl:if test="code='OTHER_ID_3'"><b><xsl:value-of select="value"/></b></xsl:if></xsl:for-each><br />
															<br/>Demeurant à : <b><xsl:value-of select="receivers/receiver/user/user_address_list/user_address/line1"/>,								
																<xsl:value-of select="receivers/receiver/user/user_address_list/user_address/line2"/>,									
																<xsl:value-of select="receivers/receiver/user/user_address_list/user_address/postal_code"/>&#160;
																<xsl:value-of select="receivers/receiver/user/user_address_list/user_address/city"/>&#160;
																<xsl:value-of select="receivers/receiver/user/user_address_list/user_address/state_province"/>
																<xsl:value-of select="receivers/receiver/user/user_address_list/user_address/country"/></b>&#160;

															<br/><br /><br/><br/>
													Est en règle auprès des établissements membres du réseau des bibliothèques de l'Université de Toulouse.<br/><br/><br/>
													Fait pour valoir et servir ce que de droit,<br/><br/><br/><br/>
													A Toulouse, le:  <b><xsl:value-of select="general_data/current_date"/></b><br/><br/><br/><br/>
															<p align="center"><b>La Directrice du SICD de Toulouse</b><br/><br/><br/><br/></p>
												
													</td>
													</table>
									</xsl:for-each>
								</tr>
										
								</table>
							</div>
						</div>
					</body>
				</html> 
			</xsl:when><!--fin de quitus -->
			<xsl:otherwise>
				<html>
					<head>
						<xsl:call-template name="generalStyle" />
					</head>
					<body>
						<xsl:attribute name="style">
							<xsl:call-template name="bodyStyleCss" />
							<!-- style.xsl -->
						</xsl:attribute>

						<xsl:call-template name="head" />
						<!-- header.xsl -->
						<xsl:call-template name="senderReceiver" />
						<!-- SenderReceiver.xsl -->

						<br />
						<xsl:call-template name="toWhomIsConcerned" />
						<!-- mailReason.xsl -->


						<div class="messageArea">
							<div class="messageBody">

								<table cellspacing="0" cellpadding="5" border="0">
									<xsl:if test="notification_data/item_loans/item_loan or notification_data/overdue_item_loans/item_loan">
										<tr>
											<td>
												<b>@@reminder_message@@</b>
											</td>
										</tr>									
										<xsl:if test="notification_data/overdue_loans_by_library/library_loans_for_display">
											<tr>
												<td>
													<b>@@overdue_loans@@<br/></b>

													<xsl:for-each select="notification_data/overdue_loans_by_library/library_loans_for_display">

														<table cellpadding="5" class="listing">
															<xsl:attribute name="style">
																<xsl:call-template name="mainTableStyleCss" />
															</xsl:attribute>
															<tr align="center" bgcolor="#f5f5f5">
																<td colspan="6">
																	<h3>
																		<xsl:value-of select="organization_unit/name" />
																	</h3>
																</td>
															</tr>
															<tr>
																<th>@@title@@</th>
																<th>@@due_date@@</th>
															</tr>

															<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
																<tr>
																	<td>
																		<xsl:value-of select="title"/>
																	</td>
																	<td>
																		<xsl:value-of select="due_date"/>
																	</td>
																</tr>
															</xsl:for-each>
														</table>
														<hr/>
														<br/>
													</xsl:for-each></td>
											</tr>
										</xsl:if>
									</xsl:if>
									<xsl:if test="notification_data/loans_by_library/library_loans_for_display">

										<tr>
											<td>
												<b>@@loans@@</b>

												<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">

													<table cellpadding="5" class="listing">
														<xsl:attribute name="style">
															<xsl:call-template name="mainTableStyleCss" />
														</xsl:attribute>
														<tr align="center" bgcolor="#f5f5f5">
															<td colspan="4">
																<h3>
																	<xsl:value-of select="organization_unit/name" />
																</h3>
															</td>
														</tr>
														<tr>
															<th>@@title@@</th>
															<th>@@due_date@@</th>
														</tr>

														<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
															<tr>
																<td>
																	<xsl:value-of select="title"/>
																</td>
																<td>
																	<xsl:value-of select="due_date"/>
																</td>
															</tr>
														</xsl:for-each>
													</table>
													<hr/>
													<br/>
												</xsl:for-each></td>
										</tr>
									</xsl:if>

								</table>

								<table>
									<tr>
										<td>@@sincerely@@</td>
									</tr>
									<tr>
										<td>@@department@@</td>
									</tr>
								</table>

							</div>
						</div>

						<!-- footer.xsl -->
						<xsl:call-template name="lastFooter" />
						<xsl:call-template name="myAccount" />
						<xsl:call-template name="contactUs" />
					</body>
				</html></xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>