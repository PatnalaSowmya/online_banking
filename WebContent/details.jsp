<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,java.sql.Connection,java.util.*,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<center>
<p><strong>TRANSACTION DETAILS</strong></p></center>

<table border="10px">
<tr>
<td><a href="Transfer"><button type="button">TRANSFER</button></a></td>
<td>AMOUNT BALNCE:
 <%
 try{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo","root","");
	 Statement stmt =conn.createStatement();
	 String ps1 = "select balance from transaction ORDER BY id DESC LIMIT 1 ";
	 ResultSet rs = stmt.executeQuery(ps1);
	 	int temp=0;
	while(rs.next()){
		%>
		<%=rs.getInt(1)%></td></tr></table>
		<%
		temp++;
	}
	%>
	<center>
<table border="10px">
<tr>
<td>ID</td>
<td>DATE</td>
<td>DESCRIPTION</td>
<td>REF</td>
<td>WITHDRAWL</td>
<td>DEPOSIT</td>
<td>BALANCE</td>
</tr>
<% 
	String ps2 = "select * from transaction ORDER BY id DESC LIMIT 5";
	ResultSet rs2 = stmt.executeQuery(ps2);
	int temp1=0;
	while(rs2.next()){
		%>
		<tbody>
		<tr >
		<td><%=rs2.getInt(1) %></td>
		<td><%=rs2.getString(2) %></td>
		<td><%=rs2.getString(3) %></td>
		<td><%=rs2.getString(4) %></td>
		<td><%=rs2.getInt(5) %></td>
		<td><%=rs2.getInt(6) %></td>
		<td><%=rs2.getInt(7) %></td>
		</tr>
		</tbody>
<% 
temp1++;
	}
	}
 catch(Exception e)
 {
	 e.printStackTrace();

 }
 %>
 </table>
 </center>
</body>
</html>

