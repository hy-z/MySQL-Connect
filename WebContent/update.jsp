<%@ page language="java" import="java.sql.*, test.Mydata"
    contentType="text/html; charset=UTF-8" %>
    <%
    request.setCharacterEncoding("UTF-8");%>
<%
Mydata db = new Mydata();
  db.open();

  ResultSet rs = db.getResultSet("select * from kabukatable");
  String tableHTML = "<table border=1>";
  tableHTML += "<tr bgcolor=\"000080\"><td><font color=\"white\">code</font></td>"
	  + "<td><font color=\"white\">company</font></td>";

  while(rs.next()) {
    int code = rs.getInt("code");
    String company = rs.getString("company");

    tableHTML += "<tr><td align=\"right\">" + code + "</td>"
      + "<td>" + company + "</td>"

      + "<td>" + "<form action=\"updateshow.jsp\" method=\"POST\">"

      + "<input type = \"hidden\" name = \"code_id\" value= \" " +  code  + " \" >"

      + "<input type = \"submit\" value=\"取得\"></form>" + "</td>";
  }

  tableHTML += "</table>";

  db.close();
%>
<html>
<body>
	<%= tableHTML %>
</body>
</html>