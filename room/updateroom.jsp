<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta tp="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>Document</title>
    </head>

    <body>
        <%@ page import="java.sql.*" %>
            <%
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");    
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1","root","");
            Statement stmt=con.createStatement();
            String id=request.getParameter("id");
            String tp=request.getParameter("tp");
            String dt=request.getParameter("dt");
            String ml=request.getParameter("ml");
            String sg=request.getParameter("sg");
            String sc=request.getParameter("sc");
            String strSQL="update phong set TenPhong=N'"+tp+"',DienTich=N'"+dt+"',SoGiuong=N'"+sg+"',SucChuaHienTai=N'"+sc+"' where  MaPhong='"+id+"'";
            stmt.executeUpdate(strSQL);
            response.sendRedirect("../main/home.jsp");
            %>
    </body>

    </html>