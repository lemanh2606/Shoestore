<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">
  <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">
        <title>Sign in</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-lugx-gaming.css">
        <link rel="stylesheet" href="assets/css/owl.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/swiper-bundle.min.css"/>

  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    </head>


    <body onload="reloadCaptcha()">

        <!-- ***** Preloader Start ***** -->
        <div id="js-preloader" class="js-preloader">
            <div class="preloader-inner">
                <span class="dot"></span>
                <div class="dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <!-- ***** Preloader End ***** -->

        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li><a href="signup.jsp">Sign up</a></li>
                            </ul>
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <!-- ***** Header Area End ***** -->

        <div class="page-heading header-text mb-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
            </div>
        </div>

        <div class="row justify-content-center">
            <div class="login-wrap p-4 p-md-5 col-lg-4">
                <div class="col-lg-10 mx-auto">
                    <div class="card-header text-center p-3 mb-4">
                        <h2 class="m-0">SIGN IN</h2>
                    </div>
                    <form action="${pageContext.request.contextPath}/login" method="post" id="LoginForm">
                        <!-- -----------------input field---------------- -->
                        <div class="form-group mb-3">
                            <label class="label">Username</label>
                            <input type="text" class="form-control" placeholder="Username"  name="user"
                                   >
                        </div>
                        <div class="form-group mb-3">
                            <label class="label">Password</label>
                            <input type="password" class="form-control" placeholder="Password"  name="pass"
                                   >
                        </div>
                        <!-- -----------------captcha field---------------- -->
                        <div class="form-group mb-3">
                            <label class="label">Captcha</label>
                            <div class="d-flex align-content-center">
                                <div class="content">
                                    <img style="height: 48px; width: 200px; border-radius: 5px" src="generateCaptcha"
                                         alt="Captcha Image"
                                         id="captchaImage">
                                </div>
                                <button class="btn input-group-prepend" onclick="resetCaptcha(event)">
                                    <i class="fa fa-refresh"></i>
                                </button>
                                <input type="text" class="form-control" name="captcha" required placeholder="Enter Captcha"/>
                            </div>
                        </div>
                        <!-- -----------------error field---------------- -->
                        <div class="text-danger mb-2" id="error"></div>
                        <h6 class="text-danger mb-2">${error}</h6>
                        <!-- -----------------sign in button---------------- -->
                        <div class="form-group mb-3 text-center">
                            <button type="submit" name="action" value="Login" class="col-lg-5 btn btn-primary btn-lg button-border">SIGN IN</button>
                        </div>
                        <!-- -----------------remember me and forgot---------------- -->
                        <div class="form-group d-md-flex mb-3">
                            <div class="w-50 text-left">
                                <label class="form-check text-muted">Remember Me <input class="form-check-input" type="checkbox"
                                                                                        name="remember"><span
                                                                                        class="checkmark"></span></label>
                            </div>
                            <div class="w-50 text-muted" style="text-align: end;">
                                <a href="forgot.jsp">Forgot Password</a>
                            </div>
                        </div>
                    </form>
                    <div style="margin: 20px auto; width: fit-content; text-align: center;">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:9999/demo4/LoginGoogleHandler&response_type=code&client_id=682157088342-pneskdoadv76c8kh40mbs2enfm1bqcpn.apps.googleusercontent.com&approval_prompt=force"
                           style="border: 1px solid #333; border-radius: 20px; text-decoration: none; padding: 1% 4%;">
                            <img src="assets/images/Google__G__Logo.svg.png" style="width: 4%;"> Login With Google
                        </a>
                    </div>
                    <p class="text-center" style="font-size: 15px;">Not a member? <a data-toggle="tab" href="signup.jsp">Sign
                            Up Here</a></p>
                </div>
            </div>
        </div>


        <footer>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="d-md-flex col-lg-12 align-self-center">
                        <p class="w-50" style="font-weight: bold; font-size: 110%; margin-left: auto; margin-top: 10px;">Powered
                            by: Manhle © 2024.</p>
                        <p class="w-50" style="font-weight: bold; font-size: 110%; margin-right: auto; margin-top: 10px;">Email
                            Contact: manhlche176152@fpt.edu.vn</p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Scripts -->
        <script>
            function reloadCaptcha() {
                var timestamp = new Date().getTime();
                var captchaImage = document.getElementById('captchaImage');
                captchaImage.src = 'generateCaptcha?' + timestamp;
            }

            function resetCaptcha(event) {
                event.preventDefault(); // Ngăn chặn hành vi mặc định của button (submit form)
                reloadCaptcha(); // Gọi hàm tạo mới captcha ở đây
            }

            document.addEventListener("DOMContentLoaded", function () {
                var form = document.getElementById("form");
                var sendButton = document.querySelector("#form [type=submit]");

                form.addEventListener("keypress", function (event) {
                    if (event.key === "Enter") {
                        event.preventDefault();
                        sendButton.click();
                    }
                });
            });
            
            
            document.addEventListener("DOMContentLoaded", function () {
        // Lấy thông báo từ session
        const loginMessage = "<%= session.getAttribute("loginMessage") %>";
        if (loginMessage === "success") {
            Swal.fire({
                title: 'Login Successful!',
                text: 'You have successfully logged in.',
                icon: 'success',
                confirmButtonText: 'OK'
            });
        } else if (loginMessage === "fail") {
            Swal.fire({
                title: 'Login Failed!',
                text: 'Invalid username or password.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        }
        <% session.removeAttribute("loginMessage"); %> // Xóa thông báo sau khi hiển thị
    });
        </script>
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/isotope.min.js"></script>
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/counter.js"></script>
        <script src="assets/js/custom.js"></script>


    </body>

</html>
