<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            }
            
            table {
                border: 1px solid #ccc;
                border-collapse: collapse;
                margin: 0;
                padding: 0;
                width: 100%;
                table-layout: fixed;
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
                padding-left: 20px;
                font-size: 20px;
            }
            
            .crud {
                opacity: 1;
                display: flex;
                padding: 30px 0;
                text-transform: uppercase;
                justify-content: space-around;
                font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
            }
        </style>
    </head>

    <body>
        <%@ page import="java.sql.*" %>
            <%

            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/qlktx1","root","");
            Statement stmt=con.createStatement();
            String maphong=request.getParameter("id");

%>
                <%@ include file="../main/main.jsp" %>
                    <table>
                        <h1 class="caption" style="color:whitesmoke;margin-top: 80px;font-weight: 700;justify-content: center;text-align: center; padding: 20px 10px; text-transform: uppercase;">Danh sách sinh viên trong phòng</h1>

                        <thead style="margin-top: 50px;">
                            <tr style="color: #04364A;">
                                <th scope="col">Mã số sinh viên</th>
                                <th scope="col">Tên sinh viên</th>
                                <th scope="col">Số điện thoại</th>
                                <th scope="col">Tên lớp</th>
                                <th scope="col">Quê quán</th>
                                <th scope="col">Thanh toán</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                        ResultSet seenRoom = stmt.executeQuery("SELECT sinhvien.*, tt_thuephong.ThanhToan, lop.TenLop FROM tt_thuephong INNER JOIN sinhvien ON tt_thuephong.MaSV = sinhvien.MaSV INNER JOIN lop ON lop.MaLop = sinhvien.MaLop WHERE tt_thuephong.MaPhong = '"+maphong+"'");
                        while (seenRoom.next()) {
                            %>
                                <tr>
                                    <td scope="row" data-label="Account">
                                        <% out.print(seenRoom.getString("MaSV"));%>
                                    </td>
                                    <td scope="row" data-label="Account">
                                        <% out.print(seenRoom.getString("TenSV"));%>
                                    </td>
                                    <td scope="row" data-label="Account">
                                        <% out.print(seenRoom.getString("SoDienThoai"));%>
                                    </td>
                                    <td scope="row" data-label="Account">
                                        <% out.print(seenRoom.getString("TenLop"));%>
                                    </td>
                                    <td scope="row" data-label="Account">
                                        <% out.print(seenRoom.getString("QueQuan"));%>
                                    </td>
                                    <td scope="row" data-label="Account">
                                        <% out.print(seenRoom.getString("ThanhToan"));%>
                                    </td>


                                </tr>

                                <%
        }
        %>
                                    <form action="../thuephong/showThanhToan.jsp" method="post">
                                        <div class="container" style="position: relative;">
                                            <button type="submit" style=" float: right;margin-bottom: 30px;"><i class="fa-solid fa-magnifying-glass"></i>Liệt kê sinh viên chưa đóng tiền trọ  </button>
                                        </div>
                                    </form>
                        </tbody>
                    </table>

    </body>

    </html>