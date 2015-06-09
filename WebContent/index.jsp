<%@ page language="java" import="java.sql.*, test.Mydata"
    contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
      + "<td>" + company + "</td>";

    }

 tableHTML += "</table>";

  db.close();


%>
<p><a href="insert.html">データ追加</a></p>
<p><a href="delete.html">データ削除</a></p>
<p><a href="update.jsp">データ更新</a></p>
<html>
<body>
	<%= tableHTML %>
</body>
</html>
