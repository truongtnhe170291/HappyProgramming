<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Attendance Summary</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .container {
    background-color: #f8f9fa;
    border: 1px solid #dee2e6;
    border-radius: 10px;
    padding: 30px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
}

.header-section {
    position: fixed;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.title-price {
    flex-grow: 1;
}

h1 {
    margin-bottom: 10px;
}

h2 {
    font-size: 1.5rem;
}

.back-button {
    background-color: #6c757d;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.back-button:hover {
    background-color: #5a6268;
}
        body { padding: 20px; }
        .calendar { display: grid; grid-template-columns: repeat(7, 1fr); gap: 10px; }
        .day { border: 1px solid #ddd; padding: 10px; min-height: 100px; }
        .day-header { font-weight: bold; text-align: center; }
        .slot { margin: 5px 0; padding: 5px; border-radius: 5px; }
        .attended { background-color: #d4edda; }
        .absent { background-color: #f8d7da; }
        .not-yet { background-color: #FFCC00; }
        .financial-summary { margin-top: 20px; }
       .date-range-display {
    background-color: #f8f9fa;
    border: 1px solid #dee2e6;
    border-radius: 5px;
    padding: 10px 15px;
    font-size: 1.2rem;
    color: #495057;
    text-align: center;
    margin-bottom: 20px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.date-range-display {
            background-color: #e9ecef;
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 10px 15px;
            font-size: 1.2rem;
            color: #495057;
            text-align: center;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .date-range-display span {
            font-weight: bold;
        }
        .mentor-price {
            text-align: center;
            font-size: 1.1rem;
            margin-bottom: 20px;
            color: #28a745;
        }
        .now_pter{pointer-events: none;}
    </style>
        <link rel="stylesheet" href="assetss/css/app.min.css">
        <!-- Template CSS -->
        <link rel="stylesheet" href="assetss/css/style.css">
        <link rel="stylesheet" href="assetss/css/components.css">
        <!-- Custom style CSS -->
        <link rel="stylesheet" href="assetss/css/custom.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</head>
<body>
    <div class="loader"></div>
    <div id="app">
            <div class="main-wrapper main-wrapper-1">
                <jsp:include page="header_Manager.jsp" />
                <div class="mobile-author-actions"></div>
                <div class="main-content">
                    <div class="contents">
                        <div class="userDatatable userDatatable--ticket mt-1">
                            <div class="table-responsive">
        <div class="header-section">
    <button class="back-button" onclick="goBack()">Back</button>
   
</div>
    <div class="container">
    
        
         <div class="title-price">
        <h1 class="mb-2">Attendance Summary</h1>
        <h2 class="mb-3" id="Pricepay">Price of Mentor: ${requestScope.priceOfMentor}</h2>
    </div>
   <div class="date-range-display">
            Session Period: <span id="dateRangeText"></span>
        </div>
        <c:set var="now" value="<%= new java.util.Date() %>"/>
        <fmt:formatDate var="currentMonth" value="${now}" pattern="MM"/>
        <fmt:formatDate var="currentYear" value="${now}" pattern="yyyy"/>
        
        <c:set var="daysInMonth" value="<%= java.time.YearMonth.of(Integer.parseInt(pageContext.getAttribute(\"currentYear\").toString()), 
                                                                  Integer.parseInt(pageContext.getAttribute(\"currentMonth\").toString()))
                                                            .lengthOfMonth() %>"/>
        
        <div class="calendar mb-4">
            <div class="day-header">Sun</div>
            <div class="day-header">Mon</div>
            <div class="day-header">Tue</div>
            <div class="day-header">Wed</div>
            <div class="day-header">Thu</div>
            <div class="day-header">Fri</div>
            <div class="day-header">Sat</div>
            
            <c:forEach begin="1" end="${daysInMonth}" varStatus="loop">
                <div class="day">
                    ${loop.index}
                    <c:forEach items="${requestScope.listAtten}" var="atten">
                        <fmt:formatDate value="${atten.dayOfSlot}" pattern="d" var="dayOfMonth"/>
                        <c:if test="${dayOfMonth == loop.index}">
<c:set var="statusClass" value="${not empty atten.attendanceStatus ? atten.attendanceStatus.toLowerCase() : 'not-yet'}" />
<div class="slot ${statusClass}">
                               ${atten.mentorName} - ${atten.skillName} - ${atten.slotName} - ${not empty atten.attendanceStatus ? atten.attendanceStatus : 'not-yet'} 
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </c:forEach>
        </div>
      
        <div class="financial-summary" id="financialSummary"></div>
        
        <button id="renderMoneyBtn" class="btn btn-primary">Render Money</button>
        <button id="paymentBtn" class="btn btn-success">Payment</button>
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
        <script>
            
    function formatCurrency(amount) {
    return 'Price of Mentor: '+  amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".") + " VND";
}
    const priceElement = document.getElementById('Pricepay');
    const pricesplit = priceElement.textContent.split(': ');
    console.log(pricesplit[1]);
    const price = Number(pricesplit[1]);
    priceElement.textContent = formatCurrency(price);

        </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function goBack() {
    window.history.back();
}

  let listBack = [
        <c:forEach items="${requestScope.listAtten}" var="atten" varStatus="status">
                {
                    requestId: ${atten.requestId},
            menteeName: "${atten.menteeName}",
            mentorName: "${atten.mentorName}", 
             
        },  
        </c:forEach>
]
let listAtten = [
    <c:forEach items="${requestScope.listAtten}" var="atten" varStatus="status">
        {
            attendanceId: ${atten.attendanceId},
            requestId: ${atten.requestId},
            selectedId: ${atten.selectedId},
            menteeName: "${atten.menteeName}",
            mentorName: "${atten.mentorName}",
            skillName: "${atten.skillName}",
            dayOfSlot: "${atten.dayOfSlot}",
            slotId: "${atten.slotId}",
            slotName: "${atten.slotName}",
            attendanceStatus: "${atten.attendanceStatus}",
            attendanceDate: "${atten.attendanceDate}"
        }<c:if test="${!status.last}">,</c:if>
    </c:forEach>
];

    if (listAtten.length > 0) {

                let firstDate = new Date(listAtten[0].dayOfSlot);
                let lastDate = new Date(listAtten[listAtten.length - 1].dayOfSlot);
console.log(firstDate,lastDate );
                let options = { year: 'numeric', month: 'long', day: 'numeric' };
                let dateRangeString = firstDate.toLocaleDateString('en-US', options) + " to " + lastDate.toLocaleDateString('en-US', options);

                document.getElementById('dateRangeText').textContent = dateRangeString;

            } else {
                console.log("listAtten is empty or undefined");
                document.getElementById('dateRangeText').textContent = "No data available";
            }

let attendedCount = listAtten.filter(a => a.attendanceStatus === "Attended").length;
let absentCount = listAtten.filter(a => a.attendanceStatus === "Absent").length;
let notYetCount = listAtten.filter(a => a.attendanceStatus !== "Attended" && a.attendanceStatus !== "Absent").length;
let pricePerSession = ${requestScope.priceOfMentor};
 let attendedAmount = 0;
    let name_notYet = '';
let absentAmount =0;
        let notyetAmount =0;
         let totalAmount = (attendedCount + notYetCount + absentCount)*pricePerSession - ((attendedCount +notYetCount + absentCount)*pricePerSession * 0.95);
        
        if(notYetCount > 0 && absentCount > 0){
        attendedAmount  = attendedCount * pricePerSession ;
     absentAmount = (absentCount * pricePerSession) - totalAmount*0.5;
name_notYet = listAtten[0].menteeName;
    notyetAmount = (notYetCount * pricePerSession) - totalAmount*0.5;}
else if( absentCount === 0 && notYetCount > 0 ){
    name_notYet = listAtten[0].menteeName;
attendedAmount  = attendedCount * pricePerSession ;
    absentAmount = (absentCount * pricePerSession);
    notyetAmount = (notYetCount * pricePerSession) - totalAmount;
}
else if (attendedCount >  0 && notYetCount === 0 && absentCount === 0){
      name_notYet = listAtten[0].menteeName;
      attendedAmount  = attendedCount * pricePerSession - totalAmount;

    absentAmount = (absentCount * pricePerSession);
    notyetAmount = (notYetCount * pricePerSession);
}
else{
    attendedAmount  = attendedCount * pricePerSession ;

    absentAmount = (absentCount * pricePerSession) - totalAmount;
name_notYet = 'No Name';
    notyetAmount = (notYetCount * pricePerSession);
}
document.getElementById('renderMoneyBtn').addEventListener('click', function() {
     Toastify({
                        text: 'Render money successfully',
                        duration: 3000,
                        close: true,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#93DC5C",
                        stopOnFocus: true,
                    }).showToast();
   
       


    let summaryHTML = 
    '<div class="financial-summary card">' +
        '<div class="card-header bg-primary text-white">' +
            '<h3 class="mb-0">Financial Summary</h3>' +
        '</div>' +
        '<div class="card-body">' +
            '<table class="table table-bordered">' +
                '<thead>' +
                    '<tr>' +
                        '<th>Status</th>' +
                        '<th>Name</th>' +
                        '<th>Sessions</th>' +
                        '<th>Amount</th>' +
                    '</tr>' +
                '</thead>' +
                '<tbody>' +
                    '<tr>' +
                        '<td class="text-success fw-bold">Attended:</td>' +
                        '<td class="text-success fw-bold">'+listAtten[0].mentorName+'</td>' +
                        '<td class="text-end">' + attendedCount + ' sessions</td>' +
                        '<td class="text-end">' + attendedAmount.toLocaleString() + ' VND</td>' +
                    '</tr>' +
                    '<tr>' +
                        '<td class="text-danger fw-bold">Absent:</td>' +
                        '<td class="text-danger fw-bold">'+listAtten[0].menteeName+'</td>' +
                        '<td class="text-end">' + absentCount + ' sessions</td>' +
                        '<td class="text-end">' + absentAmount.toLocaleString() + ' VND</td>' +
                    '</tr>' +
                    '<tr>' +
                        '<td class="text-primary fw-bold">Not Yet:</td>' +
                        '<td class="text-primary fw-bold">'+name_notYet+'</td>' +
                        '<td class="text-end">' + notYetCount + ' sessions</td>' +
                        '<td class="text-end">'+notyetAmount.toLocaleString() + ' VND</td>' +
                    '</tr>' +
                '</tbody>' +
                '<tfoot>' +
                    '<tr class="table-active">' +
                        '<td colspan="3" class="fw-bold">Amount For System:</td>' +
                        '<td class="text-end fw-bold">' + totalAmount.toLocaleString() + ' VND</td>' +
                    '</tr>' +
                '</tfoot>' +
            '</table>' +
        '</div>' +
    '</div>';

    let customCSS = `
    <style>
        .financial-summary {
            max-width: 500px;
            margin: 20px auto;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .financial-summary .card-header {
            font-size: 1.2rem;
        }
        .financial-summary .table {
            margin-bottom: 0;
        }
        .financial-summary .table td, .financial-summary .table th {
            vertical-align: middle;
        }
        .financial-summary .table tfoot {
            font-size: 1.1rem;
        }
    </style>
    `;

    document.head.insertAdjacentHTML('beforeend', customCSS);
    document.getElementById('financialSummary').innerHTML = summaryHTML;
});

document.getElementById('paymentBtn').addEventListener('click', function() {
    if (listAtten.length === 0) {
        console.error('Attendance list is empty.');
        alert('Attendance list is empty. Please check the request details.');
        return;
    }

document.getElementById('paymentBtn').classList.add('now_pter');
    let dataToSend = {
        priceOfMentor: ${requestScope.priceOfMentor},
        attendedCount: attendedCount,
        attendedAmount: attendedAmount,
        absentAmount: absentAmount,
        notyetAmount: notyetAmount,
        absentCount: absentCount,
        notYetCount: notYetCount,
        totalAmount:  (attendedCount + notYetCount+ absentCount)*pricePerSession - ((attendedCount +notYetCount + absentCount)*pricePerSession * 0.95),
        listAtten: listBack
    };
   
    console.log(dataToSend);
    fetch("PayForMentor", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(dataToSend),
    })
    .then(response => {
        console.log('Response status:', response.status);
        if (!response.ok) {
            return response.text().then(text => { throw new Error(`HTTP error! status: ${response.status}, response: ${text}`); });
        }
        return response.json();
    })
    .then(data => {
        console.log('Payment successful:', data);
 Toastify({
                        text: 'Payment processed successfully!',
                        duration: 3000,
                        close: true,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#93DC5C",
                        stopOnFocus: true,
                        callback: function () {
                window.location.href = "ManagerHomePage";
            }
                    }).showToast();
                    
    })
    .catch((error) => {
        console.error('Error:', error);
        alert('An error occurred during payment processing. Please check the console for more details.');
    });
});
</script>

</body>
</html>