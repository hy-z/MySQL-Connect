<%@ page language="java" import="java.sql.*, test.Mydata"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    Connection conn = null;
    PreparedStatement stmt = null;

    String code = request.getParameter("overcode");
    String company = request.getParameter("overcompany");
    try{
    	Mydata db = new Mydata();

        conn = db.open();

        conn.setAutoCommit(false);

        String sql =
        	" update kabukatable set company ='"+ company + "' where code = " + code + "";

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

<jsp:forward page="index.jsp" />