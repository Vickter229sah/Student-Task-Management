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

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) AS task_count FROM tasks WHERE student_id = ?");
        ps.setInt(1, studentId);
        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            out.println("Number of tasks assigned to student " + studentId + ": " + rs.getInt("task_count"));
        }

        con.close();
    } catch (Exception e) {
        out.println(e);
    }
%>
