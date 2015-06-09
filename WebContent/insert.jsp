<%@ page language="java" import="java.sql.*, test.Mydata"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    Connection conn = null;
    PreparedStatement stmt = null;

    String code = request.getParameter("newcode");
    String company = request.getParameter("newcompany");
    try{
    	Mydata db = new Mydata();

        conn = db.open();

        conn.setAutoCommit(false);

        String sql =

          "insert into kabukatable (code, company) values ('" + code + "','" + company + "')";

        stmt = conn.prepareStatement(sql);
        stmt.execute();

        stmt.close();

        conn.commit();

    } catch (SQLException se) {
    	try {
            if(conn != null)
                conn.rollback();
        } catch (SQLException se2) {}
    }
    finally {
        try {
            if(conn != null)
                conn.close();
        }
        catch (SQLException se2) {
        }
    }

%>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <title>データベースサンプル</title>
</head>
<body>
<h1>データベース接続サンプル</h1>
<p>以下のデータを追加しました。</p>
  newcode: <%=code %>
  newcompany: <%=company %>

<a href="index.jsp">トップへ戻る</a>
</body>
</html>