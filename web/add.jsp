<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // Assuming you have a MySQL database with credentials
    String url = "jdbc:mysql://localhost:3306/mysql";
    String username = "root";
    String password = "";
    
    int ts = Integer.parseInt(request.getParameter("task_id"));
    String taskName = request.getParameter("task_name");
    int studentId = Integer.parseInt(request.getParameter("student_id"));
    String status = "Pending";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement ps = con.prepareStatement("INSERT INTO tasks (task_id,task_name, student_id, status) VALUES (?,?, ?, ?)");
        ps.setInt(1,ts);
        ps.setString(2, taskName);
        ps.setInt(3, studentId);
        ps.setString(4, status);
        ps.executeUpdate();
        con.close();
    } catch (Exception e) {
        out.println(e);
    }
%>
