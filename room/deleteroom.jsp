<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1","root","");
            Statement stmt=con.createStatement();
            String maphong =request.getParameter("id");
            stmt.executeUpdate("delete from phong where MaPhong = '" + maphong + "'");
            response.sendRedirect("../main/home.jsp");
            %>