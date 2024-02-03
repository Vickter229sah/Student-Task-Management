<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Assuming you have a MySQL database with credentials
    String url = "jdbc:mysql://localhost:3306/mysql";
    String username = "root";
    String password = "";
    
    int studentId = Integer.parseInt(request.getParameter("student_id"));
    int newTaskCount = Integer.parseInt(request.getParameter("new_task_count"));

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement ps = con.prepareStatement("UPDATE tasks SET task_count = ? WHERE student_id = ?");
        ps.setInt(1, newTaskCount);
        ps.setInt(2, studentId);
        ps.executeUpdate();
        con.close();
    } catch (Exception e) {
        out.println(e);
    }
%>
