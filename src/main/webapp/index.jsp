<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Index Page</title>
    <!-- Add Bootstrap 5.3.0 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
    body {
        background-color: lightgray; /* Change the background color here */
    }
         .custom-table {
        font-size: 14px;
        background-color: #e6f7ff; /* Change the background color here */
        border-collapse: collapse;
        width: 100%;
    }
        .custom-table thead th {
            background-color: #333;
            color: #fff;
            padding: 8px;
            text-align: left;
        }
        .custom-table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .custom-table tbody td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
        .custom-btn {
            font-size: 12px;
            padding: 5px 10px;
            margin-right: 5px;
        }
    </style>
</head>
<body>
	
    <div class="container">
    <h1 style="text-align:center;">Person Records</h1>
        <table class="table table-bordered table-hover custom-table">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Owner</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                String url = "jdbc:mysql://localhost:3306/jsp";
                String dbUser = "root";
                String dbPassword = "2059";
                
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, dbUser, dbPassword);
                    PreparedStatement pstmt = null;
                    pstmt = con.prepareStatement("select * from person");
                    ResultSet rs = pstmt.executeQuery(); 
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getInt("id")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("owner")%></td>
                    <td><a href="edit.jsp?edit_id=<%=rs.getInt("id")%>" class="btn btn-primary custom-btn">Edit</a></td>
                    <td><a href="delete.jsp?delete_id=<%=rs.getInt("id")%>" class="btn btn-danger custom-btn">Delete</a></td>
                </tr>
                <%
                     }
                    rs.close();
                    pstmt.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </tbody>
        </table>
        <br>
        <h3 class="text-center"><a href="add.jsp" class="btn btn-primary">Add New Record</a></h3>
        <div class="text-center">
            <a href="login.jsp" class="btn btn-danger">Logout</a>
        </div>
    </div>
    
    <!-- Add Bootstrap 5.3.0 JS dependencies -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
