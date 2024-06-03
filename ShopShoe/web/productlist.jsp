<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : home
    Created on : Jul 8, 2023, 10:18:43 PM
    Author     : chi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Shoe Shop</title>

        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>
    <body>


        <jsp:include page="header.jsp"/>


        <section class="featured spad">
            <div class="container">



                <style>
                    @media only screen and (max-width: 768px) {
                        #container {
                            flex-direction: column;
                            align-items: center;
                        }

                        #top-functions-area {
                            flex-direction: column;
                            align-items: center;
                        }

                        .flt-item {
                            margin: 10px 0;
                        }
                    }
                    body {
                        font-family: 'Arial', sans-serif;
                        margin: 0;
                        padding: 0;
                        background-color: #f5f5f5;
                    }

                    #container {
                        display: flex;
                        /*justify-content: space-around;*/
                        color: #212529;
                        max-width: auto;
                        margin-bottom:  80px ;
                        background-color: #da0835;
                        padding: 10px;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                        border-radius: 0px;
                    }

                    #top-functions-area {
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                        margin-bottom: 20px;
                    }

                    .flt-item {
                        margin: 10px;
                    }

                    select,
                    input {
                        margin: 5px;
                        padding: 10px;
                        border: 1px solid #ccc;
                        border-radius: 4px;
                    }

                    button {
                        background-color: #da0835;
                        color: #da0835;
                        border: none;
                        padding: 10px 20px;
                        border-radius: 4px;
                        cursor: pointer;
                    }

                    /* Thêm các kiểu CSS trang trí tùy thuộc vào ý muốn của bạn */

                    /* Một số kiểu CSS để làm đẹp */
                    select, input, button {
                        transition: all 0.3s ease-in-out;
                    }

                    select:hover, input:hover, button:hover {
                        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
                    }

                    button:hover {
                        background-color: #45a049;
                    }
                </style>
                </head>
                <body>

                    <div id="container">
                        <form action="productlist" method="get">
                            <div id="top-functions-area" class="top-functions-area">
                                <div class="flt-item to-left">
                                    <select name="categoryId" onchange="this.form.submit()" class="form-select">
                                        <option value="">All Category</option>
                                        <c:forEach var="c" items="${clist}">
                                            <option value="${c.getId()}" ${param['categoryId'] == c.getId()?"selected":""}>${c.getName()}</option>
                                        </c:forEach>
                                    </select>

                                    <script>
                                        function searchAjax(param) {
                                            var txt = param.value;
                                            console.log(txt);
                                            $.ajax({
                                                url: "searchajax",
                                                type: "get",
                                                data: {
                                                    search: txt

                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },
                                                error: function (xhr) {

                                                }

                                            });
                                        }
                                    </script>
                                </div>
                                <div class="flt-item to-left">
                                    <input oninput="searchAjax(this)" type="text" name="search" placeholder="What do you need?">



                                </div>
                                <div class="flt-item to-left">
                                    <select name="brandId" onchange="this.form.submit()" class="form-select">
                                        <option value="">All Brand</option>
                                        <c:forEach var="c" items="${listBrand}">
                                            <option value="${c.getId()}" ${param['brandId']==c.getId()?"selected":""}>${c.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="flt-item to-left">
                                    <select name="option" onchange="this.form.submit()" class="form-select">
                                        <option ${tag == 0 ?"selected":""} value="0">Sort</option>
                                        <option ${tag == 1 ?"selected":""} value="1">Price Ascending</option>
                                        <option ${tag == 2 ?"selected":""} value="2">Price Descending</option>
                                    </select>
                                </div>

                            </div>
                        </form>

                    </div>

                </body>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2> Product</h2>
                        </div>
                    </div>
                </div>
                <div  id="content"class="row featured__filter">
                    <c:forEach var="o" items="${listP}">
                        <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                            <div class="featured__item">
                                <div class="featured__item__pic set-bg" data-setbg="img/${o.image}" >
                                    <ul class="featured__item__pic__hover" >
                                        <li><a href="addtocart?pid=${o.id}&quantity=1"><i class="fas fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="featured__item__text">
                                    <h6><a href="detail?id=${o.id}">${o.name}</a></h6>
                                    <h5>$ ${o.price}</h5>
                                </div>
                            </div>
                        </div>


                    </c:forEach>
                </div>

                <!--                <div  >
                                    <ul class="pagination row" style="display: flex; justify-content: center; flex-direction: row;">
                <c:forEach var = "i" begin = "1" end = "${numberPage}">
                                       <li  class="page-item next"><a href="productlist?index=1&categoryId=${param['categoryId']}&brandId=${param['brandId']}"><i class="fa fa-angle-left" class="page-link" aria-hidden="true"></i></a></li>
                                              
                                           <li class="${param['index']==i?'page-item active':'page-item'}"><a href="productlist?index=${i}&categoryId=${param['categoryId']}&brandId=${param['brandId']}"   class="page-link">${i}</a></li>
                </c:forEach>
            <li  class="page-item next"><a href="productlist?index=${numberPage}&categoryId=${param['categoryId']}&brandId=${param['brandId']}"><i class="fa fa-angle-right" class="page-link" aria-hidden="true"></i></a></li>
        </ul>
   </div>--> 
                <div class="product__pagination" style="display: flex; justify-content: center; flex-direction: row;">
                    <c:forEach var = "i" begin = "2" end = "${numberPage}">
                        <a href="productlist?index=${numberPage-1}&categoryId=${param['categoryId']}&brandId=${param['brandId']}"><i class="fas fa-arrow-left"></i></a>
                        <a href="productlist?index=1&categoryId=${param['categoryId']}&brandId=${param['brandId']}">1</a>
                        <a href="productlist?index=${i}&categoryId=${param['categoryId']}&brandId=${param['brandId']}">2</a>
                        <!--<a href="productlist?index=${numberPage}&categoryId=${param['categoryId']}&brandId=${param['brandId']}">3</a>-->
                        <a href="productlist?index=${numberPage}&categoryId=${param['categoryId']}&brandId=${param['brandId']}"><i class="fas fa-arrow-right"></i></a>
     
                        </c:forEach>
                </div>
            </div>
        </section>

               <!-- Footer Section Begin -->
        <footer class="footer spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="footer__about">
                            <div class="footer__about__logo">
                                <a href="./index.jsp"><img src="img/logo2.png1" alt=""></a>
                            </div>
                            <ul>
                                <li>Address: FPT university, Thach That, Thach Hoa, Ha Noi</li>
                                <li>Phone: +84  971079629</li>
                                <li>Email:manhlche176152@fpt.edu.vn</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                        <div class="footer__widget">
                            <h6>Useful Links</h6>
                            <ul>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">About Our Shop</a></li>
                                <li><a href="#">Secure Shopping</a></li>
                                <li><a href="#">Delivery infomation</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Our Sitemap</a></li>
                            </ul>
                            <ul>
                                <li><a href="#">Who We Are</a></li>
                                <li><a href="#">Our Services</a></li>
                                <li><a href="#">Projects</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Innovation</a></li>
                                <li><a href="#">Testimonials</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12">
                        <div class="footer__widget">
                            <h6>Join Our Newsletter Now</h6>
                            <p>Get E-mail updates about our latest shop and special offers.</p>
                            <form action="#">
                                <input type="text" placeholder="Enter your mail">
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>
                            <div class="footer__widget__social">
                                <a href="#"><i class="fab fa-facebook"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer__copyright">
                            <div class="footer__copyright__text"><p><!-- Link back to Manh Le can't be removed. Template is licensed under CC BY 3.0. -->
                                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fas fa-heart" aria-hidden="true"></i> by <a href="https://www.facebook.com/profile.php?id=100039924710594&mibextid=ZbWKwL" target="_blank">Manh Le</a>
                                    <!-- Link back to Manh Le can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                            <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->


        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>

        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script>
                                            window.dataLayer = window.dataLayer || [];
                                            function gtag() {
                                                dataLayer.push(arguments);
                                            }
                                            gtag('js', new Date());

                                            gtag('config', 'UA-23581568-13');
        </script>
        <script defer src="https://static.cloudflareinsights.com/beacon.min.js/v52afc6f149f6479b8c77fa569edb01181681764108816" integrity="sha512-jGCTpDpBAYDGNYR5ztKt4BQPGef1P0giN6ZGVUi835kFF88FOmmn8jBQWNgrNd8g/Yu421NdgWhwQoaOPFflDw==" data-cf-beacon='{"rayId":"7e389c4cf8d804c9","version":"2023.4.0","b":1,"token":"cd0b4b3a733644fc843ef0b185f98241","si":100}' crossorigin="anonymous"></script>
    </body>
</html>
