<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
            a {
                text-decoration: none;
                color: green;
                border: 2px solid green;
                font-family: 'Courier New', Courier, monospace;
                font-size: 20px;
            }
            
            h2 {
                color: red;
            }
            
            .post {
                text-align: center;
            }
        </style>
    </head>

    <body>
        <%@ page import="java.sql.*" %>
            <%
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");   
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1","root","");
            Statement stmt=con.createStatement();
                String mssv = request.getParameter("mssv"); 
                String name = request.getParameter("name"); 
                String phone = request.getParameter("phone"); 
                String select =request.getParameter("select"); 
                String born = request.getParameter("born"); 
                String password = request.getParameter("password"); 
            String strSQL="INSERT INTO sinhvien (MaSV, TenSV, SoDienThoai, MaLop, QueQuan, PassWord) VALUES (N'"+mssv+"',N'"+name+"',N'"+phone+"',N'"+select+"',N'"+born+"',N'"+password+"')";
            stmt.executeUpdate(strSQL);
            response.sendRedirect("../main/home.jsp");
            %>
    </body>



    </html>