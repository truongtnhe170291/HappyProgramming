<%-- 
    Document   : Mentee_Request
    Created on : May 31, 2024, 11:17:11 PM
    Author     : 84979
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="author" content="INSPIRO" />
    <meta name="description">
    <link rel="icon" type="image/png" href="images/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Document title -->
    <title>Fmaster</title>
    <link href="plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet">
    <link href="css/plugins.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
         .btn-light.active {
            background-color: #2250fc;
            color: #ccc;
        }

        input[type="checkbox"] {
            display: none;
        }
    </style>
</head>

<body>
    <div class="body-inner">
        <jsp:include page="header.jsp" />
        <section id="page-title">
            <div class="container">
                <div class="page-title">
                    <h1>Mentee Request</h1>
                </div>
                <div class="breadcrumb">
                    <ul>
                        <li><a href="homes.jsp">Home</a> </li>
                        <li class="active"><a href="Mentee_Request.jsp">Mentee Request</a> </li>
                    </ul>
                </div>
            </div>
        </section>
        <section id="page-content">
            <div class="container">
                <div class="row">
                    <!-- content -->
                    <div class="content col-lg-9">
                        <!-- form -->
                        <form>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <label>Title</label>
                                        <input type="text" id="notify_title" value="Notification Title" class="form-control notification-message">
                                    </div>
                                    <div class="form-group">
                                        <label>Message</label>
                                        <textarea id="notify_message" class="form-control notification-message" placeholder="Type your message here" required="" rows="5">This notification looks so perfect!</textarea>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group btn-group-toggle" id="notify_position" data-toggle="buttons">
                                        <label>study time</label>
                                        <div class="btn-group">
                                                                                <label class="btn btn-light">
                                          oke
                                          <input  type="checkbox" name="position" value="top-left" autocomplete="off">
                                      </label>
                                                                                 <label class="btn btn-light">
                                          oke
                                          <input type="checkbox" name="position" value="top-left" autocomplete="off">
                                      </label>
                                                                                 <label class="btn btn-light">
                                          oke
                                          <input type="checkbox" name="position" value="top-left" autocomplete="off">
                                      </label>
                                                                              </div>
                                    </div>
                                     <div class="form-group btn-group-toggle" id="notify_position" data-toggle="buttons">
                                        <label>skill</label>
                                        <div class="btn-group">
                                                                                <label class="btn btn-light">
                                          oke
                                          <input  type="checkbox" name="position" value="top-left" autocomplete="off">
                                      </label>
                                                                                 <label class="btn btn-light">
                                          oke
                                          <input type="checkbox" name="position" value="top-left" autocomplete="off">
                                      </label>
                                                                                 <label class="btn btn-light">
                                          oke
                                          <input type="checkbox" name="position" value="top-left" autocomplete="off">
                                      </label>
                                                                              </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-5">
                                <div class="col-lg-9">
                                    <a href="javascript:;" id="notify_btn" class="btn btn-primary">
                                        Send Request</a>
                                    <button type="reset" class="btn btn-primary">
                                        Reset
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>
    <!--Plugins-->
    <script src="js/jquery.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/functions.js"></script>
    <script src="plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
   <script>
    document.querySelectorAll('.btn.btn-light').forEach(function(label) {
        label.addEventListener('click', function() {
            const checkbox = this.querySelector('input[type="checkbox"]');     
                this.classList.toggle('active');
                checkbox.remove();          
        });
    });
</script>
    
</body>

</html>
