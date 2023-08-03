<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Record</title>
    <!-- Add Bootstrap CSS link -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <!-- Custom CSS for styling -->
    <style>
        body {
            background-color: pink;
            font-family: Arial, sans-serif;
            padding: 100px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        form {
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            padding: 10px;
            border-bottom: 1px solid #dee2e6;
        }
        tr:last-child td {
            border-bottom: none;
        }
        input[type="submit"] {
            display: block;
            margin-top: 10px;
        }
        /* Custom styles for Bootstrap 5.3.0 compatibility */
        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529;
        }
        .table-bordered {
            border: 1px solid #dee2e6;
        }
        .table-bordered th,
        .table-bordered td {
            border: 1px solid #dee2e6;
        }
        .table-bordered thead th,
        .table-bordered thead td {
            border-bottom-width: 2px;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.05);
        }
        .table-hover tbody tr:hover {
            background-color: rgba(0, 0, 0, 0.075);
        }
        .form-control {
            display: block;
            width: 100%;
            height: calc(1.5em + 0.75rem + 2px);
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        .btn-primary {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
        }
        .btn-primary:hover {
            color: #fff;
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-primary:focus, .btn-primary.focus {
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.5);
        }
        .btn-success {
            color: #fff;
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-success:hover {
            color: #fff;
            background-color: #1b8622;
            border-color: #1b8622;
        }
        .btn-success:focus, .btn-success.focus {
            box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.5);
        }
    </style>
</head>

<body>
    <div class="container">
        <form method="post" action="EditController" onsubmit="return validate();">
            <table class="table">
                <%
                if (request.getParameter("edit_id") != null) {
                    int id = Integer.parseInt(request.getParameter("edit_id"));
                    String url = "jdbc:mysql://localhost:3306/jsp";
                    String username = "root";
                    String password = "2059";
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection(url, username, password);
                        PreparedStatement pstmt = null;
                        pstmt = con.prepareStatement("select * from person where id=?");
                        pstmt.setInt(1, id);
                        ResultSet rs = pstmt.executeQuery();
                        while (rs.next()) {
                            %>
                            <tr>
                                <td>Name</td>
                                <td><input type="text" name="txt_name" id="name" value="<%=rs.getString("name")%>" class="form-control"></td>
                            </tr>
                            <tr>
                                <td>Owner</td>
                                <td><input type="text" name="txt_owner" id="owner" value="<%=rs.getString("owner")%>" class="form-control"></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" name="btn_edit" value="Update" class="btn btn-primary"></td>
                            </tr>
                            <input type="hidden" name="hidden_id" value="<%=rs.getInt("id")%>">
                            <%
                        }
                        pstmt.close();
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                %>
            </table>
        </form>

        <center>
            <h3>
                <%
                    if (request.getAttribute("UpdateErrorMsg") != null) {
                        out.print(request.getAttribute("UpdateErrorMsg"));
                    }
                %>
            </h3>
            <a href="index.jsp" class="btn btn-secondary">Back</a>
        </center>
    </div>

    <!-- Add Bootstrap JS and Popper.js (required for Bootstrap) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
