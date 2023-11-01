<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>

    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="../css/home.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/831fcd2ec7.js" crossorigin="anonymous"></script>
        <style>
            body {
                background: linear-gradient(98deg, #5BA8A0, rgba(62, 121, 124, 1));
            }
            
            .navbar {
                background: transparent;
                width: 100%;
                height: 80px;
                position: relative;
            }
            
            li {
                text-decoration: none;
                list-style: none;
            }
            
            .info {
                display: none;
            }
            
            .avt:hover .info {
                display: inline-block;
            }
            
            .grid {
                display: grid;
                grid-template-columns: auto auto;
                grid-gap: 10px;
                padding: 10px;
                border-radius: 15px;
                width: 20%;
                border: 2px solid black;
                margin-left: 20px;
                text-align: center;
                flex-wrap: wrap;
            }
            
            .grid-item1 {
                grid-row: 1 /span 2;
                background: transparent;
                padding: 5px 5px;
                border: 2px solid linear-gradient(98deg, #F0F0F0, rgba(62, 121, 124, 1));
                height: 80%;
                background: linear-gradient(98deg, #F0F0F0, rgba(62, 121, 124, 1));
                width: 80px;
            }
            
            .header {
                width: 100%;
                border: none;
                height: 120px;
                margin: 0;
            }
            
            .grid-item {
                justify-content: center;
            }
            
            .caption {
                text-align: center;
                font-size: 20px;
            }
            
            .fa-solid {
                font-size: 20px;
            }
        </style>

    </head>

    <body>
        <%@ page import="java.sql.*" %>
            <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1","root","");
        Statement stmt=con.createStatement();  
%>

                <%@ include file="../main/main.jsp" %>

                    <div class="tabs">

                        <div class="tab-item active" id="1">
                            <i class="fa-solid fa-warehouse"></i>
                            <p>Danh sách phòng</p>
                        </div>

                        <div class="tab-item" id="2">
                            <i class="fa-solid fa-tent-arrows-down"></i>
                            <p>Danh sách thuê phong</p>
                        </div>
                        <div class="tab-item" id="3">
                            <i class="fa-solid fa-people-group"></i>
                            <p>Danh sách sinh viên</p>
                        </div>
                        <div class="tab-item" id="4">
                            <i class="fa-solid fa-address-card"></i>
                            <p>Xác nhận phiếu</p>
                        </div>

                        <div class="line"></div>
                    </div>
                    <hr>
                    <div class="tab-pane active" id="1">

                        <table>
                            <h1 class="caption" style="color:whitesmoke; font-weight: 700; padding: 20px 10px; text-transform: uppercase;">Danh sách phòng KTX Cần Thơ</h1>
                            <thead>
                                <tr style="color: #04364A;">
                                    <th scope="col">Tên phòng</th>
                                    <th scope="col">Diện tích</th>
                                    <th scope="col">Số giường</th>
                                    <th scope="col">Sức chứa hiện tại</th>
                                    <th scope="col">Sửa phòng</th>
                                    <th scope="col">Xóa phòng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                            ResultSet phong = stmt.executeQuery("select * from phong");
                            while(phong.next()){
                            %>
                                    <tr>
                                        <td data-label="Account">
                                            <%=phong.getString("TenPhong")%>
                                        </td>
                                        <td data-label="Account">
                                            <%=phong.getString("DienTich")%>
                                        </td>
                                        <td data-label="Due Date">
                                            <%=phong.getString("SoGiuong")%>
                                        </td>
                                        <td data-label="Period">
                                            <%=phong.getString("SucChuaHienTai")%>
                                        </td>
                                        <td>
                                            <div>

                                                <a class="a" href='../room/show1roomupdate.jsp?id=<% out.print(phong.getString("MaPhong")); %>'><i class="fa-solid fa-user-pen"></i></i></a>
                                            </div>
                                        </td>
                                        <td>
                                            <div>

                                                <a class="a" href='../room/deleteroom.jsp?id=<% out.print(phong.getString("MaPhong")); %>'><i class="fa-solid fa-user-minus"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                            }
                                %>
                            </tbody>
                        </table>
                        <div class="crud">
                            <div>
                                <label class="txcrud" for="">Thêm phòng</label>
                                <a class="a" href="../room/show1roomadd.jsp"><i class="fa-solid fa-user-plus"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="tab-contents">
                        <div class="tab-pane" id="2">
                            <table>
                                <h1 class="caption" style="color:whitesmoke;font-weight: 700;justify-content: center;text-align: center; padding: 20px 10px; text-transform: uppercase;">Danh sách phòng ở KTX Cần Thơ</h1>
                                <thead>
                                    <tr style="color: #04364A;">
                                        <th scope="col">Tên phòng</th>
                                        <th scope="col">Số lượng sinh viên</th>
                                        <th scope="col">Tình trạng phòng</th>
                                        <th scope="col">Xem phòng</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                ResultSet seenRoom = stmt.executeQuery("SELECT tt_thuephong.MaPhong, phong.TenPhong, COUNT(tt_thuephong.MaSV) AS SoLuongSinhVien " +
                                                                      "FROM tt_thuephong " +
                                                                      "INNER JOIN phong ON tt_thuephong.MaPhong = phong.MaPhong " +
                                                                      "GROUP BY tt_thuephong.MaPhong, phong.TenPhong");
                                while (seenRoom.next()) {
                                %>
                                        <tr>
                                            <td scope="row" data-label="Account">
                                                <%= seenRoom.getString("TenPhong") %>
                                            </td>
                                            <td data-label="Due Date">
                                                <%= seenRoom.getInt("SoLuongSinhVien") %>
                                            </td>
                                            <td data-label="Due Date">
                                                <%
                                            int tinhtrang=seenRoom.getInt("SoLuongSinhVien");
                                            if(tinhtrang>=4){
                                                out.print("Đầy phòng");
                                            }else{
                                                out.print("Còn trống");

                                            }
                                            %>
                                            </td>
                                            <td>
                                                <div>
                                                    <a href='../thuephong/showstudentinrom.jsp?id=<% out.print(seenRoom.getString("MaPhong")); %>' class="a"><i class="fa-solid fa-eye"></i></a>
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                }
                                %>
                                </tbody>
                            </table>

                        </div>

                        <div class="tab-pane" id="3">
                            <table>
                                <h1 class="caption" style="color:whitesmoke; font-weight: 700; padding: 20px 10px; text-transform: uppercase;">Danh sách sinh viên</h1>
                                <thead>
                                    <tr style="color: #04364A;">
                                        <th scope="col">Mã sinh viên</th>
                                        <th scope="col">Tên sinh viên</th>
                                        <th scope="col">Số điện thoại</th>
                                        <th scope="col">Tên lớp</th>
                                        <th scope="col">Quê quán</th>
                                        <th scope="col">Sửa phòng</th>
                                        <th scope="col">Xoá phòng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                ResultSet sv = stmt.executeQuery("select * from sinhvien,lop where sinhvien.MaLop=lop.MaLop");
                                while(sv.next()){
                                %>
                                        <tr style="z-index:0">
                                            <td data-label="Account">
                                                <%=sv.getString("MaSV")%>
                                            </td>
                                            <td data-label="Account">
                                                <%=sv.getString("TenSV")%>
                                            </td>
                                            <td data-label="Due Date">
                                                <%=sv.getString("SoDienThoai")%>
                                            </td>
                                            <td data-label="Period">
                                                <%=sv.getString("TenLop")%>
                                            </td>
                                            <td data-label="Period">
                                                <%=sv.getString("QueQuan")%>
                                            </td>
                                            <td>
                                                <div>
                                                    <a class="a" href='../student/show1studentupdate.jsp?id=<% out.print(sv.getString( "MaSV")); %>'><i class="fa-solid fa-user-pen"></i></i>
                                                    </a>
                                                </div>
                                            </td>
                                            <td>
                                                <div>

                                                    <a class="a" href='../student/deletestudent.jsp?id=<% out.print(sv.getString("MaSV")); %>'><i class="fa-solid fa-user-minus"></i></a>
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                }
                                    %>
                                </tbody>
                            </table>
                            <div class="crud">
                                <div style="position: block; z-index: 999;">
                                    <label class="txcrud" for="">Thêm sinh viên</label>
                                    <a class="a" href="../student/show1studentadd.jsp"><i class="fa-solid fa-user-plus"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="4">

                            <table>
                                <h1 class="caption" style="color:whitesmoke; font-weight: 700;justify-content: center;text-align: center; padding: 20px 10px; text-transform: uppercase;">Phiếu đăng ký phòng trọ của sinh viên</h1>
                                <thead>
                                    <tr style="color: #04364A;">
                                        <th scope="col">Mã sinh viên</th>
                                        <th scope="col">Ngày bắt đầu</th>
                                        <th scope="col">Ngày kết thúc</th>
                                        <th scope="col">Duyệt</th>
                                        <th scope="col">Xóa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                ResultSet phieu = stmt.executeQuery("select * from phieudangky");
                                while(phieu.next()){
                                %>
                                        <tr>
                                            <td scope="row" data-label="Account">
                                                <%=phieu.getString("MaSV")%>
                                            </td>
                                            <td data-label="Due Date">
                                                <%=phieu.getString("BatDau")%>
                                            </td>
                                            <td data-label="Due Date">
                                                <%=phieu.getString("KetThuc")%>
                                            </td>
                                            <td>
                                                <div>
                                                    <a class="a" href='../duyet/showduyetsvdki.jsp?id=<% out.print(phieu.getString("MaSV")); %>'><i class="fa-solid fa-check"></i></a>
                                                </div>
                                            </td>
                                            <td>
                                                <div>
                                                    <a class="a" href='../duyet/xoaphieuduyet.jsp?id=<% out.print(phieu.getString("MaSV")); %>'><i class="fa-solid fa-x"></i></i></a>
                                                </div>
                                            </td>
                                        </tr>
                                        <%                                   
                                }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </div>

                    <script>
                        const $ = document.querySelector.bind(document);
                        const $$ = document.querySelectorAll.bind(document);
                        const tabs = $$('.tab-item');
                        const panes = $$('.tab-pane');
                        const line = $('.tabs .line');

                        tabs.forEach((tab, index) => {
                            const pane = panes[index];
                            tab.onclick = function() {
                                line.style.left = this.offsetLeft + "px";
                                line.style.width = this.offsetWidth + "px";
                            }

                            tab.addEventListener("click", () => {
                                const activeTab = document.querySelector('.tab-item.active');
                                const activePane = document.querySelector('.tab-pane.active');

                                if (activeTab) {
                                    activeTab.classList.remove('active');
                                }

                                if (activePane) {
                                    activePane.classList.remove('active');
                                }
                                tab.classList.add('active');
                                pane.classList.add('active');

                                sessionStorage.setItem('activeTabIndex', index);
                            });
                        });

                        const activeTabIndex = sessionStorage.getItem('activeTabIndex');
                        if (activeTabIndex !== null) {

                            tabs[activeTabIndex].click();
                        }
                    </script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.js "></script>
    </body>


    </html>

    </html>