<%@ page language="java" import="java.sql.*, test.Mydata"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    Connection conn = null;
    PreparedStatement stmt = null;

    String delete_code = request.getParameter("newcode");
    try{
    	Mydata db = new Mydata();

        conn = db.open();

        conn.setAutoCommit(false);

        String sql =
        	"delete from  kabukatable where code = (" + delete_code + ")";

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