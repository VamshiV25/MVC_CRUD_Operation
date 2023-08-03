<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adding New Record</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
        background-color: brown;
        padding:150px; /* Change the background color here */
    }
    h1{
    text-align:center;
    color:white;
    }
</style>
</head>
<body>
    <div class="container">
    <h1>Add</h1>
        <form method="post" action="AddController" onsubmit="return validate();">        
            <table class="table">
                <tr>
                    <td style="color:white;font-size:20px;">Name</td>
                    <td><input type="text" name="txt_name" id="name" class="form-control"></td>
                </tr>
                <tr>
                    <td style="color:white;font-size:20px;">Owner</td>
                    <td><input type="text" name="txt_owner" id="owner" class="form-control"></td>
                </tr> 
                <tr>
                    <td><input type="submit" name="btn_add" value="Add" class="btn btn-primary"></td> 
                </tr>
            </table>
        </form>
        <center>
            <h3 style="color:red;">
                <%
                if(request.getAttribute("InsertErrorMsg")!=null) {
                    out.println(request.getAttribute("InsertErrorMsg")); 
                    //get insert record fail error message from AddController.java
                }
                %>
            </h3>
            <h1><a href="index.jsp" class="btn btn-secondary">Back</a></h1>
        </center>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
