<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manh Le</title>
        <style>
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }

        .modal-dialog {
            margin-top: 50px;
        }

        .modal-content {
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }

        .modal-content h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #007bff;
            outline: none;
        }

        .btn-primary {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
        <!--Boostrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <!--Font-->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
        <!--Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous"> 
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
        <!--CSS-->
        <link href="css/EditAccount.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="./css/style.css" />
        <link rel="stylesheet" type="text/css" href="./css/queries.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/queries.css">
        <!--ICON-->
        <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">
    </head>
    <body>

        <header>
            <div class="row m-0 p-0">
                <span id="promo" class="d-lg-block d-none">
                    <marquee style="width: 100%" behavior="scroll" direction="left"><i>Get 10% SALE by using special discount code "CHEERSLUV"</i></marquee>
                </span>
            </div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <!-- LOGO -->
                <a class="navbar-brand col-lg-2 offset-lg-2 logo" href="${pageContext.request.contextPath}/home">
                    <img src="${pageContext.request.contextPath}/resources/img/logoo.png"> </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" 
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" 
                               href="${pageContext.request.contextPath}/product?page=1&query=&subcategory=0&brand=0&price=0&sortType=0&sortMode=0">Product</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#part-1">Contacts Us</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0" method="get" action="${pageContext.request.contextPath}/product">
                        <input type="hidden" name="page" value="1"/>
                        <input name="query" class="form-control mr-sm-2" type="search" placeholder="Search here..." aria-label="Search">
                        <input type="hidden" name="subcategory" value="0"/>
                        <input type="hidden" name="brand" value="0"/>
                        <input type="hidden" name="price" value="0"/>
                        <input type="hidden" name="sortType" value="0"/>
                        <input type="hidden" name="sortMode" value="0"/>
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>
            </nav>
        </header>

        <div class="container mt-5">
            <div class="modal-dialog">
                <div class="modal-content">
                    <h2>  Add New Account</h2>
                    <form action="addAccount" method="post">
                        <div class="form-group">
                            <label for="username">  Username</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">  Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="form-group">
                            <label for="email">  Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="roleID">  Role</label>
                            <select class="form-control" id="roleID" name="roleID">
                                <option value="1">Admin</option>
                                <option value="2">Seller</option>
                                <option value="3">Customer</option>
                                <option value="4">Marketing</option>
                                <option value="5">Shipper</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="statusID">  Status</label>
                            <select class="form-control" id="statusID" name="statusID">
                                <option value="1">Active</option>
                                <option value="2">Locked</option>
                                <option value="3">Gmail Login</option>
                                <option value="4">Unverified</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">  Add Account</button>
                    </form>
                </div>
            </div>
        </div>


        <footer class="text-white text-center text-lg-start" style="background-color: #23242a;" id="part-1">
            <!-- Section: Social media -->
            <section
                class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom"
                >
                <!-- Left -->
                <div class="me-5 d-none d-lg-block">
                    <span>Get connected with us on social networks:</span>
                </div>
                <!-- Left -->

                <!-- Right -->
                <div>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-google"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-linkedin"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-github"></i>
                    </a>
                </div>
                <!-- Right -->
            </section>
            <!-- Section: Social media -->

            <!-- Section: Links  -->
            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <!-- Grid row -->
                    <div class="row mt-3">
                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                            <!-- Content -->
                            <h5 class="text-uppercase mb-4"><i class="fas fa-tshirt"></i>&nbsp;About Manh Le</h5>
                            <p>
                                Our purpose at Manh Le is to empower people to lead bold and full lives. 
                            </p>

                            <p>
                                We believe that if you look good, you feel good. And when you feel good you can do good for others around you. Manh Le brings you a wide range of trendy shoes, all at affordable prices to make them accessible to you. 
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">
                                Products
                            </h6>
                            <p>
                                <a href="#!" class="text-reset">Low-Tops</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Mid-Top</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Running Shoes</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Training Shoes</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Basketball Shoes</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Tennis Shoes</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Badminton Shoes</a>
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">
                                Contact
                            </h6>
                            <p><i class="fas fa-home me-3"></i>Km29 Đại lộ Thăng Long, huyện Thạch Thất, Hà Nội</p>
                            <p>
                                <i class="fas fa-envelope me-3"></i>
                                shope@gmail.com
                            </p>
                            <p><i class="fas fa-phone me-3"></i>+84 123456789</p>
                            <p><i class="fas fa-print me-3"></i>+84 123456789</p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h5 class="text-uppercase mb-4"><i class="far fa-clock"></i>&nbsp;Opening hours</h5>
                            <table class="table text-white">
                                <tbody class="font-weight-normal">
                                    <tr>
                                        <td>Monday - Thurday:</td>
                                        <td>8am - 9pm</td>
                                    </tr>
                                    <tr>
                                        <td>Friday - Satủd:</td>
                                        <td>8am - 12pm</td>
                                    </tr>
                                    <tr>
                                        <td>Sunday:</td>
                                        <td>9am - 10pm</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                </div>
            </section>
            <!-- Section: Links  -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                © 2024 Copyright:
                <a class="text-white" href="#">Manh Le</a>
            </div>
            <!-- Copyright -->
        </footer>
    </body>
</html>

