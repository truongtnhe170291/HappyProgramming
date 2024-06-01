
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
             .calendar {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .header h2 {
            margin: 0;
        }

        .header button {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 10px;
        }

        .day {
            background-color: #f9f9f9;
            border-radius: 4px;
            padding: 10px;
            margin-bottom: 10px;
        }

        .day-header {
            font-weight: bold;
            margin-bottom: 10px;
        }

        .event {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
        }

        .event-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin-right: 10px;
        }

        
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
                .event {
            display: flex;
            align-items: center;
        }

        .event-dot {
            margin-right: 10px;
        }

        .event-content {
            display: flex;
            flex-grow: 1;
            justify-content: space-between;
            align-items: center;
        }

        .rights {
            margin-left: auto;
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
                                 <div class="calendar">
        <div class="header">
            <h2>Jan 10 - 16, 2021</h2>
            <div>
                <button>List Day</button>
                <button>List Week</button>
            </div>
        </div>
        <div class="day">
            <div class="day-header">Monday</div>
            <div class="event">
                <div class="event-dot" style="background-color: yellow;"></div>
                <div>Conference</div>
            </div>
        </div>
        <div class="day">
            <div class="day-header">Tuesday</div>
            <div class="event">
                <div class="event-dot" style="background-color: yellow;"></div>
                <div>Conference</div>
                <label class="btn btn-light rights">  Regis <input  type="checkbox" name="position" value="top-right" autocomplete="off"> </label>
            </div>
            <div class="event">
                <div class="event-dot" style="background-color: green;"></div>
                <div>10:30am - 12:30pm Meeting</div>
                <input type="checkbox" class="event-checkbox" value="test"/>
                <label class="btn btn-light rights">  Regis <input  type="checkbox" name="position" value="top-right" autocomplete="off"> </label>
            </div>
            <div class="event">
                <div class="event-dot" style="background-color: black;"></div>
                <div>12:00pm Lunch</div>
               <label class="btn btn-light rights">  Regis <input  type="checkbox" name="position" value="top-right" autocomplete="off"> </label>
            </div>
            <div class="event">
                <div class="event-dot" style="background-color: turquoise;"></div>
                <div>2:30pm Meeting</div>
               <label class="btn btn-light rights">  Regis <input  type="checkbox" name="position" value="top-right" autocomplete="off"> </label>
            </div>
            <div class="event">
                <div class="event-dot" style="background-color: black;"></div>
                <div>5:30pm Happy Hour</div>
                 <label class="btn btn-light rights">  Regis <input  type="checkbox" name="position" value="top-right" autocomplete="off"> </label>
            </div>
            <div class="event">
                <div class="event-dot" style="background-color: green;"></div>
                <div>8:00pm Dinner</div>
                <label class="btn btn-light rights">  Regis <input  type="checkbox" name="position" value="top-right" autocomplete="off"> </label>
            </div>
        </div>
        <div class="day">
            <div class="day-header" >Wednesday</div>
            <div class="event">
                <div class="event-dot" style="background-color: red;"></div>
                <div>7:00am Birthday Party</div>
                <label class="btn btn-light rights">  Regis <input  type="checkbox" name="position" value="top-right" autocomplete="off"> </label>
            </div>
        </div>
        <div class="day">
            <div class="day-header">Saturday</div>
            <div class="event">
                <div class="event-dot" style="background-color: black;"></div>
                <div>4:00pm Repeating Event</div>
                <label class="btn btn-light rights">  Regis <input  type="checkbox" name="position" value="top-right" autocomplete="off"> </label>
            </div>
        </div>
    </div>
                                  </div>
                              </div>
                              <!-- end: Calendar -->
                          </div>
                      </section>
                                <div class="col-lg-4">
                                   
                                     <div class="form-group btn-group-toggle" id="notify_position" data-toggle="buttons">
                                        <label>skill</label>
                                        <div class="btn-group">
                                                                                <label class="btn btn-light">
                                          Regis
                                          <input  type="checkbox" name="skill" value="top-left" autocomplete="off">
                                      </label>
                                                                                 <label class="btn btn-light">
                                          Regis
                                          <input type="checkbox" name="skill" value="top-left" autocomplete="off">
                                      </label>
                                                                                 <label class="btn btn-light">
                                          Regis
                                          <input type="checkbox" name="skill" value="top-left" autocomplete="off">
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
 
    
</body>

</html>
    
