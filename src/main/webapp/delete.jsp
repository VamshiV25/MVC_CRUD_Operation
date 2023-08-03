<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Delete Record</title>
    <!-- Add Bootstrap 5.3.0 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<%
    if(request.getParameter("delete_id")!=null) {
        int id=Integer.parseInt(request.getParameter("delete_id"));
        String url="jdbc:mysql://localhost:3306/jsp";
        String username="root";
        String password="2059";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection(url,username,password);
            PreparedStatement pstmt=null;

            pstmt=con.prepareStatement("delete from person where id=? ");
            pstmt.setInt(1,id);
            pstmt.executeUpdate();

            pstmt.close();
            con.close();

            // Redirect back to index.jsp after successful deletion
            response.sendRedirect("index.jsp");
        } catch(Exception e) {
            e.printStackTrace();
        }      
    }
%>

<!-- Add your content here if needed -->

<!-- Add Bootstrap 5.3.0 JS dependencies -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
