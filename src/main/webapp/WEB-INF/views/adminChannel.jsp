<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="./css/admin/adminChannel.css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="./js/adminChannel/adminChannel.js"></script>
</head>
<body>
<div class="ca-container">
    <div class="ca-sidebar">
        <div class="ca-side-info">
            <div class="ca-side-profile"><img src="<%=request.getContextPath()%>/imgUpload/${user.profile}" /></div>
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
            <li>
                <div class="ca-side-action"></div>
                <a href="adminChannel.do?state=subscribe">
                    <img class="image1" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABWUlEQVRIS+3WzW2DMBQH8GeEOXeDZIN0hGSTMkFzt5BcIcS1GzTdoBs0I5AJqm6QMzamesiWiMuHC46IqnBBSOb99H/G2AQWushCLtwGzDl/iKJog10oy/LEOT9fqyMXidM03QZB8ImYUmqXJMnxDvvqwL3V/+fjwiVKKX1mjL20v4+rzrFGcXk+AsCBMRYbfBas1/1GCPFu/2wsFOq6Pkkpt2bcZDjLsicAeNMJCiHEzhQdQ/GdSbCFmu41OD5QSk17fyWd3OoO9BsAVia5vuOc9qJ/TtyBxkKIjzAMj4SQZnMxlz2n9h/PudVdKGPsgAVxTtv4GOqceAg1STT+is9Syv3YluqU2IJjk3TOhuEEI6Bx8IE6t3pOsr53nRP7xnthANgTQgpfoH2GG4J9mU0d+wx3Aed5vlZKfXkVdbFBGMcgLqVc+8arqiraa/s2DvS+Uw7VWyzxDw0tUS4xdXO1AAAAAElFTkSuQmCC"/>
                    <img class="image2" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAA2UlEQVRIS+2V/Q3CIBTE7zZwEx1BN3ATV7ATOYIdwW7iBs+ceZgWobQpNZrIXxDC7+59AMTKgyvz8VkBMzNFRLKa8AD0F0g1zG+lyMw2AE4kmxBNtQgcfgWwA9CQPD87sp+3Uhf1IDp2IHnXJIJ3APZhb7JABBH3JhE3GJwP4JMjSDjU2a2LaK60vMEnCaTCd9eti2iZhBcFxnLrexLReOU8vgujNTCzI4DLmMPSa1wssou0oStKwFkRzIV9z1Ox1Hn/P4lroMuj/l40sgKLqJnD1b7GnLnVBR6TwIoZpGcjUAAAAABJRU5ErkJggg=="/>
                    <span>구독현황</span>
                </a>
            </li>
        </ul>
        <div class="ca-back">
            <a href="main.do">
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABZElEQVRIS+2W0U3DMBCG7yznmW5CN4AVmADYoK/xJVKQcnNQNmAD2g3SDcoGsEAOOYpRCKE9p4QIqX5Koos/23f/70OYaeBMXPhfYGZeIuKF9rQQ8TVN0303PmrHRVEskiR5AYClFtqJWxPRfXiPApdluUbE2xHQ5hdEvHHOPTfPMZMw8wYArkRkJyIr7b/GGH9KfjwQUTEaDABbIrrWgplZzuCDOW6ruCCiJp8hx5MetdcqAPii2IV8+m91XS+MMW9EVP16jpn5DgAe24mjCmloMariGtBqhYhq6Tjntn34QfCJrvTJIqJvdXMUbK3dIOKlNndDcdHgMEn/qGNdKs9z725fhirHrWz+vrjCUls5+dVXXTn561BE3ieRU4DPYiA/6LG5nSZ1rjO4d0lEuZmIBImNawRma318lY91NxF5yrLM+0Mzonqursb99ai1Vmvt/qT2VgvSxI3asWbiYzGzgT8Aukn5HxTmoAsAAAAASUVORK5CYII="/>
            </a>
        </div>
    </div><!--ca-sidebar end-->
    <div class="ca-main">
        <c:if test="${page == 'dashboard'}">
            <%@include file="adminChannelDashboard.jsp"%>
        </c:if>
        <c:if test="${page == 'content'}">
            <%@include file="adminChannelContent.jsp"%>
        </c:if>
        <c:if test="${page == 'analysis'}">
            <%@include file="adminChannelAnalysis.jsp"%>
        </c:if>

    </div><!--ca-main end-->
</div><!--ca-container end-->
</body>
</html>