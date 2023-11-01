<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/main.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/831fcd2ec7.js" crossorigin="anonymous"></script>

        <title>Document</title>
        <style>
            .wg {
                height: 75%;
                margin: 10px 20px;
                margin-top: 96px;
            }
            
            .infor {
                text-align: center;
            }
            
            table {
                padding: 10px 10px;
            }
            
            tr {
                margin-bottom: 20px;
            }
            
            .pd {
                margin-top: 100px;
            }
            
            .main {
                position: relative;
            }
            
            li {
                position: absolute;
                top: 0;
                right: 0;
            }
        </style>
    </head>

    <body>
        <%@ page import="java.sql.*" %>
            <%
    Class.forName("com.mysql.jdbc.Driver");
    Connection connect=DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1","root","");
    Statement sinhvien=connect.createStatement();
    String user = (String) session.getValue("user");

    %>
                <div class="main">
                    <header class="main-header">
                        <div class="container">
                            <nav class="navbar navbar-expand-lg main-nav px-0">
                                <a class="navbar-brand" style="display:flex">
                                    <img style="border-radius:50%; height:80px;width:80px" src="https://plus.unsplash.com/premium_photo-1681345515350-89e8c3891b50?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80" alt="rajeshdas.com">
                                    <h5 style="margin-top:10px; padding:10px 10px">Hệ Thống Quản Lý Kí Túc Xá</h5>
                                </a>

                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainMenu" aria-controls="mainMenu" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon-bar icon-bar-1"></span>
                            <span class="icon-bar icon-bar-2"></span>
                            <span class="icon-bar icon-bar-3"></span>
                        </button>
                                <div class="collapse navbar-collapse" id="mainMenu">

                                    <ul class="navbar-nav ml-auto text-uppercase f1 kp" style="padding:20px;">
                                        <li>
                                            <a href="../main/user.jsp" style=" font-size: 20px;margin-right: 150px;"><i  class="fa-solid fa-house"></i></a>
                                        </li>
                                        <li>
                                            <button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><i style=" font-size: 20px; margin-right: 65px;" class="fa-solid fa-user"></i></button>

                                            <div class="offcanvas offcanvas-end wg" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
                                                <div class="offcanvas-header">
                                                    <h5 id="offcanvasRightLabel">User</h5>
                                                    <hr>
                                                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                                                </div>
                                                <div class="offcanvas-body infor">
                                                    <img style="width:100px;object-fit: cover; height:100px; border-radius:50%; margin-bottom: 10px;" src="https://images.unsplash.com/photo-1511551203524-9a24350a5771?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80"
                                                        alt="">
                                                    <%
                                                    ResultSet sv=sinhvien.executeQuery("select * from sinhvien inner join lop on lop.MaLop=sinhvien.MaLop where MaSV='"+user+"'");
                                                    while(sv.next()) {
                                                    %>
                                                        <table>
                                                            <tr class="pd">
                                                                <th>Mã số sinh viên</th>
                                                                <td>
                                                                    <% out.print(sv.getString("MaSV")); %>
                                                                </td>
                                                            </tr>

                                                            <tr class="pd">
                                                                <th>Họ tên</th>
                                                                <td>
                                                                    <% out.print(sv.getString("TenSV")); %>
                                                                </td>
                                                            </tr>
                                                            <tr class="pd">

                                                                <th>Số điện thoại</th>
                                                                <td>
                                                                    <% out.print(sv.getString("SoDienThoai"));%>
                                                                </td>

                                                            </tr>
                                                            <tr class="pd">

                                                                <th>Lớp</th>
                                                                <td>
                                                                    <% out.print(sv.getString("TenLop"));%>
                                                                </td>

                                                            </tr>
                                                            <tr class="pd">

                                                                <th>Quê quán</th>
                                                                <td>
                                                                    <% out.print(sv.getString("QueQuan"));%>
                                                                </td>

                                                            </tr>
                                                            <tr class="pd">

                                                                <th>PassWord</th>
                                                                <td>
                                                                    <% out.print(sv.getString("PassWord"));%>
                                                                </td>

                                                            </tr>


                                                        </table>
                                                        <%
                                                    }
                                                        %>
                                                </div>
                                            </div>


                                        </li>
                                        <li>
                                            <a href="../login/login1.jsp" style=" font-size: 20px"><i class="fa-solid fa-right-from-bracket"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                        <!-- /.container -->
                    </header>
                </div>
    </body>

    </html>