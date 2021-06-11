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

    <!-- css -->
    <link rel="stylesheet" href="./css/admin/adminChannel.css">

    <!-- js -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="./js/adminChannel/adminChannel.js"></script>

</head>
<body>
<%@include file="header.jsp"%>
<div class="ca-container">
    <div class="ca-sidebar">
        <div class="ca-side-info">
            <div class="ca-side-profile">
                <img src="./imgUpload/${user.profile}" /><!--프로필 사진-->
            </div>
            <span>${user.aka}</span><!--채널이름-->
        </div>
        <ul class="ca-side-menu">
            <li>
                <div class="ca-side-action"></div>
                <a href="adminChannel.do?state=dashboard">
                    <img class="image1" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAiElEQVRIS+2VMQ7AIAwDyYvavi+M8D/6olRUYmAAOVGDGNoVg3tWDBScP3I+P6w1SCkVIjoGVIWZr7qG6qq2I8g5yywyZn71qO43GKbZotw3otkUicgdYzwbnmmKNOVca4Cim4uGopuL5m6AopsJ0I2obt+i7UvwRQ+mVwU6phrd2jdZ82eo9gHX8pQZEpz/EAAAAABJRU5ErkJggg=="/>
                    <img class="image2" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAg0lEQVRIS+2VUQ6AIAxD1xOp978EnqgGEz78GCmLQz7kl8J4zTpgyQvJ99vcAiSLmW0OVQFw1D1VV7UPApLsWQbg1qu6v4DrZrNyaYt63XYC2BteqItGwjm9gIQeDpqKHg5aegEVPUygHlR1SwdNmrqfELyRA39UqG06opv7J4+8TNVerbGIGS/g3QMAAAAASUVORK5CYII="/>
                    <span>대시보드</span>
                </a>
            </li>
            <li>
                <div class="ca-side-action"></div>
                <a href="adminChannel.do?state=content">
                    <img class="image1" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAArUlEQVRIS2NkoDFgpLH5DPSzoLm52YGJiWk+AwODAoW+evDv37/E2traAyBz4D5obW19wMDAIE+h4TDtD6qrqxXRLfgPEqiursYZbK2trWA1xACYOcg+GFwWYPMpsg8p9gHNLSAUDxT7gOYW0DyIaG4BzYNo1AKsITDoy6IPDAwM/IQij0j5h9XV1eB6BV6aQiucBVSoEx7++/cvAaPCIdJlJCujX51MstOI1AAACCScGZsgnHsAAAAASUVORK5CYII="/>
                    <img class="image2" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAo0lEQVRIS+2V0Q3CMAxE303ACMAmjAKTlVEYpd2ADQ4lUqsIipoquOoH/kxsn+8s+URwKLg/2wHYvgAdcGpk1QM3SY/UZ2JgO30cG5uP5b2k8zuA84P0VTbbOacmxj4lg30BzDEtGTYzCAdY2kMzg3CAcInCAcIl+gPMKrD7W/QEDkvLq/wfJGVfKa9pMpz7DzxhAK4fhlM52eq07Tx59WiVBS8IOZYZfURMMwAAAABJRU5ErkJggg=="/>
                    <span>콘텐츠</span>
                </a>
            </li>
            <li>
                <div class="ca-side-action"></div>
                <a href="adminChannel.do?state=analysis">
                    <img class="image1" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAt0lEQVRIS2NkoDFgpLH5DPS1oLm52YGJiWk+AwODApk+e/Dv37/E2traAzD9KD5obW19wMDAIE+m4TBtD6qrqxVxWfAfJFFdXU1W0LW2tmLoR/fBwFqAzYXIwUmxD4afBeg+onoQUWwBIQMIyYMSAN5kSsgAQvKjFjBQHESkFnoUJ1NCFhJjwQcGBgZ+QgYRkH9YXV0Nr09Qkim0wllAQZ3w8N+/fwk4KxwKXY5VO1kVCykOobkFADEA5BmsqRxXAAAAAElFTkSuQmCC"/>
                    <img class="image2" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAq0lEQVRIS+2V0Q2DQAxD7QkYgXaTjgKT0VE6CmzQDYyuEggOaMqFa6UKfkP84ig6E5k/ZtbHdwGSbgAaAJdEZy2AmuRj6J85kBR+KBPFh7aW5HULoFAgmbQ6SYv+2MFvAWsTTtfpdvB/gNjR4StyAywBq/46+XdXYAlY9RMA94r2PnruM7WAnwCeAApLyKh3JMc8ic80BM7dkQkdgGozcJyTr7YnBcueQbIDeoin3hlZEEibAAAAAElFTkSuQmCC"/>
                    <span>채널분석</span>
                </a>
            </li>
        </ul>
        <div class="ca-back">
            <a href="main.do"><!--메인으로 돌아가기 -->
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABZElEQVRIS+2W0U3DMBCG7yznmW5CN4AVmADYoK/xJVKQcnNQNmAD2g3SDcoGsEAOOYpRCKE9p4QIqX5Koos/23f/70OYaeBMXPhfYGZeIuKF9rQQ8TVN0303PmrHRVEskiR5AYClFtqJWxPRfXiPApdluUbE2xHQ5hdEvHHOPTfPMZMw8wYArkRkJyIr7b/GGH9KfjwQUTEaDABbIrrWgplZzuCDOW6ruCCiJp8hx5MetdcqAPii2IV8+m91XS+MMW9EVP16jpn5DgAe24mjCmloMariGtBqhYhq6Tjntn34QfCJrvTJIqJvdXMUbK3dIOKlNndDcdHgMEn/qGNdKs9z725fhirHrWz+vrjCUls5+dVXXTn561BE3ieRU4DPYiA/6LG5nSZ1rjO4d0lEuZmIBImNawRma318lY91NxF5yrLM+0Mzonqursb99ai1Vmvt/qT2VgvSxI3asWbiYzGzgT8Aukn5HxTmoAsAAAAASUVORK5CYII="/> <span>main으로</span>
            </a>
        </div>
    </div><!--ca-sidebar end-->
    <div class="ca-main">
        <c:if test="${state == 'dashboard'}">
            <%@include file="adminChannelDashboard.jsp"%>
        </c:if>
        <c:if test="${state == 'content'}">
            <%@include file="adminChannelContent.jsp"%>
        </c:if>
        <c:if test="${state == 'analysis'}">
            <%@include file="adminChannelAnalysis.jsp"%>
        </c:if>

    </div><!--ca-main end-->
</div><!--ca-container end-->
</body>
</html>