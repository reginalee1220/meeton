<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>meeton</title>
    <!--Boxicons CDN Link-->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>


    <link rel="stylesheet" href="./css/admin/adminChannelAnalysis.css">


    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <!--char.js-->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script src="./js/adminChannel/adminChannel.js"></script>
</head>
<body>

<!-- analysis -->
<div class="ca-analysis">
    <div class="ca-main-title">
        <span>채널 분석</span>
    </div>
    <div class="ca-analysis-content">
        <h3>${channel.aka}님의 현재 구독자수는 ${channel.subscribers}명입니다.</h3>
        <div class="ca-analysis-box">
            <input type="radio" name="tabmenu" id="subscriber" checked />
            <label for="subscriber">구독자수</label>
            <input type="radio" name="tabmenu" id="bookmark" />
            <label for="bookmark">즐겨찾기 시청자수</label>
            <input type="radio" name="tabmenu" id="views" />
            <label for="views">총 조회수</label>
            <!--구독자 수-->
            <div class="conbox subscriber">
                <span>구독자수: ${channel.subscribers}</span>
                <div class="chart-container">
                    <canvas id="subscriber-chart"></canvas>
                </div>
            </div>
            <!--즐겨찾기 시청자수-->
            <div class="conbox bookmark">
                <span>즐겨찾기 시청자수: ${channel.bookmarkers}</span>
                <div class="chart-container">
                    <canvas id="bookmark-chart"></canvas>
                </div>
            </div>
            <!--총 조회수-->
            <div class="conbox views">
                <span>총 조회수: ${totalviews}</span>
                <div class="chart-container">
                    <canvas id="views-chart"></canvas>
                </div>
            </div>
        </div><!--ca-analysis-box end-->
    </div><!--ca-analysis-content end-->
</div><!--ca-analysis end-->
<script>
    /*subscriber*/
    var mychart = $('#subscriber-chart');
    var mychart = new Chart(mychart, {
        type:'bar',
        data:{
            labels:[
                '1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
            ],
            datasets:[
                {
                    label:'구독자수',
                    borderWidth: 1,
                    borderColor: 'rgb(75,169,225,0.7)',
                    hoverBorderColor: 'rgb(160,255,180,0.7)',
                    backgroundColor: 'rgb(75,169,225,0.1)',
                    hoverBackgroundColor: 'rgb(160,255,180,0.5)',
                    data:[10,8,6,5,12,7,16,7,6,null,12,10]
                }
            ]
        },
    });

    /*bookmark*/
    var mychart = $('#bookmark-chart');
    var mychart = new Chart(mychart, {
        type:'bar',
        data:{
            labels:[
                '1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
            ],
            datasets:[
                {
                    label:'즐겨찾기 시청자수',
                    borderWidth: 1,
                    borderColor: 'rgb(75,169,225,0.7)',
                    hoverBorderColor: 'rgb(160,255,180,0.7)',
                    backgroundColor: 'rgb(75,169,225,0.1)',
                    hoverBackgroundColor: 'rgb(160,255,180,0.5)',
                    data:[0,null,1,5,4,7,8,7,6,null,7,3]
                }
            ]
        },
    });
    /*views*/
    var mychart = $('#views-chart');
    var mychart = new Chart(mychart, {
        type:'line',
        data:{
            labels:[
                '1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
            ],
            datasets:[
                {
                    label:'총 조회수',
                    backgroundColor: 'rgb(75,169,225,0.1)',
                    borderColor: 'rgb(75,169,225,0.7)',
                    borderWidth: 1,
                    pointRadius: 4,
                    pointBorderColor: 'rgb(75,169,225,0.7)',
                    pointBackgroundColor: 'rgb(75,169,225,0.7)',
                    pointHoverBorderColor: 'rgb(160,255,180,0.7)',
                    pointHoverBackgroundColor: 'rgb(160,255,180,0.7)',
                    spanGaps: true,

                    data:[1,7,10,5,2,0,4,1,3,5,7,1]
                }
            ]
        },
    });
</script>
</body>
</html>