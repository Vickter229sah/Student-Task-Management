<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student Task Management</title>
    <style>
        body {
            color: white;
            background-image: url("https://img.freepik.com/free-photo/blue-smooth-wall-textured-background_53876-106133.jpg?size=626&ext=jpg&ga=GA1.1.1311733415.1706462097&semt=sph");
            font-family: Arial, sans-serif;
            margin: 0px;
            padding: 20px;
        }
        h2 {
            color: orangered;
            margin-bottom: 10px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            color: white;
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        tr:nth-child(even) {
/*            background-color: #f2f2f2;*/
        }
        form {
            
            align-items: center;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="submit"] {
            
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        hr {
            color: white;
            margin: 20px 0;
            border: 0;
            border-top: 1px solid #eee;
        }
        
        
        
        
    </style>
</head>
<body>
    <div class="container">
    <h2>Add Task</h2>
    <form action="add.jsp" method="post">
        Task Name: <input type="text" name="task_name"><br>
        Student ID: <input type="text" name="student_id"><br>
        Task ID:<input type="text" name="task_id"><br>
        <input type="submit" value="Add Task">
    </form>

    <hr>

    <h2>View Task</h2>
    <form action="view.jsp" method="get">
        Student ID: <input type="text" name="student_id"><br>
        <input type="submit" value="View Tasks">
    </form>

    <hr>

    <h2>Update Task</h2>
    <form action="update.jsp" method="post">
        Student ID: <input type="text" name="student_id"><br>
        New Task Count: <input type="text" name="new_task_count"><br>
        <input type="submit" value="Update Tasks">
    </form>

    <hr>

    <h2>Delete Task</h2>
    <form action="delete.jsp" method="post">
        Task ID: <input type="text" name="task_id"><br>
        <input type="submit" value="Delete Task">
    </form>
</div >
    
    <div >
    <hr>

    <h2>All Tasks</h2>
    <table>
        <tr>
            <th>Task ID</th>
            <th>Task Name</th>
            <th>Student ID</th>
            <th>Status</th>
            <th>Task Count</th>
        </tr>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.io.*" %>
        <% 
            String url = "jdbc:mysql://localhost:3306/mysql";
            String username = "root";
            String password = "";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, username, password);
                PreparedStatement ps = con.prepareStatement("SELECT * FROM tasks");
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()) { %>
                    <tr>
                        <td><%= rs.getInt("task_id") %></td>
                        
                        <td><%= rs.getString("task_name") %></td>
                        <td><%= rs.getInt("student_id") %></td>
                        <td><%= rs.getString("status") %></td>
                        <td><%= rs.getInt("task_count") %></td>
                    </tr>
                <% } 
                con.close();
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </table>
    
    </div>
</body>
</html>
