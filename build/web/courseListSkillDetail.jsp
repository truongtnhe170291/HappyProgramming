<%-- 
    Document   : courseListSkillDetail
    Created on : May 21, 2024, 3:39:50 PM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="en"> <![endif]-->
<html lang="en">

<head>
  	<meta charset="utf-8">
    <title>Fmaster</title>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1, user-scalable=no">
    
    <!-- Favicons-->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon"/>
    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


    
    <!-- CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/superfish.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="fontello/css/fontello.css" rel="stylesheet">
    <style>
                body {
            font-family: Arial, sans-serif;
        }

        .col-item {
            background: #fff;
            border: 1px solid #e1e1e1;
            border-radius: 5px;
            overflow: hidden;
            margin: 15px 0;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .col-item:hover {
            transform: translateY(-5px);
        }

        .ribbon_course {
            width: 100px;
            height: 30px;
            background: #f44336;
            position: absolute;
            top: 10px;
            left: -10px;
            text-align: center;
            line-height: 30px;
            color: #fff;
            font-size: 14px;
            transform: rotate(-45deg);
        }

        .photo img {
            width: 100%;
            height: auto;
            border-bottom: 1px solid #e1e1e1;
        }

        .cat_row {
            background: #f7f7f7;
            padding: 10px;
            border-top: 1px solid #e1e1e1;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .cat_row a {
            color: #007bff;
            text-decoration: none;
        }

        .info {
            padding: 15px;
        }

        .info h4 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #333;
        }

        .info p {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
        }

        .rating i {
            color: #ff9800;
            margin-right: 2px;
        }

        .price {
            font-size: 18px;
            font-weight: bold;
            color: #f44336;
        }

        .separator {
            border-top: 1px solid #e1e1e1;
            padding-top: 10px;
            margin-top: 10px;
            display: flex;
            justify-content: space-between;
        }

        .btn-add a, .btn-details a {
            color: #fff;
            text-decoration: none;
            display: inline-block;
            padding: 10px 20px;
            border-radius: 25px;
            transition: background 0.3s ease;
        }

        .btn-add a {
            background: #4caf50;
        }

        .btn-add a:hover {
            background: #45a049;
        }

        .btn-details a {
            background: #007bff;
        }

        .btn-details a:hover {
            background: #0069d9;
        }

    </style>
    
  </head>
  
  <body>
      <jsp:include page="header.jsp"/>
    
    
    <section id="main_content">
    	<div class="container">
        
        <ol class="breadcrumb">
          <li><a href="#">Home</a></li>
          <li class="active">About</li>
        </ol>
        
        <div class="row">
        
        <aside class="col-lg-3 col-md-4 col-sm-4">
            <div class="box_style_1">
            	<h4>Categories</h4>
            <ul class="submenu-col">
                <li><a href="#" id="active">All Courses</a></li>
                <li><a href="course_details_2.html">Administration (10)</a></li>
                <li><a href="course_details_2.html">Business (08)</a></li>
                <li><a href="course_details_2.html">Communication (05) <img src="img/new.png" alt="New" class="hidden-"></a></li>
                <li><a href="course_details_2.html">Computing (08) </a></li>
                <li><a href="course_details_2.html">Counseling (04)</a></li>
                <li><a href="course_details_2.html">Education (06)</a></li>
                <li><a href="course_details_2.html">Engineering (08)</a></li>
            </ul>
            
            <hr>
            
            <h5>Upcoming Courses</h5>
            <p>Suspendisse quis risus turpis, ut pharetra arcu. Donec adipiscing, quam non faucibus luctus, mi arcu blandit diam, at faucibus mi ante vel augue.</p>
            </div>
        </aside>
        
        <div class="col-lg-9 col-md-8 col-sm-8">
        	<div class="row">
        		<div class="col-lg-4 col-md-6">
        <div class="col-item">
            <span class="ribbon_course"></span>
            <div class="photo">
                <a href="#"><img src="img/poetry.jpg" alt="" /></a>
                <div class="cat_row">
                    <a href="#">LITERATURE</a>
                    <span class="pull-right"><i class="fa fa-clock"></i> 6 Days</span>
                </div>
            </div>
            <div class="info">
                <div class="row">
                    <div class="course_info col-md-12 col-sm-12">
                        <h4>Poetry course</h4>
                        <p>Lorem ipsum dolor sit amet, no sit sonet corpora indoctum, quo ad fierent insolens. Duo aeterno ancillae ei.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i>
                        </div>
                        <div class="price pull-right">$199</div>
                    </div>
                </div>
                <div class="separator clearfix">
                    <p class="btn-add"><a href="apply_2.html"><i class="fa fa-sign-out-alt"></i> Subscribe</a></p>
                    <p class="btn-details"><a href="course_details_1.html"><i class="fa fa-list"></i> Details</a></p>
                </div>
            </div>
        </div>
    </div>
                        
                        <div class="col-lg-4 col-md-6">
        <div class="col-item">
            <span class="ribbon_course"></span>
            <div class="photo">
                <a href="#"><img src="img/poetry.jpg" alt="" /></a>
                <div class="cat_row">
                    <a href="#">LITERATURE</a>
                    <span class="pull-right"><i class="fa fa-clock"></i> 6 Days</span>
                </div>
            </div>
            <div class="info">
                <div class="row">
                    <div class="course_info col-md-12 col-sm-12">
                        <h4>Poetry course</h4>
                        <p>Lorem ipsum dolor sit amet, no sit sonet corpora indoctum, quo ad fierent insolens. Duo aeterno ancillae ei.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i>
                        </div>
                        <div class="price pull-right">$199</div>
                    </div>
                </div>
                <div class="separator clearfix">
                    <p class="btn-add"><a href="apply_2.html"><i class="fa fa-sign-out-alt"></i> Subscribe</a></p>
                    <p class="btn-details"><a href="course_details_1.html"><i class="fa fa-list"></i> Details</a></p>
                </div>
            </div>
        </div>
    </div>
                        
                        <div class="col-lg-4 col-md-6">
        <div class="col-item">
            <span class="ribbon_course"></span>
            <div class="photo">
                <a href="#"><img src="img/poetry.jpg" alt="" /></a>
                <div class="cat_row">
                    <a href="#">LITERATURE</a>
                    <span class="pull-right"><i class="fa fa-clock"></i> 6 Days</span>
                </div>
            </div>
            <div class="info">
                <div class="row">
                    <div class="course_info col-md-12 col-sm-12">
                        <h4>Poetry course</h4>
                        <p>Lorem ipsum dolor sit amet, no sit sonet corpora indoctum, quo ad fierent insolens. Duo aeterno ancillae ei.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i>
                        </div>
                        <div class="price pull-right">$199</div>
                    </div>
                </div>
                <div class="separator clearfix">
                    <p class="btn-add"><a href="apply_2.html"><i class="fa fa-sign-out-alt"></i> Subscribe</a></p>
                    <p class="btn-details"><a href="course_details_1.html"><i class="fa fa-list"></i> Details</a></p>
                </div>
            </div>
        </div>
    </div>
                        
                       <div class="col-lg-4 col-md-6">
        <div class="col-item">
            <span class="ribbon_course"></span>
            <div class="photo">
                <a href="#"><img src="img/poetry.jpg" alt="" /></a>
                <div class="cat_row">
                    <a href="#">LITERATURE</a>
                    <span class="pull-right"><i class="fa fa-clock"></i> 6 Days</span>
                </div>
            </div>
            <div class="info">
                <div class="row">
                    <div class="course_info col-md-12 col-sm-12">
                        <h4>Poetry course</h4>
                        <p>Lorem ipsum dolor sit amet, no sit sonet corpora indoctum, quo ad fierent insolens. Duo aeterno ancillae ei.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i>
                        </div>
                        <div class="price pull-right">$199</div>
                    </div>
                </div>
                <div class="separator clearfix">
                    <p class="btn-add"><a href="apply_2.html"><i class="fa fa-sign-out-alt"></i> Subscribe</a></p>
                    <p class="btn-details"><a href="course_details_1.html"><i class="fa fa-list"></i> Details</a></p>
                </div>
            </div>
        </div>
    </div>
                        
                        <div class="col-lg-4 col-md-6">
        <div class="col-item">
            <span class="ribbon_course"></span>
            <div class="photo">
                <a href="#"><img src="img/poetry.jpg" alt="" /></a>
                <div class="cat_row">
                    <a href="#">LITERATURE</a>
                    <span class="pull-right"><i class="fa fa-clock"></i> 6 Days</span>
                </div>
            </div>
            <div class="info">
                <div class="row">
                    <div class="course_info col-md-12 col-sm-12">
                        <h4>Poetry course</h4>
                        <p>Lorem ipsum dolor sit amet, no sit sonet corpora indoctum, quo ad fierent insolens. Duo aeterno ancillae ei.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i>
                        </div>
                        <div class="price pull-right">$199</div>
                    </div>
                </div>
                <div class="separator clearfix">
                    <p class="btn-add"><a href="apply_2.html"><i class="fa fa-sign-out-alt"></i> Subscribe</a></p>
                    <p class="btn-details"><a href="course_details_1.html"><i class="fa fa-list"></i> Details</a></p>
                </div>
            </div>
        </div>
    </div>
                        
                        <div class="col-lg-4 col-md-6">
        <div class="col-item">
            <span class="ribbon_course"></span>
            <div class="photo">
                <a href="#"><img src="img/poetry.jpg" alt="" /></a>
                <div class="cat_row">
                    <a href="#">LITERATURE</a>
                    <span class="pull-right"><i class="fa fa-clock"></i> 6 Days</span>
                </div>
            </div>
            <div class="info">
                <div class="row">
                    <div class="course_info col-md-12 col-sm-12">
                        <h4>Poetry course</h4>
                        <p>Lorem ipsum dolor sit amet, no sit sonet corpora indoctum, quo ad fierent insolens. Duo aeterno ancillae ei.</p>
                        <div class="rating">
                            <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star-o"></i>
                        </div>
                        <div class="price pull-right">$199</div>
                    </div>
                </div>
                <div class="separator clearfix">
                    <p class="btn-add"><a href="apply_2.html"><i class="fa fa-sign-out-alt"></i> Subscribe</a></p>
                    <p class="btn-details"><a href="course_details_1.html"><i class="fa fa-list"></i> Details</a></p>
                </div>
            </div>
        </div>
    </div>
       		</div><!-- End row -->
        </div><!-- End col-lg-9-->
        
        			
                        
        </div><!-- End row -->
        
        <hr>
        <div class="row">
        	<div class="col-md-12 text-center">
            	<ul class="pagination">
                  <li><a href="#">&laquo;</a></li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li><a href="#">&raquo;</a></li>
                </ul>
            </div>
        </div>
            	
        </div><!-- End container -->
    </section><!-- End main_content -->


<div id="toTop">Back to top</div>

<!-- JQUERY -->
<script src="jss/jquery-2.2.4.min.js"></script>


<!-- OTHER JS --> 
<script src="jss/superfish.js"></script>
<script src="jss/bootstrap.min.js"></script>
<script src="jss/retina.min.js"></script>
<script src="assets/validate.js"></script>
<script src="jss/jquery.placeholder.js"></script>
<script src="jss/functions.js"></script>
<script src="jss/classie.js"></script>
<script src="jss/uisearch.js"></script>
<script>new UISearch( document.getElementById( 'sb-search' ) );</script>


  </body>
</html>
