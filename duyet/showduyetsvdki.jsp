<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>Xếp phòng</title>
    </head>

    <body>
        <%@ page import="java.util.Date" %>
            <%@ page import="java.text.SimpleDateFormat" %>
                <%@ page import="java.sql.*" %>
                    <%
                    Date currentDate = new Date();
                    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy"); 
                    String dateString = formatter.format(currentDate);
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1","root","");
                    Statement stmt=con.createStatement();
                    String mssv = request.getParameter("id");    
        %>
                        <%
                        ResultSet show =stmt.executeQuery("select * from phieudangky,sinhvien where sinhvien.MaSV=phieudangky.MaSV and phieudangky.MaSV ='"+mssv+"'");
                        while(show.next()){
                        %>
                            <form action='../thuephong/thuephong.jsp?id=<% out.print(show.getString("MaSV"));%>' method="post">
                                <section class="vh-100" style="background-color: #eee;">
                                    <div class="container h-100">
                                        <div class="row d-flex justify-content-center align-items-center h-100">
                                            <div class="col-lg-12 col-xl-11">
                                                <div class="card text-black" style="border-radius: 25px;">
                                                    <div class="card-body p-md-5">
                                                        <div class="row justify-content-center">
                                                            <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                                                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Xếp phòng</p>

                                                                <form class="mx-1 mx-md-4">

                                                                    <div class="d-flex flex-row align-items-center mb-4">
                                                                        <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                                                        <div class="form-outline flex-fill mb-0">
                                                                            <label class="form-label" for="form3Example3c">Tên sinh viên</label>
                                                                            <input name="name" type="block" id="form3Example3c" class="form-control" value='<% out.println(show.getString( "TenSV")); %>' />

                                                                        </div>
                                                                    </div>
                                                                    <div class="d-flex flex-row align-items-center mb-4">
                                                                        <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                                                        <div class="form-outline flex-fill mb-0">
                                                                            <label class="form-label" for="form3Example3c">Ngày thanh toán</label>
                                                                            <input name="ngaythanhtoan" type="text" id="form3Example3c" class="form-control" value=' <%= dateString %>' />

                                                                        </div>
                                                                    </div>
                                                                    <div class="d-flex flex-row align-items-center mb-4">
                                                                        <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                                                        <div class="form-outline flex-fill mb-0">
                                                                            <label class="form-label" for="form3Example3c">Đóng tiền</label><br>
                                                                            <select name="select" id="" style="width:356px;height: 38px; border-radius: 5px;">
                                                                                <option  value="yes">yes</option>
                                                                                <option value="no">no</option>
                                                                            </select>

                                                                        </div>
                                                                    </div>

                                                                    <%
                                                                         }
                                                                
                                                                    %>
                                                                        <div class="d-flex flex-row align-items-center mb-4">
                                                                            <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                                                            <div class="form-outline flex-fill mb-0">

                                                                                <label class="form-label" for="form3Example3c">Phòng</label><br>
                                                                                <input name="select1" type="text" id="form3Example3c" class="form-control" value='' placeholder="Hãy nhập phòng theo các mã bên trên.." />
                                                                                <p>Các phòng trống là:
                                                                                    <%
                                                                                    ResultSet room =stmt.executeQuery("select * from phong ");
                                                                                    boolean check=false;
                                                                                    while (room.next()) {
                                                                                        String fullroom= room.getString("SucChuaHienTai");
                                                                                        Double fullrooms=Double.parseDouble(fullroom);
                                                                                        if(fullrooms<4){
                                                                                         out.println((room.getString("MaPhong")+""));    
                                                                                         check=true;  
                                                                                         
                                                                                    %>


                                                                                        <% 
                                                                                    } } 
                                                                                    if(check==false){ 
                                                                                        out.print( "Hết phòng!!");
                                                                                    
                                                                                     } %>
                                                                                </p>

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

                                                                <img src="../img/intro.jpg" alt="">
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