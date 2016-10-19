<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="html" uri="http://struts.apache.org/tags-html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested"%>
<%@page import="java.sql.*" %>
<%@page import="javax.naming.*" %>
<%@page import="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><bean:message key="show.contact" /></title>
<html:base />
</head>
<body>
		<html:errors />
		<table>
			<tr>
				<td><bean:message key="add.contact.form.id"/></td>
				<td><bean:message key="add.contact.form.lastname"/></td>
				<td><bean:message key="add.contact.form.firstname"/></td>
				<td><bean:message key="add.contact.form.email"/></td>
			</tr>

			<%
				try{
					final Context lContext = new InitialContext();
					final DataSource lDataSource = (DataSource) lContext.lookup("java:comp/env/jdbc/gestioncontacts");
					final Connection lConnection = lDataSource.getConnection();
			
					final PreparedStatement lPreparedStatementCreation =
			
							lConnection
									.prepareStatement("SELECT ID, LASTNAME, FIRSTNAME, EMAIL FROM contact");
					
					ResultSet rs = lPreparedStatementCreation.executeQuery();
					String affiche;
					
					for(;rs.next();) {
						//System.out.println(rs.getLong("ID") + " " + rs.getString("LASTNAME") + " " + rs.getString("FIRSTNAME") + " " + rs.getString("EMAIL"));
						affiche = "<tr><td>"+rs.getLong("ID")+"</td><td>"+rs.getString("LASTNAME")+"</td><td>"+rs.getString("FIRSTNAME")+"</td><td>"+rs.getString("EMAIL")+"</td></tr>";
						out.print(affiche);
					}
					} catch (NamingException e) {
				
				
					} catch (SQLException e) {
				
				
					}
			%>
		</table>
</body>
</html:html>


try {
			final Context lContext = new InitialContext();
			final DataSource lDataSource = (DataSource) lContext.lookup(RESOURCE_JDBC);
			final Connection lConnection = lDataSource.getConnection();

			final PreparedStatement lPreparedStatementCreation =

					lConnection
							.prepareStatement("SELECT ID, LASTNAME, FIRSTNAME, EMAIL FROM contact");
			
			ResultSet rs = lPreparedStatementCreation.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getLong("ID") + " " + rs.getString("LASTNAME") + " " + rs.getString("FIRSTNAME") + " " + rs.getString("EMAIL"));
			}
			
			return null;
		} catch (NamingException e) {

			return "NamingException : " + e.getMessage();

		} catch (SQLException e) {

			return "SQLException : " + e.getMessage();

		}