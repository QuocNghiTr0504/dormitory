<%@ page import="java.sql.*" %>
    <%	
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1","root","");
Statement stmt=con.createStatement();
ResultSet nhanvien=stmt.executeQuery("select* from nhanvien");
String user =request.getParameter("user");
String pass =request.getParameter("pass");
    session.setAttribute("usernam",user);
    session.setAttribute("password",pass);
boolean check =false;
while(nhanvien.next()){
    if(user.equals(nhanvien.getString("MaNV")) && pass.equals(nhanvien.getString("Password"))){
        check = true; 
    } 
}
if(check==true){
    response.sendRedirect("../main/home.jsp");

} else{
    response.sendRedirect("../login/login1.jsp");

}


%>