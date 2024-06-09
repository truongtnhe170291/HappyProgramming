<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>Manager</title>
  <!-- General CSS Files -->
  <link rel="stylesheet" href="assetss/css/app.min.css">
  <!-- Template CSS -->
  <link rel="stylesheet" href="assetss/css/style.css">
  <link rel="stylesheet" href="assetss/css/components.css">
  <!-- Custom style CSS -->
  <link rel="stylesheet" href="assetss/css/custom.css">
  
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
              class="nav-link nav-link-lg message-toggle"><i data-feather="mail"></i>
              <span class="badge headerBadge1">
                6 </span> </a>
            <div class="dropdown-menu dropdown-list dropdown-menu-right pullDown">
              <div class="dropdown-header">
                Messages
                <div class="float-right">
                  <a href="#">Mark All As Read</a>
                </div>
              </div>
              <div class="dropdown-list-content dropdown-list-message">
                <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar
											text-white"> <img alt="image" src="assetss/img/users/user-1.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">John
                      Deo</span>
                    <span class="time messege-text">Please check your mail !!</span>
                    <span class="time">2 Min Ago</span>
                  </span>
                </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="assetss/img/users/user-2.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">Sarah
                      Smith</span> <span class="time messege-text">Request for leave
                      application</span>
                    <span class="time">5 Min Ago</span>
                  </span>
                </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="assetss/img/users/user-5.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">Jacob
                      Ryan</span> <span class="time messege-text">Your payment invoice is
                      generated.</span> <span class="time">12 Min Ago</span>
                  </span>
                </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="assetss/img/users/user-4.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">Lina
                      Smith</span> <span class="time messege-text">hii John, I have upload
                      doc
                      related to task.</span> <span class="time">30
                      Min Ago</span>
                  </span>
                </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="assetss/img/users/user-3.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">Jalpa
                      Joshi</span> <span class="time messege-text">Please do as specify.
                      Let me
                      know if you have any query.</span> <span class="time">1
                      Days Ago</span>
                  </span>
                </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-avatar text-white">
                    <img alt="image" src="assetss/img/users/user-2.png" class="rounded-circle">
                  </span> <span class="dropdown-item-desc"> <span class="message-user">Sarah
                      Smith</span> <span class="time messege-text">Client Requirements</span>
                    <span class="time">2 Days Ago</span>
                  </span>
                </a>
              </div>
              <div class="dropdown-footer text-center">
                <a href="#">View All <i class="fas fa-chevron-right"></i></a>
              </div>
            </div>
          </li>
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
              <div class="dropdown-list-content dropdown-list-icons">
                <a href="#" class="dropdown-item dropdown-item-unread"> <span
                    class="dropdown-item-icon bg-primary text-white"> <i class="fas
												fa-code"></i>
                  </span> <span class="dropdown-item-desc"> Template update is
                    available now! <span class="time">2 Min
                      Ago</span>
                  </span>
                </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-icon bg-info text-white"> <i class="far
												fa-user"></i>
                  </span> <span class="dropdown-item-desc"> <b>You</b> and <b>Dedik
                      Sugiharto</b> are now friends <span class="time">10 Hours
                      Ago</span>
                  </span>
                </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-icon bg-success text-white"> <i
                      class="fas
												fa-check"></i>
                  </span> <span class="dropdown-item-desc"> <b>Kusnaedi</b> has
                    moved task <b>Fix bug header</b> to <b>Done</b> <span class="time">12
                      Hours
                      Ago</span>
                  </span>
                </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-icon bg-danger text-white"> <i
                      class="fas fa-exclamation-triangle"></i>
                  </span> <span class="dropdown-item-desc"> Low disk space. Let's
                    clean it! <span class="time">17 Hours Ago</span>
                  </span>
                </a> <a href="#" class="dropdown-item"> <span class="dropdown-item-icon bg-info text-white"> <i class="fas
												fa-bell"></i>
                  </span> <span class="dropdown-item-desc"> Welcome to Zivi
                    template! <span class="time">Yesterday</span>
                  </span>
                </a>
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
              <a href="profile.html" class="dropdown-item has-icon"> <i class="far
										fa-user"></i> Profile        
              </a>
              <div class="dropdown-divider"></div>
              <a href="loginManager.jsp" class="dropdown-item has-icon text-danger"> <i class="fas fa-sign-out-alt"></i>
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
              <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="layout"></i><span>CV Management</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="listCV">List CV</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="menu-toggle nav-link has-dropdown"><i data-feather="layout"></i><span>Schedule Management</span></a>
              <ul class="dropdown-menu">
                <li><a class="nav-link" href="HandleSlotMentor">Schedule</a></li>
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
              <h4 class="page-title m-b-0">Dashboard</h4>
            </li>
            <li class="breadcrumb-item">
              <a href="index.html">
                <i class="fas fa-home"></i></a>
            </li>
            <li class="breadcrumb-item active">Dashboard</li>
          </ul>
          <div class="row">
            <div class="col-lg-3 col-sm-6">
              <div class="card">
                <div class="card-statistic-4">
                  <div class="info-box7-block">
                    <h6 class="m-b-20 text-right">Orders Received</h6>
                    <h4 class="text-right"><i class="fas fa-cart-plus pull-left bg-indigo c-icon"></i><span>7.12K</span>
                    </h4>
                    <p class="mb-0 mt-3 text-muted"><i class="fas fa-arrow-circle-up col-green m-r-5"></i><span
                        class="text-success font-weight-bold">23%</span> then previous month</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-sm-6">
              <div class="card">
                <div class="card-statistic-4">
                  <div class="info-box7-block">
                    <h6 class="m-b-20 text-right">Registered Users</h6>
                    <h4 class="text-right"><i class="fas fa-users pull-left bg-cyan c-icon"></i><span>22.3K</span>
                    </h4>
                    <p class="mb-0 mt-3 text-muted"><i class="fas fa-arrow-circle-up col-red m-r-5"></i><span
                        class="col-red font-weight-bold">3%</span> then previous month</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-sm-6">
              <div class="card">
                <div class="card-statistic-4">
                  <div class="info-box7-block">
                    <h6 class="m-b-20 text-right">Support Tickets</h6>
                    <h4 class="text-right"><i
                        class="fas fa-ticket-alt pull-left bg-deep-orange c-icon"></i><span>725</span>
                    </h4>
                    <p class="mb-0 mt-3 text-muted"><i class="fas fa-arrow-circle-up col-green m-r-5"></i><span
                        class="text-success font-weight-bold">21%</span> then previous month</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-3 col-sm-6">
              <div class="card">
                <div class="card-statistic-4">
                  <div class="info-box7-block">
                    <h6 class="m-b-20 text-right">Total Earning</h6>
                    <h4 class="text-right"><i
                        class="fas fa-dollar-sign pull-left bg-green c-icon"></i><span>$3.58M</span>
                    </h4>
                    <p class="mb-0 mt-3 text-muted"><i class="fas fa-arrow-circle-down col-red m-r-5"></i><span
                        class="col-red font-weight-bold">05%</span> then previous month</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

  
         
         
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  <h4>Assign Project List</h4>
                  <div class="card-header-form">
                    <form>
                      <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search">
                        <div class="input-group-btn">
                          <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>Cust.</th>
                          <th>Project</th>
                          <th>Assign Date</th>
                          <th>Team</th>
                          <th>Priority</th>
                          <th>Status</th>
                          <th>Edit</th>
                        </tr>
                      </thead>
                      <tr>
                        <td class="table-img"><img src="assetss/img/users/user-8.png" alt="">
                        </td>
                        <td>
                          <h6 class="mb-0 font-13">Wordpress Website</h6>
                          <p class="m-0 font-12">
                            Assigned to<span class="col-green font-weight-bold"> Airi Satou</span>
                          </p>
                        </td>
                        <td>20-02-2018</td>
                        <td class="text-truncate">
                          <ul class="list-unstyled order-list m-b-0 m-b-0">
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-8.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Wildan Ahdian"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-9.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="John Deo"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-10.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Sarah Smith"></li>
                            <li class="avatar avatar-sm"><span class="badge badge-primary">+4</span></li>
                          </ul>
                        </td>
                        <td>
                          <div class="badge-outline col-red">High</div>
                        </td>
                        <td class="align-middle">
                          <div class="progress-text">50%</div>
                          <div class="progress" data-height="6">
                            <div class="progress-bar bg-success" data-width="50%"></div>
                          </div>
                        </td>
                        <td>
                          <a data-toggle="tooltip" title="" data-original-title="Edit"><i
                              class="fas fa-pencil-alt"></i></a>
                          <a data-toggle="tooltip" title="" data-original-title="Delete"><i
                              class="far fa-trash-alt"></i></a>
                        </td>
                      </tr>
                      <tr>
                        <td class="table-img"><img src="assetss/img/users/user-1.png" alt="">
                        </td>
                        <td>
                          <h6 class="mb-0 font-13">Android Game App</h6>
                          <p class="m-0 font-12">
                            Assigned to<span class="col-green font-weight-bold"> Sarah Smith</span>
                          </p>
                        </td>
                        <td>22-05-2019</td>
                        <td class="text-truncate">
                          <ul class="list-unstyled order-list m-b-0 m-b-0">
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-4.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Wildan Ahdian"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-7.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="John Deo"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-2.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Sarah Smith"></li>
                            <li class="avatar avatar-sm"><span class="badge badge-primary">+4</span></li>
                          </ul>
                        </td>
                        <td>
                          <div class="badge-outline col-green">Low</div>
                        </td>
                        <td class="align-middle">
                          <div class="progress-text">55%</div>
                          <div class="progress" data-height="6">
                            <div class="progress-bar bg-purple" data-width="55%"></div>
                          </div>
                        </td>
                        <td>
                          <a data-toggle="tooltip" title="" data-original-title="Edit"><i
                              class="fas fa-pencil-alt"></i></a>
                          <a data-toggle="tooltip" title="" data-original-title="Delete"><i
                              class="far fa-trash-alt"></i></a>
                        </td>
                      </tr>
                      <tr>
                        <td class="table-img"><img src="assetss/img/users/user-5.png" alt="">
                        </td>
                        <td>
                          <h6 class="mb-0 font-13">Java Web Service</h6>
                          <p class="m-0 font-12">
                            Assigned to<span class="col-green font-weight-bold"> Cara Stevens</span>
                          </p>
                        </td>
                        <td>11-04-2019</td>
                        <td class="text-truncate">
                          <ul class="list-unstyled order-list m-b-0 m-b-0">
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-3.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Wildan Ahdian"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-7.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="John Deo"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-8.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Sarah Smith"></li>
                            <li class="avatar avatar-sm"><span class="badge badge-primary">+4</span></li>
                          </ul>
                        </td>
                        <td>
                          <div class="badge-outline col-blue">Medium</div>
                        </td>
                        <td class="align-middle">
                          <div class="progress-text">70%</div>
                          <div class="progress" data-height="6">
                            <div class="progress-bar" data-width="70%"></div>
                          </div>
                        </td>
                        <td>
                          <a data-toggle="tooltip" title="" data-original-title="Edit"><i
                              class="fas fa-pencil-alt"></i></a>
                          <a data-toggle="tooltip" title="" data-original-title="Delete"><i
                              class="far fa-trash-alt"></i></a>
                        </td>
                      </tr>
                      <tr>
                        <td class="table-img"><img src="assetss/img/users/user-9.png" alt="">
                        </td>
                        <td>
                          <h6 class="mb-0 font-13">Wedding IOS App</h6>
                          <p class="m-0 font-12">
                            Assigned to<span class="col-green font-weight-bold"> John Doe</span>
                          </p>
                        </td>
                        <td>19-05-2019</td>
                        <td class="text-truncate">
                          <ul class="list-unstyled order-list m-b-0 m-b-0">
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-2.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Wildan Ahdian"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-10.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="John Deo"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-4.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Sarah Smith"></li>
                            <li class="avatar avatar-sm"><span class="badge badge-primary">+4</span></li>
                          </ul>
                        </td>
                        <td>
                          <div class="badge-outline col-red">High</div>
                        </td>
                        <td class="align-middle">
                          <div class="progress-text">45%</div>
                          <div class="progress" data-height="6">
                            <div class="progress-bar bg-cyan" data-width="45%"></div>
                          </div>
                        </td>
                        <td>
                          <a data-toggle="tooltip" title="" data-original-title="Edit"><i
                              class="fas fa-pencil-alt"></i></a>
                          <a data-toggle="tooltip" title="" data-original-title="Delete"><i
                              class="far fa-trash-alt"></i></a>
                        </td>
                      </tr>
                      <tr>
                        <td class="table-img"><img src="assetss/img/users/user-10.png" alt="">
                        </td>
                        <td>
                          <h6 class="mb-0 font-13">Blize Admin Template</h6>
                          <p class="m-0 font-12">
                            Assigned to<span class="col-green font-weight-bold"> Ashton Cox</span>
                          </p>
                        </td>
                        <td>25-07-2019</td>
                        <td class="text-truncate">
                          <ul class="list-unstyled order-list m-b-0 m-b-0">
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-1.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Wildan Ahdian"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-5.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="John Deo"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-7.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Sarah Smith"></li>
                            <li class="avatar avatar-sm"><span class="badge badge-primary">+4</span></li>
                          </ul>
                        </td>
                        <td>
                          <div class="badge-outline col-blue">Medium</div>
                        </td>
                        <td class="align-middle">
                          <div class="progress-text">67%</div>
                          <div class="progress" data-height="6">
                            <div class="progress-bar bg-red" data-width="67%"></div>
                          </div>
                        </td>
                        <td>
                          <a data-toggle="tooltip" title="" data-original-title="Edit"><i
                              class="fas fa-pencil-alt"></i></a>
                          <a data-toggle="tooltip" title="" data-original-title="Delete"><i
                              class="far fa-trash-alt"></i></a>
                        </td>
                      </tr>
                      <tr>
                        <td class="table-img"><img src="assetss/img/users/user-4.png" alt="">
                        </td>
                        <td>
                          <h6 class="mb-0 font-13">React js website</h6>
                          <p class="m-0 font-12">
                            Assigned to<span class="col-green font-weight-bold"> Sarah Smith </span>
                          </p>
                        </td>
                        <td>11-08-2019</td>
                        <td class="text-truncate">
                          <ul class="list-unstyled order-list m-b-0 m-b-0">
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-5.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Wildan Ahdian"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-8.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="John Deo"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-3.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Sarah Smith"></li>
                            <li class="avatar avatar-sm"><span class="badge badge-primary">+4</span></li>
                          </ul>
                        </td>
                        <td>
                          <div class="badge-outline col-green">Low</div>
                        </td>
                        <td class="align-middle">
                          <div class="progress-text">41%</div>
                          <div class="progress" data-height="6">
                            <div class="progress-bar bg-orange" data-width="41%"></div>
                          </div>
                        </td>
                        <td>
                          <a data-toggle="tooltip" title="" data-original-title="Edit"><i
                              class="fas fa-pencil-alt"></i></a>
                          <a data-toggle="tooltip" title="" data-original-title="Delete"><i
                              class="far fa-trash-alt"></i></a>
                        </td>
                      </tr>
                      <tr>
                        <td class="table-img"><img src="assetss/img/users/user-10.png" alt="">
                        </td>
                        <td>
                          <h6 class="mb-0 font-13">SEO improvement</h6>
                          <p class="m-0 font-12">
                            Assigned to<span class="col-green font-weight-bold"> Janak Gandhi</span>
                          </p>
                        </td>
                        <td>22-02-2018</td>
                        <td class="text-truncate">
                          <ul class="list-unstyled order-list m-b-0 m-b-0">
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-3.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Wildan Ahdian"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-9.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="John Deo"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-1.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Sarah Smith"></li>
                            <li class="avatar avatar-sm"><span class="badge badge-primary">+4</span></li>
                          </ul>
                        </td>
                        <td>
                          <div class="badge-outline col-red">High</div>
                        </td>
                        <td class="align-middle">
                          <div class="progress-text">70%</div>
                          <div class="progress" data-height="6">
                            <div class="progress-bar bg-success" data-width="70%"></div>
                          </div>
                        </td>
                        <td>
                          <a data-toggle="tooltip" title="" data-original-title="Edit"><i
                              class="fas fa-pencil-alt"></i></a>
                          <a data-toggle="tooltip" title="" data-original-title="Delete"><i
                              class="far fa-trash-alt"></i></a>
                        </td>
                      </tr>
                      <tr>
                        <td class="table-img"><img src="assetss/img/users/user-6.png" alt="">
                        </td>
                        <td>
                          <h6 class="mb-0 font-13">Laravel Website</h6>
                          <p class="m-0 font-12">
                            Assigned to<span class="col-green font-weight-bold"> Mili Rain</span>
                          </p>
                        </td>
                        <td>31-03-2019</td>
                        <td class="text-truncate">
                          <ul class="list-unstyled order-list m-b-0 m-b-0">
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-4.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Wildan Ahdian"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-7.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="John Deo"></li>
                            <li class="team-member team-member-sm"><img class="rounded-circle"
                                src="assetss/img/users/user-2.png" alt="user" data-toggle="tooltip" title=""
                                data-original-title="Sarah Smith"></li>
                            <li class="avatar avatar-sm"><span class="badge badge-primary">+4</span></li>
                          </ul>
                        </td>
                        <td>
                          <div class="badge-outline col-green">Low</div>
                        </td>
                        <td class="align-middle">
                          <div class="progress-text">55%</div>
                          <div class="progress" data-height="6">
                            <div class="progress-bar bg-purple" data-width="55%"></div>
                          </div>
                        </td>
                        <td>
                          <a data-toggle="tooltip" title="" data-original-title="Edit"><i
                              class="fas fa-pencil-alt"></i></a>
                          <a data-toggle="tooltip" title="" data-original-title="Delete"><i
                              class="far fa-trash-alt"></i></a>
                        </td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </section>
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
  <!-- General JS Scripts -->
  <script src="assetss/js/app.min.js"></script>
  <!-- JS Libraies -->
  <script src="assetss/bundles/apexcharts/apexcharts.min.js"></script>
  <script src="assetss/bundles/amcharts4/core.js"></script>
  <script src="assetss/bundles/amcharts4/charts.js"></script>
  <script src="assetss/bundles/amcharts4/animated.js"></script>
  <script src="assetss/bundles/jquery.sparkline.min.js"></script>
  <!-- Page Specific JS File -->
  <script src="assetss/js/page/index.js"></script>
  <!-- Template JS File -->
  <script src="assetss/js/scripts.js"></script>
  <!-- Custom JS File -->
  <script src="assetss/js/custom.js"></script>
</body>

</html>