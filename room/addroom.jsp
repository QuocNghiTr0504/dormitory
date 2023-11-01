<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.sql.*" %>
        <%
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");   
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1","root","");
        Statement stmt=con.createStatement();
            String mp = request.getParameter("mp"); 
            String tp = request.getParameter("tp"); 
            String dt = request.getParameter("dt"); 
            String sg =request.getParameter("sg"); 
            String sc = request.getParameter("sc"); 
        String strSQL="INSERT INTO phong (MaPhong, TenPhong, DienTich, SoGiuong, SucChuaHienTai) VALUES (N'"+mp+"',N'"+tp+"',N'"+dt+"',N'"+sg+"',N'"+sc+"')";
        stmt.executeUpdate(strSQL);
        response.sendRedirect("../main/home.jsp");

%>