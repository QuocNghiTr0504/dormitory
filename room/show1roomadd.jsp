<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>Thêm phòng</title>
    </head>

    <body>
        <%@ page import="java.sql.*" %>
            <%

        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1","root","");
        Statement stmt=con.createStatement();

    
        %>
                <%@ include file="../main/main.jsp" %>

                    <form action="../room/addroom.jsp" method="post">
                        <section class="vh-100">
                            <div class="container h-100">
                                <div class="row d-flex justify-content-center align-items-center h-100">
                                    <div class="col-lg-12 col-xl-11">
                                        <div class="card text-black" style="border-radius: 25px;">
                                            <div class="card-body p-md-5">
                                                <div class="row justify-content-center">
                                                    <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                                        <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Thêm phòng</p>

                                                        <form class="mx-1 mx-md-4">

                                                            <div class="d-flex flex-row align-items-center mb-4">
                                                                <i class="fa-solid fa-ticket-simple me-3 fa-fw"></i>
                                                                <div class="form-outline flex-fill mb-0">
                                                                    <label class="form-label" for="form3Example1c">Mã Phòng</label>
                                                                    <input name="mp" type="text" id="form3Example1c" class="form-control" placeholder="Nhập mã phòng..." />
                                                                </div>
                                                            </div>

                                                            <div class="d-flex flex-row align-items-center mb-4">
                                                                <i class="fa-solid fa-house-chimney-user me-3 fa-fw"></i>
                                                                <div class="form-outline flex-fill mb-0">
                                                                    <label class="form-label" for="form3Example3c">Tên phòng</label>
                                                                    <input name="tp" type="text" id="form3Example3c" class="form-control" placeholder="Nhập tên phòng..." />
                                                                </div>
                                                            </div>
                                                            <div class="d-flex flex-row align-items-center mb-4 ">
                                                                <i class="fa-solid fa-chess-board  me-3 fa-fw"></i>
                                                                <div class="form-outline flex-fill mb-0">
                                                                    <label class="form-label" for="form3Example4c">Diện tích</label>
                                                                    <input name="dt" type="text" id="form3Example4c" class="form-control" placeholder="Nhập diện tích..." />
                                                                </div>
                                                            </div>



                                                            <div class="d-flex flex-row align-items-center mb-4">
                                                                <i class="fa-solid fa-bed me-3 fa-fw"></i>
                                                                <div class="form-outline flex-fill mb-0">
                                                                    <label class="form-label" for="form3Example4c">Số giường</label>
                                                                    <input name="sg" type="text" id="form3Example4c" class="form-control" placeholder="Nhập số giường..." />
                                                                </div>
                                                            </div>
                                                            <div class="d-flex flex-row align-items-center mb-4">
                                                                <i class="fa-solid fa-list-ol me-3 fa-fw"></i>
                                                                <div class="form-outline flex-fill mb-0">
                                                                    <label class="form-label" for="form3Example4c">Sức chứa</label>
                                                                    <input name="sc" type="text" id="form3Example4c" class="form-control" placeholder="Nhập sức chứa..." />
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

                                                        </form>

                                                    </div>
                                                    <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                                                        <img src="../img/intro.jpg" style="width:900px" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </form>

    </body>

    </html>