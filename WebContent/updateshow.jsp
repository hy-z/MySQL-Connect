<%@ page language="java" import="java.sql.*, test.Mydata"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");%>


<%
  Mydata db = new Mydata();
  db.open();

  String update_id = request.getParameter("code_id");
  //SQL文を実行して結果を取得
  ResultSet rs = db.getResultSet("select * from kabukatable where code = " + update_id + "");
%>
<html>
<body>

<form action="updateover.jsp" method="POST">
<input type="text" name="overcode"  value="<%=update_id %>">
<% while(rs.next()){
	String update_company = rs.getString("company");%>
　　<input type="text" name="overcompany"  value="<%=update_company %>">

 <% } %>

<input type=submit value='更新'>
</form>

</body>
</html>


