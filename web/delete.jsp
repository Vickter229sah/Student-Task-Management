<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Assuming you have a MySQL database with credentials
    String url = "jdbc:mysql://localhost:3306/mysql";
    String username = "root";
    String password = "";
    
    int taskId = Integer.parseInt(request.getParameter("task_id"));

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement ps = con.prepareStatement("DELETE FROM tasks WHERE task_id = ?");
        ps.setInt(1, taskId);
        ps.executeUpdate();
        con.close();
    } catch (Exception e) {
        out.println(e);
    }
%>
