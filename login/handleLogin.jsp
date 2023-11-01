<%@ page import="java.sql.*" %>
    <%	
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1","root","");
Statement stmt=con.createStatement();
ResultSet sinhvien=stmt.executeQuery("select* from sinhvien");
String user =request.getParameter("user");
String pass =request.getParameter("pass");

boolean check =false;
while(sinhvien.next()){
    if(user.equals(sinhvien.getString("MaSV")) && pass.equals(sinhvien.getString("Password"))){
        session.putValue("user",user);
        check = true; 
    
    } 
}
if(check==true){
    response.sendRedirect("../main/user.jsp");

} else{
    response.sendRedirect("../login/login1.jsp");

}


%>