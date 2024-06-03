
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
         <main>
               
                <div class="col-md-4" style="margin-left: 50px">
                    <a href="categorylist" target="_parent" class="tm-register">
                        <i> <-Back </i>
                    </a>
                </div>
                <div class="tm-paging-links">
                    <nav>
                        <ul>
                            <c:set var="c" value="${requestScope.cate}"/>
                            <div class="col-md-6">
                                <h3 style="color: red">${requestScope.ms}</h3>
                                <form action="addcategory" >
                                    
                                    <div class="form-group">
                                        <input type="text" name="categoryName"  class="form-control" placeholder="Category name" required="" />
                                         <input type="text" name="description"  class="form-control" placeholder="description" required="" />
                                          <input type="text" name="status"  class="form-control" placeholder="status" required="" />
                                    </div>
                                    
                                    <div class="form-group tm-d-flex">
                                        <input type="submit" class="tm-btn tm-btn-success tm-btn" value="Add">
                                    </div>
                            </div> 
                            </form>
                        </ul>
                    </nav>
                </div>

            </main>
                                
            <jsp:include page="footer.jsp"/>                    
            <script src="js/jquery.min.js"></script>
        <script src="js/parallax.min.js"></script>
        <script>
            $(document).ready(function () {
                // Handle click on paging links
                $('.tm-paging-link').click(function (e) {
                    e.preventDefault();

                    var page = $(this).text().toLowerCase();
                    $('.tm-gallery-page').addClass('hidden');
                    $('#tm-gallery-page-' + page).removeClass('hidden');
                    $('.tm-paging-link').removeClass('active');
                    $(this).addClass("active");
                });
            });
        </script>                    
    </body>
</html>
