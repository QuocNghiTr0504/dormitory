<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>

    <body>
        <%@ page import="java.sql.*" %>
            <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1","root","");
            Statement stmt=con.createStatement();
            String mssv =request.getParameter("id");
            stmt.executeUpdate("delete from sinhvien where MaSV = '" + mssv + "'");
            response.sendRedirect("../main/home.jsp");
            %>
                <script>
                </script>
                <%
                %>
    </body>

    </html>