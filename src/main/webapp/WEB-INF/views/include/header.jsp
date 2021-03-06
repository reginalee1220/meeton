<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>meeton</title>

    <!--Boxicons CDN Link-->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="../../../css/default/base.css">

    <!-- js -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="../../../js/main/base.js"></script>

</head>
<body>

<header>

    <div class="header-bar">
        <div class="header-logo">
            <a href="main.do"><img src="../../../images/logo/LOGO.png" /></a>
        </div>
        <div class="header-search">
            <form id="header-form" action="search.do" method="post">
                <div class="header-search-bar">
                    <input type="text" placeholder="검색어를 입력하세요" name="search" />
                    <a href="#" onClick="document.getElementById('header-form').submit();">
                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAABcUlEQVRIS72VzW2DQBCF3yDka1yCU0HsDuwSUkHSgcnRzIUDK19xB04H7iDuIHSQuIPkjMREI+2iVcyC/zA3fvZ9b2aZt4SBLxpYH0HAer2eiMhSROYAptZISUR7ItqsVqvvU8y1AowxBYBllwARFWmavvVBjgB5nqvLJ10oIu8qxMyl3htjpiKSENGLq4iZZ51G/Jee818Acyf8X0BBAPYAHgBsmDkJQZoKtOd1XX/ZD2chcSdkIZ96H0XRY2hPGoDnvtOR7zTP861tV3BNA/B63+u+pYoytBd+BaILmfms2TDGdK67H+DKFh2YedL2J91vkwf/Te2kuoj4AbDoGbQPAOOTB831z48KAFsr0ESFzahXr99lVVWLLMvU1NF1cdgpWJPW5lYQ0hnXdV0nnoi6OwDYRVFUaDRkWTaO41jjW8OxFXLWULW1oA9yNUChPoSIntM03TkzNwE4yGg0mvvi+vxmgN7zoO/ou/T94BX8AaHpzxlcYgIzAAAAAElFTkSuQmCC"/>
                    </a>
                </div>
            </form>
        </div>
        <ul class="header-nav">
            <!-- 즐겨찾기 -->
            <c:if test="${userid != null}"><!--로그인 했으면 -->
            <li><a href="bookmark.do">
                <img width="16px" src="../../../images/main/bookmark-icon.png" />
                <span class="header-desc">즐겨찾기</span></a>
            </li>
            </c:if>
            <c:if test="${userid == null}"><!--로그인 안 했으면 -->
            <li><a href="reject.do">
                <img width="16px" src="../../../images/main/bookmark-icon.png" />
                <span class="header-desc">즐겨찾기</span></a>
            </li>
            </c:if>

            <!--업로드하기-->
            <c:if test="${userid != null}"><!--로그인 했으면 -->
            <li><a href="adminChannel.do?state=content">
                <img width="28px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABgklEQVRIS+2WX07CQBDGv2laXuUG9gbiCfQmegP1sVkSl4RJX/EG3kC5gZxAvAHeAJ9pOmZIt0HSkG0XQRPmcdOZ386386eEIxkdiYsT+GDK/w2pmXkA4I6I0q6pi8gCwJMxZr4rRp1xnudpWZbvAPpdoRt+yyiKLrMs00s0Wg1mZgvgsfpqFgC/Ul8ReRgOh5PNONbavrV2qWeNYGNM57dnZqlgI2OMJrM2Zr4FkLqzVmBmfgOgGc2MMddNqjSBx+PxMxHdAKgv86vg1Wo16fV6LyLiLnkQ8BTAOQDtFGd+YK10EVHntYmIFosGmhPRvTsnok9XwRtSN72EH3ir0ncVeh3wf4NV6qIo6ilGRBMiuhCRDxGppY7jeLFXqbe1bdlOUxFJ9aKtiysQPNJ2SpLktep9DedXXKFgN6WCB4jP/A4amUSko7GTuSnlvSSqtag79KwT8afTVxRFA6+1WG2QgbZJ6I+Atp33j8AesmwVovPebUVp+PgEDlXQ2/9oUn8DlXgZLmjnDEsAAAAASUVORK5CYII="/>
                <span class="header-desc">업로드하기</span></a>
            </li>
            </c:if>
            <c:if test="${userid == null}"><!--로그인 했으면 -->
            <li><a href="reject.do">
                <img width="28px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABgklEQVRIS+2WX07CQBDGv2laXuUG9gbiCfQmegP1sVkSl4RJX/EG3kC5gZxAvAHeAJ9pOmZIt0HSkG0XQRPmcdOZ386386eEIxkdiYsT+GDK/w2pmXkA4I6I0q6pi8gCwJMxZr4rRp1xnudpWZbvAPpdoRt+yyiKLrMs00s0Wg1mZgvgsfpqFgC/Ul8ReRgOh5PNONbavrV2qWeNYGNM57dnZqlgI2OMJrM2Zr4FkLqzVmBmfgOgGc2MMddNqjSBx+PxMxHdAKgv86vg1Wo16fV6LyLiLnkQ8BTAOQDtFGd+YK10EVHntYmIFosGmhPRvTsnok9XwRtSN72EH3ir0ncVeh3wf4NV6qIo6ilGRBMiuhCRDxGppY7jeLFXqbe1bdlOUxFJ9aKtiysQPNJ2SpLktep9DedXXKFgN6WCB4jP/A4amUSko7GTuSnlvSSqtag79KwT8afTVxRFA6+1WG2QgbZJ6I+Atp33j8AesmwVovPebUVp+PgEDlXQ2/9oUn8DlXgZLmjnDEsAAAAASUVORK5CYII="/>
                <span class="header-desc">업로드하기</span></a>
            </li>
            </c:if>
            <%--            <li class="header-alarm"><a href="#">--%>
            <%--                <img width="24px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAB6klEQVRIS+2W0VECMRCGd4/hWUvQCpQK1A6gArUC8ZFLGM8hgUe1ArEC6UCsQKxAStDnDFlnmZxzhrvLHTDDOOO+wSX77b+bbBZhR4Y74sJa4CRJ9pvN5jkHbYx5SpLks66A2mAHfQOAAwebG2NadeGVwQ54BQAXGWgqdA4AY2PMQ9UAKoEHg8FpFEXPALAfSOmntbbT7/enodQHwVprVviYOiKid1ZHRDP+DxGPOQuIeJSBXQohxmXwUrDWmp1yPdm+AKBb5NAFeA8Ae259SwixDC7PQmBO2QlvtNaehVLoSvLiMjGN4/isNthTeyuESEJ14+9aa153E1JdqDjrIIqiw16vxyc3aKPR6MBa++EWFgZcBl6mmQ+TlJJrXdmUUjN32F6FEKe1aqy1TutbuLkokip7g4oB4B8crPXfS7XXJjepMWcnt32uHC6/NyNiJ47jSTC/mQXD4bBNRPyopLYC/wX2Ln9htFWC8AX4TegXONtriehaSslNf21TSnUR8S6v1xeCAYC7T+2RJhslEfH7vex6/iNTBl5bad7GUjBvUEqNETGdp7YCJ6K5lJIHih8LTiBbIec4qQXOHj7fV5VBYSPF/jVxzoIzlh9oLcXpZr7vi8Wizb8bjcak6pCwkeJt1XwtxduAfwMZ1QYu9Imb3QAAAABJRU5ErkJggg=="/>--%>
            <%--                <img width="24px" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAACBklEQVRIS+1WXVLCMBDelOEdTyCcQHsC5QZyAvEE4iNsGeuQDI/qCYQT4A3EE8gNxBPY9wyNs52kk9YUyo9THswTNJv99vt2k10GFS1WES44gcMwbIRhGBUFRfv1ev2a9qWU0022rv1fwEKIcwCYSSl91wEN+gEATR3YssjW+AKADiIubCIZYG34BgANAFggom+MNeAtAHQtULO9BICJlPLZDlYIQd9PASDyPM/v9/v0P1kZYM75gjF2pvduEHFCv0ej0aXneTMd0LqyiOI47gyHwzkZCSEoyBd9IEMkBeac9xhjj9roARFDx+GytZgGLYQgP/d0UCl1FwTBU4axJcsXIib509JTPndZvsmr5XuJiK0UWEtJuaVlR0uSXeyCyhibDwaDdl61OI7blIpEalsOKeUJFciebE2sCWtdmN92GhNgzvmEMUb30pY5zc0ujB21klS4UmoaBEHXMDaSviPipVZhZ5mtQF3+km+VA1OJ04tFd633R4wzGIVNQghxUKnzdfIPnCpSidS5LrXHNQbq6e18S8y81cb7AUGNSyd4prj00/ZZov1tq0IkpWzZvToDnGsW2zpfa2+agzE6DmCrYZh56iCslVJLagy2s+Mab4torquBfA43SbU149wAZ/ynU8smQGdxlT00Ho+bq9XqiuxrtdqrPbaW9bE147KON9lVBvwDZwIoLtov/y0AAAAASUVORK5CYII="/>--%>
            <%--                <span class="header-desc">알림</span></a>--%>
            <%--                <ul class="header-submenu alarm">--%>
            <%--                    <li></li>--%>
            <%--                    <li><a href="#">--%>
            <%--                    </a>--%>
            <%--                    </li>--%>
            <%--                    <li><a href="#">--%>
            <%--                    </a>--%>
            <%--                    </li>--%>
            <%--                    <li><a href="#">--%>
            <%--                    </a>--%>
            <%--                    </li>--%>
            <%--                    <li><a href="#">--%>
            <%--                    </a>--%>
            <%--                    </li>--%>
            <%--                    <li><a href="#">--%>
            <%--                    </a>--%>
            <%--                    </li>--%>
            <%--                    <li><a href="#">--%>
            <%--                    </a>--%>
            <%--                    </li>--%>
            <%--                </ul>--%>

            <%--            </li>--%>
            <!-- 메뉴 -->
            <c:if test="${userid != null}"><!--로그인 했으면 -->
            <li><a href="#">
                <span class="header-nickname">${userid}</span>
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABtElEQVRIS+2VS1LCQBCGu4cCl3ICQk4gnkDcWYAlbHisLE4gnkA8gXgC3UHYgCVQ7sQTiCeAcAJYisW0NbFiBchjwMRsmF1qev5v+k9PN0JIC0Piwh78b86Hb3W+M44vFviAyOJBpE3EZ7EYVbsFdSb0fzPOaXqdAG6CgJqaCHDbKyn1FfBZc5yMMDYCgMOA4PMl56mXijpZAYuPbEuvAcJdEGBCrA6KiUdL9quYbFvvAsGFr3CEp35RyVs1N6paFNnXggk7/LJ8Ho3xpFlUjhmLjXNtmudAHT+yZoCF51Kiu67l+I6zmi7+x+Vf4ERwPygrNTsNR7Bh+ScbAYKyE5xAjx7w1LrFrlabm7nmOE2Mve4CRs5PexV16HTWs2VmWnoDEa62gVsbxc5g431r0xEAHcnB8aNfSqS8Yj0zFgKZ9jiFxN69xMQ+IT8eFFXRAV2XFFgoSPVygut+WWl4QTdapteBjDYZIuCJXRwBvQ1KybSXhlRVr4u4DJKVASADl7baFLMbJOsDIBCwUeXWQWIzAAID/wySiNEcorFl2qk7uV1ga6tlspGJ2YNlXPIlJjSrvwHI+Y4ffXiqRgAAAABJRU5ErkJggg=="/>
            </a>
                <ul class="header-submenu">
                    <li></li>
                    <li><a href="/channel.do?userid=${userid}">
                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABfklEQVRIS+3WwVHDMBAF0C81AFQAJVACVECoAFIBOWsPwIzXZ1IBoQLSAZRACaSD0IDFiJE8sq3E0oZMLvEp4/H6aSX5RwoHutSBXIhhZr5XSlljzJtk8CK4qqqFUurOgwsimpbixXAPDV4xXgT30B+vnkg6z4YT6JUHPwEU41lwCiWiLwcz8yWAYnwU3oaGBZbgW+EcVIpvhEtQCZ6EJWgpPoB3QUvwDpwIh2cieipNJb/bXd1jVNsJmRZ22QvgtYf8J+xePSWihfvRwnVdT6y17/uElVK3xphlBw5h0DTNqdb6ww+g03FVVTOt9U1q6q21SyKaR+vcTnXTNNda63UInQEcFdk+zMwvAB5G1ntORLP+GhPRYBMnPydmTsHh3grAd28AFwDOAbiuzvYFDzYcM7fTGrpL3YsHK+n4CLu/xuNUJ2chZ3Oto+OMJKrjmhURuc+tc23a1anclg6gzefRjkN8AphINV/nYvTvbJbV8Y5YVvnoYS/rLYKHfgEf/DEu8krAWQAAAABJRU5ErkJggg=="/>
                        <span>내 채널</span></a>
                    </li>
                    <li><a href="/bookmark.do">
                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAACgUlEQVRIS8WW323bMBDGSRq2H+NO0HiCdoPaEzSdoM0GzqN1MqLAov1Yd4K6GzQTNN7AnaDuBsmrZfCKI0iBZkXqDxBYLxJAQr/7jnffkbMLPfxCXNYZvFqtbijoJEl+dgm+E3i5XE6EEL8IqJSaLhaLp7bwTmApJYE+EIxz/pQkyfTVwev1+lop9ccFCSHG8/n80AbeWnGe51vO+WcXgog/0jT98mpgVy3BTKp1EEVRvMmy7LkpvJViKWXGGLu3RUVvW2SMsQcAoPVGT2NwlmWjfr9PZztijO0AYEIEp9Cei6IYN1V9BqbeRMR3JoUEeG/DR0QNMmufbP9KKelsvztrbmvtEVGnHxH3aZo+lvvsh/+DSL7+AsC1uy6lpIp+2yDHtwCw1cHbza4pOD/YOd9aiRBi67eOKTpb1WVmbK/bf7hmc5ZqTzWlaAoA+wZK/ttSkcFS7ZniQMo7wb1ef2GMTXwBlVVdofzOnk2d+ibQSsWhYuOcl5UcgrtQRPzd6/VuQlYa7WNPedm7VWC3OAl6Op0msZ6uNRApJRrQNwCYxVLdZm8U7KpokmopJV0KPjLGDgAwjgUZBed5PuOcfzX9W44+E5B2K6XUrb0IhPZXBVB3xlaBdivy68FgcI+IZynnnG+Ox+PDcDgc2VmNiHdpmm5CquvA1MdXNAIRcSuEIJXWLqk/6bky7wOpJ2cz9vkIAPpe1kqxd9MgL3b9eSeE0BaplCKQvgaZh4KlAcMAICgsuBAYGi+ImPkpNGdLs9iq1zHECjIIrrjiaJUhQzAZ8tUHWzCm2BZWpcqIe1EnWPXBcw6CzY1jVjUG6/zajsmiKDYh96p1rjpI1/WLgf8BY35XLlbk3/YAAAAASUVORK5CYII="/>
                        <span>즐겨찾기</span></a>
                    </li>
                    <li><a href="purchasedList.do">
                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAA20lEQVRIS+2W6w3CMAyEr14EVmADRmEPK4LK8h5swgqMAJOAXDUV0IcSYTVFND9Tx9/5mliuUGhVhbhYwbM5/2a1qh4AHAFsnRXcANTMfI55O7CI7Ino4gz8TLdj5qttdmBVPbXV2n7tLMBcbPIys3GGwczsettV9bFssLPNr+mmrV7Bjg4s1Or/e06xYhFpuszYCiFMfo/nshuIgYkotrseP/WX/A7Y6xllVzw7GEDSpckQFvP1G0ixQcDUt6OPqdtkVJMSejcXB0eflNOeMa6TRo6wFZzj1lexT2i+mB8Et00GAAAAAElFTkSuQmCC"/>
                        <span>결제 리스트</span></a>
                    </li>
                    <li><a href="/history.do">
                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABhElEQVRIS9WXy1HDMBCGd/26kg5IB9ABpgLSAVABuesQMbbHx7RACVABpAPowHTA2bItZjNSJoMf8kPBoBkfPJb22139Wq0RZho4ExeMYM75IgiCGynlcqyTiJjlef7COf/SNjrBBPV9/xUALsdCj9a9CyGuNbwTHMfxGhG3FqDaxD1j7IleOsFJknAA2FgEPzLGyOb/A3+qLJwPzMbkiHdCiJXv+2sAoOespwPTwYyxkGBpmi7LsuSIeNsDXgcfC4kxthddh7h2GqxhURSFjuOQcK46HLAP1rAkSe4AgBxo2v/TgXX6q6qiwvOz2p0OrCKms99UYu2DaY9d191IKfeiaxn2wKTqqqooQtpb05gOVuf4QZ3jhYmovk8GZ8rQ0KtyMrhngLVpfxz8K/dxU8mkDsTzvDdEvBibW71OSvlRFEVY60CawLRItT+rloLQ159MCPHc2HO1gftaHjrv0PrMBrYlJH2lmjJwiNiWkAaDbQlJd5G9IzZNtP3d+AtjG6jtfQM32QIukxQSxAAAAABJRU5ErkJggg=="/>
                        <span>시청기록</span></a>
                    </li>
                    <li><a href="memberInfoCheck.do">
                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAACXElEQVRIS+VW0XHTQBDdPdvfMRUkrgBTAUkFCRVgKsD5tO48iLHO/iRUgKkAUgEpQVRAqID4W/Zt5nlOjCJL1sn+CDPsnzx3+3bfe7drpmcKfiZcOgh4Pp9fichLFC0iqTHmtm0DrYCttSMi+kRE/RLQAxFda62XoQUEA1trb4jofUPiz1rrcQh4ELCn9ptPuCKisVLqDt/OuXMiQlEn+GbmN1EUfW8CDwJOkiRlZmi6UkoNJ5PJfTHxYrE4c86lHjzVWr86Gtgn/eUT1VJZlEIpNSgXVy6ksePZbHaulPrhab2YTqdbistRlMM5V3suv9cKmIje1Tk3SZIxM8Px0P14YCSy1uK5nDDzXRRFF1UdW2vBxGv4QGtdfm47Vxo7xo0kSZbM/Na79iaKoutipqK+IvLVGIP3vjeCgOM47vd6Pbj21GeDq3Ot8ZzO/O+/sywbxnEMho4H9nQPRQSdb0dlOUTkJzOPtNYosDGCOs6zoPNutwsaR3kBACSi5Xq9XoZ0GuzqxtIPPBDUsbV2SESXRDRk5krHigh0Bc23IXTvBQYg3qaIwEDBgWcnIthWtXrXAletQG+gSseKSL9kvL2rshK4OCZ9mx+VUsum+evnOsz3IaenbortAPs3i6UALVfOuau6+VzHvS8cqxGr8iHLskHZ8TvA1tq4UHHtbG4S3Ev1JWdMa428f6MKGFPpFHoaY+Dmg6Owx++11oNaYE/zHxyAK40x+GdxcBQ3VpZlL4p0P+k4dPeGVrIv378BDKo7nc5W181mk7aZvVUs7MsXNDJDqW1z7v8DfgQwUjgu05DT6AAAAABJRU5ErkJggg=="/>
                        <span>내 정보</span></a>
                    </li>
                    <li><a href="logout.do">
                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAABlUlEQVRIS81VwW3CQBCcRfgdOoFUAFSQdBBKgC9nlJNg36GDQAekgkAFSSpISkjeIG800hkZHGxshSgn+eW7md3ZuTnBhZdcGB//g2A6nfYajcYdgE742PgrvyRJlpPJZH1KicIOVLUjIg9m1iuSUkTWZjZyzpH0YJ0k8N63oij6AHAF4AvAHMAqBSE5gFsAw7DnE0D/mKSsgwGr3+12Q+89AXKLhTSbzbmIUMIcya8NeTabLUhCucbjcT+t5CQBD8RxPDjXxllJkyTpp4PPEYSNz3SLc65Sh6rqAdyb2TIt7gAgDI7gLVZeg4CDf6F9nXPXxNgTqCrleDxXknTfcRGqatni/o6ArEEi3kp6v7ZEZvYWxzHlymdR8PVaRNo1ZlA85Kz+NW36ToMU2rTqkNP9qroCcANg45zbZ1dpVADobrfbUVFURFFE9zGXmFm9bB6dG3bMGIbd01HYsWKGHe9NDvzHIWclCq4icLdEug2JKsV1FpAPjojwIvJ9aPMfrcgba2aL2g9O3YFnz1UKszqEFyf4BlY3wRmPsNmaAAAAAElFTkSuQmCC"/>
                        <span>로그아웃</span></a>
                    </li>
                </ul>
            </li>
            </c:if>
            <c:if test="${userid == null}"><!--로그인 안 했으면 -->
            <li><a href="login.do">
                <span class="header-nickname">로그인</span>
                <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAABtElEQVRIS+2VS1LCQBCGu4cCl3ICQk4gnkDcWYAlbHisLE4gnkA8gXgC3UHYgCVQ7sQTiCeAcAJYisW0NbFiBchjwMRsmF1qev5v+k9PN0JIC0Piwh78b86Hb3W+M44vFviAyOJBpE3EZ7EYVbsFdSb0fzPOaXqdAG6CgJqaCHDbKyn1FfBZc5yMMDYCgMOA4PMl56mXijpZAYuPbEuvAcJdEGBCrA6KiUdL9quYbFvvAsGFr3CEp35RyVs1N6paFNnXggk7/LJ8Ho3xpFlUjhmLjXNtmudAHT+yZoCF51Kiu67l+I6zmi7+x+Vf4ERwPygrNTsNR7Bh+ScbAYKyE5xAjx7w1LrFrlabm7nmOE2Mve4CRs5PexV16HTWs2VmWnoDEa62gVsbxc5g431r0xEAHcnB8aNfSqS8Yj0zFgKZ9jiFxN69xMQ+IT8eFFXRAV2XFFgoSPVygut+WWl4QTdapteBjDYZIuCJXRwBvQ1KybSXhlRVr4u4DJKVASADl7baFLMbJOsDIBCwUeXWQWIzAAID/wySiNEcorFl2qk7uV1ga6tlspGJ2YNlXPIlJjSrvwHI+Y4ffXiqRgAAAABJRU5ErkJggg=="/>
            </a>
            </li>
            </c:if>
        </ul>
    </div>
</header>
</body>
</html>