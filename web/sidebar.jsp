<%-- 
    Document   : sidebar
    Created on : May 18, 2024, 9:18:33 AM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
               <jsp:include page="style/linkcss.jsp" />
  <style>
/*    .toggle-icon {
      transition: transform 0.3s;
    }

    li.expanded .toggle-icon {
      transform: rotate(90deg);
    }

    .has-child > ul {
      display: none;
    }

    li.expanded > ul {
      display: block;
    }*/
  </style>
    </head>
    <body>
       <div class="sidebar-wrapper">
         <div class="sidebar sidebar-collapse" id="sidebar">
            <div class="sidebar__menu-group">
               <ul class="sidebar_nav">
                  <li class="has-child">
                     <a href="#" class="ch">
                        <span class="nav-icon uil uil-window-section"></span>
                        <span class="menu-text">Layouts</span>
                        <span class="toggle-icon"></span>
                     </a>
                     <ul>
                        <li class="l_sidebar">
                           <a href="#" data-layout="light">Light Mode</a>
                        </li>
                        <li class="l_sidebar">
                           <a href="#" data-layout="dark">Dark Mode</a>
                        </li>
                     </ul>
                  </li>

                  <li class="has-child">
                     <a href="#" class="ch">
                        <span class="nav-icon uil uil-bag"></span>
                        <span class="menu-text text-initial">Add ...</span>
                        <span class="toggle-icon"></span>
                     </a>
                     <ul>
                        <li class="">
                           <a href="products.html">Products</a>
                        </li>
                        <li class="">
                           <a href="product-details.jsp">Product
                              Details</a>
                        </li>
                        <li class="">
                           <a href="add-product.html">Product
                              Add</a>
                        </li>
                        <li class="">
                           <a href="add-product.html">Product
                              Edit</a>
                        </li>

                     </ul>
                  </li>
                  <li class="has-child">
                     <a href="#" class="ch">
                        <span class="nav-icon uil uil-folder"></span>
                        <span class="menu-text">Project</span>
                        <span class="toggle-icon"></span>
                     </a>
                     <ul>
                        <li class="">
                           <a href="projects.html">Project</a>
                        </li>
                        <li class="">
                           <a href="application-ui.html">Project
                              Details</a>
                        </li>
                        <li class="">
                           <a href="create.html">Create
                              Project</a>
                        </li>
                     </ul>
                  </li>
                  <li>
                     <a href="calendar.html" class="">
                        <span class="nav-icon uil uil-calendar-alt"></span>
                        <span class="menu-text">Calendar</span>
                     </a>
                  </li>
                  <li class="has-child">
                     <a href="#" class="ch">
                        <span class="nav-icon uil uil-users-alt"></span>
                        <span class="menu-text">Users</span>
                        <span class="toggle-icon"></span>
                     </a>
                     <ul>
                        <li class="">
                           <a href="users-card.html">Users Grid</a>
                        </li>
                        <li class="">
                           <a href="users-list.html">Users
                              List</a>
                        </li>
                        <li class="">
                           <a href="user-info.html">Add User</a>
                        </li>
                     </ul>
                  </li>

                  <li class="menu-title mt-30">
                     <span>all Mentor</span>
                  </li>
                  <li class="has-child">
                     <a href="#" class="ch">
                        <span class="nav-icon uil uil-database"></span>
                        <span class="menu-text">Mentor</span>
                        <span class="toggle-icon"></span>

                     </a>
                     <ul>
                        <li class="">
                           <a href="firestore.html">View All</a>
                        </li>
                        <li class="">
                           <a href="firestore-add.html">Add
                              New</a>
                        </li>
                     </ul>
                  </li>
          
                  <li class="">
                     <a href="login.html">
                        <span class="nav-icon uil uil-signin"></span>
                        <span class="menu-text">Log In</span>
                     </a>
                  </li>
                  <li class="">
                     <a href="sign-up.html">
                        <span class="nav-icon uil uil-sign-out-alt"></span>
                        <span class="menu-text">Sign Up</span>
                     </a>
                  </li>
               </ul>
            </div>
         </div>
      </div>
    </body>
<!--<script>
    document.addEventListener('DOMContentLoaded', function() {
      const toggles = document.querySelectorAll('.has-child > a.ch');

      toggles.forEach(function(toggle) {
        toggle.addEventListener('click', function(event) {
          event.preventDefault();
          const parentLi = this.parentElement;
          parentLi.classList.toggle('expanded');
        });
      });
    });
  </script>-->
   <jsp:include page="style/linkJS.jsp" />

</html>
