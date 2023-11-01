<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/831fcd2ec7.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/login.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
        <link rel="stylesheet" href="css/header.css">
        <script></script>
        <title>Document</title>
        <style>
            img {
                border-radius: 50%;
            }
        </style>

        <body>
            <header>
                <section>
                    <div class="floating-bg">
                    </div>
                </section>
            </header>
            <div class="info">
                <div class="image">
                    <img style="height: 150px; width: 150px;" src="../img/logo.png" alt="">
                </div>
                <div class="title">
                    <h1>TRUNG TÂM QUẢN LÝ KÝ TÚC XÁ</h1>
                </div>
                <div class="post">
                    <h2>QUẢN LÝ KÍ TÚC XÁ CẦN THƠ</h2>
                </div>
                <div class="tabs">
                    <div class="tab-item active">
                        <i class="fa-solid fa-users"></i>User</div>
                    <div class="tab-item"><i class="fa-solid fa-user"></i>Admin</div>
                    <div class="line"></div>
                </div>
                <div class="tab-contents">
                    <div class="tab-pane bd active">
                        <form class="login" action="../login/handleLogin.jsp" method="post">
                            <div class="user">

                                <div class="title_role">User</div><br>
                                <div class="hide">
                                    <div class="login__field">
                                        <i class="login__icon fas fa-user"></i>
                                        <input type="text" name="user" class="login__input" placeholder="User name / Email">
                                    </div>
                                    <div class="login__field">
                                        <i class="login__icon fas fa-lock"></i>
                                        <input type="pass" name="pass" class="login__input" placeholder="Password">
                                    </div>
                                    <button class="button login__submit">
                                        <span class="button__text">Log In Now</span>
                                        <i class="button__icon fas fa-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane bd">
                        <form class="login" action="../login/handleloginadmin.jsp" method="post">
                            <div class="user">

                                <div class="title_role">Admin</div><br>
                                <div class="hide">
                                    <div class="login__field">
                                        <i class="login__icon fas fa-user"></i>
                                        <input type="text" name="user" class="login__input" placeholder="User name / Email">
                                    </div>
                                    <div class="login__field">
                                        <i class="login__icon fas fa-lock"></i>
                                        <input type="pass" name="pass" class="login__input" placeholder="Password">
                                    </div>
                                    <button class="button login__submit">
                                        <span class="button__text">Log In Now</span>
                                        <i class="button__icon fas fa-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <script>
                const $ = document.querySelector.bind(document);
                const $$ = document.querySelectorAll.bind(document);

                const tabActive = $('.tab-item.active');
                const line = $('.tabs .line');


                const tabs = $$('.tab-item');
                const panes = $$('.tab-pane');
                tabs.forEach((tab, index) => {

                    const pane = panes[index];
                    tab.onclick = function() {

                        line.style.left = this.offsetLeft + "px";
                        line.style.width = this.offsetWidth + "px";
                        $('.tab-item.active').classList.remove('active');
                        $('.tab-pane.active').classList.remove('active');

                        this.classList.add('active');
                        pane.classList.add('active');

                    }
                })
            </script>

        </body>


    </html>

    </html>