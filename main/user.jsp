<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <style>
                body {
                    background: linear-gradient(98deg, #5BA8A0, rgba(62, 121, 124, 1));
                    height: 200px;
                }
                
                table {
                    border: 1px solid transparent;
                    border-collapse: collapse;
                    margin: 0;
                    padding: 0;
                    width: 100%;
                    table-layout: fixed;
                    height: 200px;
                }
                
                table caption {
                    font-size: 1.5em;
                    margin: .5em 0 .75em;
                }
                
                table tr {
                    background-color: #f8f8f8;
                    border: 1px solid #FFFFFF;
                    padding: .35em;
                    opacity: 0.7;
                }
                
                table th,
                table td {
                    padding: .625em;
                    text-align: center;
                }
                
                table th {
                    font-size: .85em;
                    letter-spacing: .1em;
                    text-transform: uppercase;
                }
                
                @media screen and (max-width: 600px) {
                    table {
                        border: 0;
                    }
                    table caption {
                        font-size: 1.3em;
                    }
                    table thead {
                        border: none;
                        clip: rect(0 0 0 0);
                        height: 1px;
                        margin: -1px;
                        overflow: hidden;
                        padding: 0;
                        position: absolute;
                        width: 1px;
                    }
                    table tr {
                        border-bottom: 3px solid #FFFFFF;
                        display: block;
                        margin-bottom: .625em;
                    }
                    table td {
                        border-bottom: 1px solid #FFFFFF;
                        display: block;
                        font-size: .8em;
                        text-align: right;
                    }
                    table td::before {
                        content: attr(data-label);
                        float: left;
                        font-weight: bold;
                        text-transform: uppercase;
                    }
                    table td:last-child {
                        border-bottom: 0;
                    }
                }
                
                .txcrud {
                    color: #04364A;
                    font-weight: 700;
                }
                
                .a {
                    color: #04364A;
                    font-size: 20px;
                }
                
                .crud {
                    opacity: 1;
                    display: flex;
                    padding: 20px 0;
                    text-transform: uppercase;
                    justify-content: space-around;
                    font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
                }
                
                img {
                    object-fit: contain;
                }
            </style>
        </head>

        <body>
            <%@ page import="java.sql.*" %>
                <%

            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1","root","");
            Statement stmt=con.createStatement();
    String mssv = (String) session.getValue("user");
           

%>
                    <%@ include file="../main/mainuser.jsp" %>
                        <%
                            ResultSet sv1=stmt.executeQuery("select * from sinhvien where MaSV='"+mssv+"'");
                            while(sv1.next()){
                        %>

                            <form action='../user/adduser.jsp?' thod="post" class="main">
                                <section class="vh-100">
                                    <div class="container h-100">
                                        <div class="row d-flex justify-content-center align-items-center h-100">
                                            <div class="col-lg-12 col-xl-11">
                                                <div class="card text-black" style="border-radius: 25px;">
                                                    <div class="card-body p-md-5" style="height: 600px;">
                                                        <div class="row justify-content-center">
                                                            <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                                                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Đăng ký </p>


                                                                <div class="d-flex flex-row align-items-center mb-4">
                                                                    <i class="fa-solid fa-user me-3 fa-fw"></i>
                                                                    <div class="form-outline flex-fill mb-0">
                                                                        <label class="form-label" for="form3Example3c">Tên sinh viên</label>
                                                                        <input name="name" type="text" id="form3Example3c" class="form-control" value='<% out.print(sv1.getString("TenSV"));%>' />

                                                                    </div>
                                                                </div>

                                                                <div class="d-flex flex-row align-items-center mb-4">
                                                                    <i class="fa-regular fa-calendar-plus me-3 fa-fw"></i>
                                                                    <div class="form-outline flex-fill mb-0">
                                                                        <label class="form-label" for="form3Example4c">Ngày bắt đầu</label>
                                                                        <input name="begindate" type="date" id="form3Example4c" class="form-control" value='' />
                                                                    </div>
                                                                </div>

                                                                <div class="d-flex flex-row align-items-center mb-4">
                                                                    <i class="fa-regular fa-calendar-check me-3 fa-fw"></i>
                                                                    <div class="form-outline flex-fill mb-0">
                                                                        <label class="form-label" for="form3Example4c">Ngày kết thúc</label>
                                                                        <input name="enddate" type="date" id="form3Example4c" class="form-control" value='' />
                                                                    </div>
                                                                </div>



                                                                <div class="form-check d-flex justify-content-center mb-5">
                                                                    <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3c" />
                                                                    <label class="form-check-label" for="form2Example3">
                                Tôi đồng ý với thông tin trên
                              </label>
                                                                </div>

                                                                <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                                                    <button type="submit" class="btn btn-primary btn-lg">Gửi</button>
                                                                </div>



                                                            </div>
                                                            <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                                                                <img src="../img/intro.jpg" width="800px" style="height: 500px;" alt="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </form>
                            <%
                                                            }
                                                                %>
        </body>

        </html>