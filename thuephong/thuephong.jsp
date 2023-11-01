<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="java.util.Date" %>
        <%@ page import="java.text.SimpleDateFormat" %>
            <%@ page import="java.sql.*" %>
                <%
        Date currentDate = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy"); 
        String dateString =(String) formatter.format(currentDate);
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = null; 
        try {
          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1", "root", "");
          String mssv = request.getParameter("id");
          String ngaythanhtoan = request.getParameter("ngaythanhtoan");
          String select = request.getParameter("select");
          String select1 = request.getParameter("select1");
          
          Statement stmt=conn.createStatement();
          if(mssv == null || ngaythanhtoan == null || select == null || select1 == null){
              out.print("sai cac tham so truyen vao");
            }
          String countMssv= "select count(*) from tt_thuephong where MaSV=?";
          PreparedStatement checkMssv = conn.prepareStatement(countMssv);
          checkMssv.setString(1,mssv);
          ResultSet checkCountSV =checkMssv.executeQuery();
      
          if(checkCountSV.next()){
            int count= checkCountSV.getInt(1);
            if(count>0){
               %>
                    <script>
                        alert("Sinh viên đã đăng ký phòng rồi!!");
                    </script>
                    <a href="../main/home.jsp">Quay lại</a>
                    <%

            }else{
              String sqlInsert = "INSERT INTO tt_thuephong (Thoigian,ThanhToan,MaPhong,MaSV) VALUES (?,?,?,?)";
              PreparedStatement pstmt = conn.prepareStatement(sqlInsert);
              pstmt.setString(1, ngaythanhtoan);
              pstmt.setString(2, select); 
              pstmt.setString(3, select1);
              pstmt.setString(4, mssv);
              pstmt.executeUpdate();

              if (pstmt.getUpdateCount() > 0) {
                String sqlDeletePhieu = "DELETE FROM phieudangky WHERE MaSV = ?";
                PreparedStatement pstmtDeletePhieu = conn.prepareStatement(sqlDeletePhieu);
                pstmtDeletePhieu.setString(1, mssv);
                pstmtDeletePhieu.executeUpdate();
              }
              if (pstmt.getUpdateCount() > 0) {
                String sqlUpdate = "UPDATE phong SET SucChuaHienTai = SucChuaHienTai + 1 WHERE MaPhong = ?";
                PreparedStatement pstmt2 = conn.prepareStatement(sqlUpdate);
                pstmt2.setString(1, select1);  
                pstmt2.executeUpdate();       
                
              }
              %>
                        <script>
                            alert("Thêm thành công!!!");
                        </script>
                        <a href="../main/home.jsp">Về trang</a>
                        <%

            }
          }else{
            out.print("Lỗi mã số sinh viên");
          }
  
        } catch (SQLException ex) {
        
          out.print("loi roi"+ex);
          
        } finally {
        
          if(conn != null) {
            conn.close();
          }
        
        }
        
        
%>
                            %>