<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="author" content="INSPIRO" />
    <meta name="description" content="Themeforest Template Polo, html template">
    <link rel="icon" type="image/png" href="images/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Document title -->
    <title>POLO | The Multi-Purpose HTML5 Template</title>
    <!-- Stylesheets & Fonts -->
    <link href="css/plugins.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
        }

        h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .slider-container {
            position: relative;
            overflow: hidden;
        }

        .slider {
            display: flex;
            transition: transform 0.3s ease;
        }

        .slide {
            flex: 0 0 25%;
            padding: 0 10px;
            box-sizing: border-box;
        }

        .slide img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border: 1px solid #ddd;
        }

        .slide h3 {
            margin: 10px 0 5px;
            font-size: 16px;
        }

        .slide p {
            margin: 0;
            font-size: 14px;
            color: #666;
        }

        .arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(0,0,0,0.3);
            color: white;
            border: none;
            padding: 15px 10px;
            cursor: pointer;
            font-size: 20px;
            z-index: 10;
        }

        .arrow:hover {
            background: rgba(0,0,0,0.5);
        }

        .left {
            left: 0;
        }
        .right {
            right: 0;
        }
    </style>
</head>

<body>
    <div class="body-inner">
        <jsp:include page="header.jsp" />
        <section id="page-content" class="sidebar-right">
            <div class="container">
                <div class="row">
                    <!-- content -->
                    <div class="content col-lg-9">
                        <!-- Blog -->
                        <div id="blog" class="single-post">
                            <!-- Post item-->
                            <div class="post-item">
                                <div class="post-item-wrap">
                                    <div class="post-image">
                                        <a href="#">
                                            <img alt="" src="images/blog/1.jpg">
                                        </a>
                                    </div>
                                    <div class="post-item-description">
                                        <h2>Standard post with a single image</h2>

                                        <p>Curabitur pulvinar euismod ante, ac sagittis ante posuere ac. Vivamus luctus commodo dolor porta feugiat. Fusce at velit id ligula pharetra laoreet. Ut nec metus a mi ullamcorper hendrerit. Nulla facilisi. Pellentesque
                                            sed nibh a quam accumsan dignissim quis quis urna. The most happiest time of the day!. Praesent id dolor dui, dapibus gravida elit. Donec consequat laoreet sagittis. Suspendisse ultricies ultrices viverra. Morbi
                                            rhoncus laoreet tincidunt. Mauris interdum convallis metus.M</p>
                                        <div class="blockquote">
                                            <p>The world is a dangerous place to live; not because of the people who are evil, but because of the people who don't do anything about it.</p>
                                            <small>by <cite>Albert Einstein</cite></small>
                                        </div>
                                        <p> The most happiest time of the day!. Praesent id dolor dui, dapibus gravida elit. Donec consequat laoreet sagittis. Suspendisse ultricies ultrices viverra. Morbi rhoncus laoreet tincidunt. Mauris interdum convallis
                                            metus. Suspendisse vel lacus est, sit amet tincidunt erat. Etiam purus sem, euismod eu vulputate eget, porta quis sapien. Donec tellus est, rhoncus vel scelerisque id, iaculis eu nibh.</p>
                                        <p>Donec posuere bibendum metus. Quisque gravida luctus volutpat. Mauris interdum, lectus in dapibus molestie, quam felis sollicitudin mauris, sit amet tempus velit lectus nec lorem. Nullam vel mollis neque. The most
                                            happiest time of the day!. Nullam vel enim dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed tincidunt accumsan massa id viverra. Sed sagittis, nisl sit amet imperdiet
                                            convallis, nunc tortor consequat tellus, vel molestie neque nulla non ligula. Proin tincidunt tellus ac porta volutpat. Cras mattis congue lacus id bibendum. Mauris ut sodales libero. Maecenas feugiat sit amet
                                            enim in accumsan.</p>
                                        <p>Duis vestibulum quis quam vel accumsan. Nunc a vulputate lectus. Vestibulum eleifend nisl sed massa sagittis vestibulum. Vestibulum pretium blandit tellus, sodales volutpat sapien varius vel. Phasellus tristique
                                            cursus erat, a placerat tellus laoreet eget. Fusce vitae dui sit amet lacus rutrum convallis. Vivamus sit amet lectus venenatis est rhoncus interdum a vitae velit.</p>
                                    </div>
                                    <div class="post-tags">
                                        <a href="#">Life</a>
                                        <a href="#">Sport</a>
                                        <a href="#">Tech</a>
                                        <a href="#">Travel</a>
                                    </div>




                                </div>
                            </div>
                        </div>
                        <!-- end: Post item-->
                    </div>
                    <!-- end: content -->
                    <!-- Sidebar-->
                    <div class="sidebar sticky-sidebar col-lg-3">
                        <!--Tabs with Posts-->
                        <div class="widget">
                            <h4 class="widget-title">Recent Posts</h4>
                            <div class="post-thumbnail-list">
                                <div class="post-thumbnail-entry">
                                    <img alt="" src="images/blog/thumbnail/5.jpg">
                                    <div class="post-thumbnail-content">
                                        <a href="#">A true story, that never been told!</a>
                                        <span class="post-date"><i class="icon-clock"></i> 6m ago</span>
                                        <span class="post-category"><i class="fa fa-tag"></i> Technology</span>
                                    </div>
                                </div>
                                <div class="post-thumbnail-entry">
                                    <img alt="" src="images/blog/thumbnail/6.jpg">
                                    <div class="post-thumbnail-content">
                                        <a href="#">Beautiful nature, and rare feathers!</a>
                                        <span class="post-date"><i class="icon-clock"></i> 24h ago</span>
                                        <span class="post-category"><i class="fa fa-tag"></i> Lifestyle</span>
                                    </div>
                                </div>
                                <div class="post-thumbnail-entry">
                                    <img alt="" src="images/blog/thumbnail/7.jpg">
                                    <div class="post-thumbnail-content">
                                        <a href="#">Lorem ipsum dolor sit amet</a>
                                        <span class="post-date"><i class="icon-clock"></i> 11h ago</span>
                                        <span class="post-category"><i class="fa fa-tag"></i> Lifestyle</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="container">
                        <h2>FEATURED TEMPLATES</h2>
                        <div class="slider-container">
                            <button class="arrow left" id="leftArrow">&lt;</button>
                            <div class="slider">
                                <c:forEach items="${requestScope.mentors}" var="member"> 
                                    <a href="MentorProfileServlet?mentorName=${member.getMentorName()}">
                                        <div class="slide">
                                            <img src="./img/${member.avatar}" alt="Template 1"/>
                                            <a href="MentorProfileServlet?mentorName=${member.getMentorName()}">
                                                <h3>${member.getFull_name()}</h3>
                                            </a>
                                            <c:forEach items="${member.listSkills}" var="skill">
                                                <p>${skill.skillName}</p>
                                            </c:forEach>
                                            <div class="star-rating" data-rating="${member.starAVG}">

                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>
                            </div>
                            <button class="arrow right" id="rightArrow">&gt;</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>
    <!--Plugins-->
    <script src="js/jquery.js"></script>
    <script src="js/plugins.js"></script>
    <!--Template functions-->
    <script src="js/functions.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const slider = document.querySelector('.slider');
        const slides = document.querySelectorAll('.slide');
        const leftBtn = document.getElementById('leftArrow');
        const rightBtn = document.getElementById('rightArrow');
        let currentIndex = 0;
        const totalSlides = slides.length;

        function updateSlider() {
            slider.style.transform = `translateX(-` + currentIndex * 25 + `%)`;
        }

        function slideLeft() {
            currentIndex = (currentIndex - 1 + totalSlides) % totalSlides;
            updateSlider();
        }

        function slideRight() {
            currentIndex = (currentIndex + 1) % totalSlides;
            updateSlider();
        }

        leftBtn.addEventListener('click', slideLeft);
        rightBtn.addEventListener('click', slideRight);

        updateSlider();

        console.log('Script loaded');
        console.log('Left button:', leftBtn);
        console.log('Right button:', rightBtn);
    });


    </script>
    <script>
        document.querySelectorAll('.star-rating').forEach(function (element) {

            var rating = parseFloat(element.getAttribute('data-rating'));

            // Calculate the number of full stars, half star, and empty stars
            const fullStars = Math.floor(rating);
            const hasHalfStar = rating % 1 !== 0;
            const emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

            // Create and append stars to the rating element
            for (let i = 0; i < fullStars; i++) {
                const star = document.createElement('i');
                star.classList.add('fas', 'fa-star');
                element.appendChild(star);
            }
            if (hasHalfStar) {
                const halfStar = document.createElement('i');
                halfStar.classList.add('fas', 'fa-star-half-alt');
                element.appendChild(halfStar);
            }
            for (let i = 0; i < emptyStars; i++) {
                const emptyStar = document.createElement('i');
                emptyStar.classList.add('far', 'fa-star');
                element.appendChild(emptyStar);
            }
        });
    </script>
</body>

</html>