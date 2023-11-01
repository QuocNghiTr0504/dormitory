<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
        <%
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");   
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1","root","");
            Statement stmt=con.createStatement();
            String mssv = (String) session.getValue("user");
                String begindate = request.getParameter("begindate"); 
                String enddate = request.getParameter("enddate"); 
            String strSQL="INSERT INTO phieudangky (MaSV, BatDau, KetThuc) VALUES (N'"+mssv+"',N'"+begindate+"',N'"+enddate+"')";
            stmt.executeUpdate(strSQL);
            %>
            <script>
                alert("Gửi thành công");
            </script>
            <a href="../main/user.jsp">Quay về</a>