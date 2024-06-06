<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>List Request Manager</title>
  <link rel="stylesheet" href="assetss/css/app.min.css">
  <link rel="stylesheet" href="assetss/css/style.css">
  <link rel="stylesheet" href="assetss/css/components.css">
  <link rel="stylesheet" href="assetss/css/custom.css">
  <style>
        .table {
        margin-bottom: 0;
      }

      .table th,
      .table td {
        vertical-align: middle;
      }

      .badge {
        margin-right: 5px;
      }
      .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4);
      }

      .modal-content {
        background-color: #fefefe;
        top:25%;
        left: 40%;
        padding: 20px;
        border: 1px solid #888;
        width: 40%;
      }

      .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
      }

      .close:hover,
      .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
      }
                .calendar {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 300px;
            margin: 0 auto;
          }

          .calendar-header {
            background-color: #f5f5f5;
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
          }

          .calendar-date {
            font-weight: bold;
          }

          .calendar-body {
            padding: 10px;
          }

          .calendar-day {
            margin-bottom: 10px;
          }

          .day-label {
            font-weight: bold;
            font-size: 14px;
            color: #333;
          }

          .day-date {
            font-size: 12px;
            color: #666;
            margin-bottom: 5px;
          }

          .time-slots {
            display: flex;
            flex-wrap: wrap;
          }

          .time-slot {
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            border-radius: 3px;
            padding: 5px 10px;
            margin-right: 5px;
            margin-bottom: 5px;
          }

          .slot-time {
            font-size: 12px;
            color: #333;
          }
</style>
</head>

<body>
  <div class="loader"></div>
  <div id="app">
    <div class="main-wrapper main-wrapper-1">
      <div class="navbar-bg"></div>
      <nav class="navbar navbar-expand-lg main-navbar sticky">
        <div class="form-inline mr-auto">
          <ul class="navbar-nav mr-3">
            <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg
									collapse-btn"> <i data-feather="align-justify"></i></a></li>
            <li><a href="#" class="nav-link nav-link-lg fullscreen-btn">
                <i data-feather="maximize"></i>
              </a></li>
            <li>
              <form class="form-inline mr-auto">
                <div class="search-element">
                  <input class="form-control" type="search" placeholder="Search" aria-label="Search" data-width="200">
                  <button class="btn" type="submit">
                    <i class="fas fa-search"></i>
                  </button>
                </div>
              </form>
            </li>
          </ul>
        </div>
        <ul class="navbar-nav navbar-right">
          
          <li class="dropdown dropdown-list-toggle"><a href="#" data-toggle="dropdown"
              class="nav-link notification-toggle nav-link-lg"><i data-feather="bell" class="bell"></i>
            </a>
            <div class="dropdown-menu dropdown-list dropdown-menu-right pullDown">
              <div class="dropdown-header">
                Notifications
                <div class="float-right">
                  <a href="#">Mark All As Read</a>
                </div>
              </div>
              <div class="dropdown-footer text-center">
                <a href="#">View All <i class="fas fa-chevron-right"></i></a>
              </div>
            </div>
          </li>
          <li class="dropdown"><a href="#" data-toggle="dropdown"
              class="nav-link dropdown-toggle nav-link-lg nav-link-user"> <img alt="image" src="assetss/img/user.png"
                class="user-img-radious-style"> <span class="d-sm-none d-lg-inline-block"></span></a>
            <div class="dropdown-menu dropdown-menu-right pullDown">
              <div class="dropdown-title">Hello Sarah Smith</div>
              <div class="dropdown-divider"></div>
              <a href="auth-login.html" class="dropdown-item has-icon text-danger"> <i class="fas fa-sign-out-alt"></i>
                Logout
              </a>
            </div>
          </li>
        </ul>
      </nav>
      <div class="main-sidebar sidebar-style-2">
        <aside id="sidebar-wrapper">
         
          <ul class="sidebar-menu">
            <li class="menu-header">Main</li>
            <li class="dropdown active">
              <a href="#" class="menu-toggle nav-link has-dropdown"><i
                  data-feather="monitor"></i><span>Dashboard</span></a>
              <ul class="dropdown-menu">
                <li class="active"><a class="nav-link" href="Homes_manager.jsp">Dashboard 1</a></li>
              </ul>
            </li>
            <li class="menu-header">Request</li>
            <li class="dropdown">
              <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="layout"></i><span>Forms</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="listRequest_manager.jsp">List Request</a></li>
              </ul>
            </li>
          
          </ul>
        </aside>
      </div>
      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <ul class="breadcrumb breadcrumb-style ">
            <li class="breadcrumb-item">
              <h4 class="page-title m-b-0">Wizard</h4>
            </li>
            <li class="breadcrumb-item">
              <a href="index.html">
                <i class="fas fa-home"></i></a>
            </li>
            <li class="breadcrumb-item">Forms</li>
            <li class="breadcrumb-item">Wizard</li>
          </ul>
          <div class="section-body">
            <div class="row clearfix">
              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="card">
                  <div class="card-header">
                    <h4>Horizontal Layout</h4>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>Title</th>
                            <th>Mentee Name</th>
                            <th>Deadline Date</th>
                            <th>Deadline Hour</th>
                            <th>Skills</th>
                            <th>Status</th>
                            <th>Actions</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>Book Schedule</td>
                            <td>truong</td>
                            <td>2024-06-15</td>
                            <td>08:00</td>
                            <td>
                              <span class="badge badge-primary">Java Programming</span>
                              <span class="badge badge-secondary">Database Management</span>
                            </td>
                            <td><span class="badge badge-success">Open</span></td>
                            <td>
                              <button class="btn btn-info btn-sm"><i class="fas fa-eye"></i></button>
                              
                              <button class="btn btn-success btn-sm"><i class="fas fa-check"></i></button>
                              <button class="btn btn-danger btn-sm"><i class="fas fa-times"></i></button>
                            </td>
                          </tr>
                          <!-- Add more rows here -->
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
          <!-- Dialog -->
<div id="requestDetailsModal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>Request Details</h2>
    <p><strong>Title:</strong> <span id="modalTitle"></span></p>
    <p><strong>Mentee Name:</strong> <span id="modalMenteeName"></span></p>
    <p><strong>Description:</strong> <span id="modalDescription"></span></p>
    <p><strong>Deadline Date:</strong> <span id="modalDeadlineDate"></span></p>
    <p><strong>Deadline Hour:</strong> <span id="modalDeadlineHour"></span></p>
    <div class="calendar">
  <div class="calendar-header">
    <span class="calendar-date">2024-06-03 - 2024-06-09</span>
  </div>
  <div class="calendar-body">
    <div class="calendar-day">
      <div class="day-label">WEDNESDAY</div>
      <div class="day-date">2024-06-05</div>
      <div class="time-slots">
        <div class="time-slot">
          <span class="slot-time">SLOT01: 7:00 - 9:00</span>
        </div>
      </div>
    </div>
  </div>
</div>
  </div>
</div>
        <div class="settingSidebar">
          <a href="javascript:void(0)" class="settingPanelToggle"> <i class="fa fa-spin fa-cog"></i>
          </a>
          <div class="settingSidebar-body ps-container ps-theme-default">
            <div class=" fade show active">
              <div class="setting-panel-header">Setting Panel
              </div>
              <div class="p-15 border-bottom">
                <h6 class="font-medium m-b-10">Select Layout</h6>
                <div class="selectgroup layout-color w-50">
                  <label class="selectgroup-item">
                    <input type="radio" name="value" value="1" class="selectgroup-input-radio select-layout" checked>
                    <span class="selectgroup-button">Light</span>
                  </label>
                  <label class="selectgroup-item">
                    <input type="radio" name="value" value="2" class="selectgroup-input-radio select-layout">
                    <span class="selectgroup-button">Dark</span>
                  </label>
                </div>
              </div>
              <div class="p-15 border-bottom">
                <h6 class="font-medium m-b-10">Sidebar Color</h6>
                <div class="selectgroup selectgroup-pills sidebar-color">
                  <label class="selectgroup-item">
                    <input type="radio" name="icon-input" value="1" class="selectgroup-input select-sidebar">
                    <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                      data-original-title="Light Sidebar"><i class="fas fa-sun"></i></span>
                  </label>
                  <label class="selectgroup-item">
                    <input type="radio" name="icon-input" value="2" class="selectgroup-input select-sidebar" checked>
                    <span class="selectgroup-button selectgroup-button-icon" data-toggle="tooltip"
                      data-original-title="Dark Sidebar"><i class="fas fa-moon"></i></span>
                  </label>
                </div>
              </div>
              <div class="p-15 border-bottom">
                <h6 class="font-medium m-b-10">Color Theme</h6>
                <div class="theme-setting-options">
                  <ul class="choose-theme list-unstyled mb-0">
                    <li title="white" class="active">
                      <div class="white"></div>
                    </li>
                    <li title="cyan">
                      <div class="cyan"></div>
                    </li>
                    <li title="black">
                      <div class="black"></div>
                    </li>
                    <li title="purple">
                      <div class="purple"></div>
                    </li>
                    <li title="orange">
                      <div class="orange"></div>
                    </li>
                    <li title="green">
                      <div class="green"></div>
                    </li>
                    <li title="red">
                      <div class="red"></div>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="p-15 border-bottom">
                <div class="theme-setting-options">
                  <label class="m-b-0">
                    <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                      id="mini_sidebar_setting">
                    <span class="custom-switch-indicator"></span>
                    <span class="control-label p-l-10">Mini Sidebar</span>
                  </label>
                </div>
              </div>
              <div class="p-15 border-bottom">
                <div class="theme-setting-options">
                  <label class="m-b-0">
                    <input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input"
                      id="sticky_header_setting">
                    <span class="custom-switch-indicator"></span>
                    <span class="control-label p-l-10">Sticky Header</span>
                  </label>
                </div>
              </div>
              <div class="mt-4 mb-4 p-3 align-center rt-sidebar-last-ele">
                <a href="#" class="btn btn-icon icon-left btn-primary btn-restore-theme">
                  <i class="fas fa-undo"></i> Restore Default
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
      
    </div>
  </div>
  <script src="assetss/js/app.min.js"></script>
  <script src="assetss/bundles/jquery-validation/dist/jquery.validate.min.js"></script>
  <!-- JS Libraies -->
  <script src="assetss/bundles/jquery-steps/jquery.steps.min.js"></script>
  <!-- Page Specific JS File -->
  <script src="assetss/js/page/form-wizard.js"></script>
  <!-- Template JS File -->
  <script src="assetss/js/scripts.js"></script>
  <!-- Custom JS File -->
  <script src="assetss/js/custom.js"></script>
  <script>
// Get the modal
var modal = document.getElementById("requestDetailsModal");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// Get all buttons/icons with class "fas fa-eye"
var eyeIcons = document.querySelectorAll(".fas.fa-eye");

// Add click event listener to each eye icon
eyeIcons.forEach(function(icon) {
  icon.onclick = function() {
    modal.style.display = "block";
    // Populate modal content with data from the selected request
    document.getElementById("modalTitle").textContent = "Book Schedule";
    document.getElementById("modalMenteeName").textContent = "truong";
    document.getElementById("modalDescription").textContent = "Seeking guidance on project implementation";
    document.getElementById("modalDeadlineDate").textContent = "2024-06-15";
    document.getElementById("modalDeadlineHour").textContent = "08:00";

    // Generate time slots
    var timeSlotsHtml = "<p><strong>Time Slots:</strong></p>";
    timeSlotsHtml += "<p>2024-06-03 - 2024-06-09</p>";
    timeSlotsHtml += "<p>WEDNESDAY - 2024-06-05</p>";
    timeSlotsHtml += "<p><span style='color: red;'>SLOT01: 7:00 - 9:00</span></p>";
    document.getElementById("modalTimeSlots").innerHTML = timeSlotsHtml;
  }
});

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
</body>

</html>