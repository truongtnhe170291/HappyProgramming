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
    <link rel="icon" type="image/png" href="images/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Document title -->
    <title>Fmaster</title>
    <link href="plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet">
    <link href='plugins/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
    <link href="css/plugins.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
             
                    .wrapper {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                height: 100%;
                background-color: #f2f2f2; 

            .mentor-image {
                transform: translateX(300%);
                border-radius: 50%;
                width: 200px; 
                height: 200px;
                background-size: contain;
                margin-bottom: 20px; 
            }

                 .content-box {
                 margin-top: 20px;
                 display: flex;
                 flex-direction: column;
                 justify-content: center;
                 align-items: center;
                 background-color: white; 
                 padding: 20px;
                 border-radius: 10px;
                 box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); 
                 max-width: 800px;
                 width: 100%;
             }

        .btn-light.active {
       
            background-color: #2250fc;
            color: #ccc;
        }
        .btn-light{
            line-height: 50px;
            margin-left: 60px;
        }
        input[type="checkbox"] {   
            display: none;
        }
        .status {
            line-height: 50px;
            margin-left: 60px;
            font-size: 16px;
            margin-top: 10px;
            color: #333;
            font-weight: bold;
        }

         .btn-light.active {
            background-color: #2250fc;
            color: #ccc;
        }

        input[type="checkbox"] {
            display: none;
        }
        #calendar{
            width: 150%;
            height: auto;
            
        }
        .content, .col-lg-8, .col-lg-4{
            width:100%;
        }
    </style>
</head>

<body>
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
     <div class="wrapper">
       
        <div class="content-box">
    <div class="">
       
       <img src="mentor_image.jpg" alt="Mentor Image" class="mentor-image">
        <section id="page-content">
            <div class="container">
                <div class="row">
                    <!-- content -->
                    <div class="content col-lg-9" >
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
                                                <section id="page-content" class="no-sidebar">
                          <div class="container">
                              <!-- Calendar -->
                              <div class="row mb-5">
                                  <div class="col-lg-6">
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-lg-12">
                                      <div id="calendar"></div>
                                  </div>
                              </div>
                              <!-- end: Calendar -->
                          </div>
                      </section>
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
        </div>
    </div>
    <a id="scrollTop"><i class="icon-chevron-up"></i><i class="icon-chevron-up"></i></a>
    <!--Plugins-->
    <script src="js/jquery.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/functions.js"></script>
    <script src="plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
    <script src='plugins/moment/moment.min.js'></script>
    <script src='plugins/fullcalendar/fullcalendar.min.js'></script>
   <script>
    document.querySelectorAll('.btn.btn-light').forEach(function(label) {
        label.addEventListener('click', function() {
            const checkbox = this.querySelector('input[type="checkbox"]');     
                this.classList.toggle('active');
                checkbox.remove();          
        });
    });
</script>
 <script>
        $(document).ready(function() {
            $('#calendar').fullCalendar({
                header: {
                    left: 'title',
                    right: 'listDay,listWeek'
                  
                },
                views: {
                    listDay: {
                        buttonText: 'list day'
                    },
                    listWeek: {
                        buttonText: 'list week'
                    }
                },
                defaultView: 'listWeek',
                defaultDate: '2021-01-12',
                navLinks: true, 
                editable: true,
                eventLimit: true, 
                events: [{
                    title: 'All Day Event',
                    start: '2021-01-01'
                     
                }, {
                    title: 'Long Event',
                    start: '2021-01-07',
                    end: '2021-01-10',
                    className: 'fc-event-primary'
                     
                }, {
                    id: 999,
                    title: 'Repeating Event',
                    start: '2021-01-09T16:00:00'
                     
                }, {
                    id: 999,
                    title: 'Repeating Event',
                    start: '2021-01-16T16:00:00'
                     
                }, {
                    title: 'Conference',
                    start: '2021-01-11',
                    end: '2021-01-13',
                    className: 'fc-event-warning'
                    
                }, {
                    title: 'Meeting',
                    start: '2021-01-12T10:30:00',
                    end: '2021-01-12T12:30:00',
                    className: 'fc-event-success'
                     
                }, {
                    title: 'Lunch',
                    start: '2021-01-12T12:00:00'
                    
                }, {
                    title: 'Meeting',
                    start: '2021-01-12T14:30:00',
                    className: 'fc-event-info'
                     
                }, {
                    title: 'Happy Hour',
                    start: '2021-01-12T17:30:00'
                     
                }, {
                    title: 'Dinner',
                    start: '2021-01-12T20:00:00',
                    className: 'fc-event-success'
                     
                }, {
                    title: 'Birthday Party',
                    start: '2021-01-13T07:00:00',
                    className: 'fc-event-danger'
                     
                }, {
                    title: 'Click for Google',
                    url: 'http://google.com/',
                    start: '2021-01-28',
                    className: 'fc-event-info'
                     
                }]
            });
        });
    </script>
    
</body>

</html>
