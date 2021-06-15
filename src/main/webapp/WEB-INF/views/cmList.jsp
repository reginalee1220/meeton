<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" ontent="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0" />
    <title>영상보기</title>

    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="./css/default/reset.css">
    <link rel="stylesheet" type="text/css" href="./css/channel/comment.css"/>

    <!-- js -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <%--    <script src="./js/channel/more.js"></script>--%><!-- 댓글 고정여부/댓글신고여부 더보기 js -->

</head>
<body>

<c:if test="${cmList != null}">
    <c:forEach var="cl" items="${cmList}">
        <div class="cm_line"><!-- cm_line -->

            <div class="cm_inf"><!-- cm_inf -->
                <div class="channel_profile"><!-- channel_profile -->
                    <a href="channelnum.do?channelnum=${channel.channelnum}">
                        <c:if test="${user.profile == null }"><!--프로필 없으면-->
                        <img src="data:image/png;base64,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"/>
                        </c:if>
                        <c:if test="${user.profile != null }"><!--프로필 있으면-->
                        <img src="/imgUpload/${user.profile}" />
                        </c:if>
                    </a>
                </div><!-- // channel_profile -->

                <div class="cm_inf_conwrap"> <!-- cm_inf_conwrap -->
                    <div class="cm_inf_con">
                            <%-- 닉네임 <a href="#"><span class="cm_aka cl_info_name">${cl.aka}</span></a>--%>
                        <a href="#"><span class="cm_id">${cl.userid}</span></a>
                        <span class="cm_ymd cl_info_date">${cl.register}</span>
                    </div><!--cl_info end -->
                    <div class="cm_up_more"><!-- cm_up_more -->
                        <!-- 댓글 좋아요 -->
                        <div class="cm_up"><!-- cm_up -->
                            <button type="button">
                                <i class='bx bx-like'></i>
                            </button>
                            <span class="cds_ifc cnl">
                                    ${cl.likes}
                            </span>
                        </div><!-- // cm_up -->

                        <div class="cm_more"><!-- cm_more -->
                            <span id="toc-toggle" class="cm_more_btn" onclick="openCloseToc()">
                                <i class='bx bx-dots-vertical-rounded' ></i>
                            </span>
                                <%-- <ul id="toc-content"> --%>
                                <%--    <li>댓글신고</li> --%>
                                <%--    <li>댓글고정</li> --%>
                                <%-- </ul> --%>
                        </div><!-- // cm_more -->
                    </div><!-- // cm_up_more -->

                </div> <!-- // cm_inf_conwrap -->
            </div><!-- // cm_inf -->

            <div id="td_${cl.commentnum}" class="cm_inResult cl_content"><!-- 댓글 내용 --><!-- edit1 ajax / edit2 css -->
                <span>${cl.content}</span>
            </div><!-- // 댓글 내용  -->

            <div class="re_btn"><!-- 답글쓰기 버튼 -->
                <button type="button" >
                    답글쓰기
                </button>
                <c:if test="${sessionScope.userid == cl.userid}">
                    <div class="cl_edit" id="btn_${cl.commentnum}">
                        <input type="button" value="수정" class="edit1" id="${cl.commentnum}" />
                        <input type="button" value="삭제" class="edit2" onclick="del(${cl.commentnum},${video.videonum})" />
                    </div>
                </c:if>
            </div><!-- // 답글쓰기 버튼 -->

        </div><!-- // cm_line -->
    </c:forEach>
</c:if>
<script type="text/javascript">
    $(function() {
        $('.edit1').click(function() {
            var id  = $(this).attr('id');  // commentnum (사용자가 클릭한 버튼의 id를 구해오라)
            var txt = $('#td_'+id).text(); // replytext (txt 변수에 댓글 내용 저장)
            /*해당영역을 textarea 로 변경 */
            $('#td_'+id).html("<textarea rows='3' cols='30' class='cl_content' id='tt_"+id+"'>"+txt
                +"</textarea>");
            /*수정버튼을 확인버튼으로 변경*/
            $('#btn_'+id).html(
                "<input class='edit2' type='button' value='확인' onclick='up("+id+")'> "
                +"<input class='edit2' type='button' value='취소' onclick='lst()'>");
        });
    });

    function up(id) {
        var content = $('#tt_'+id).val();
        var formData = "commentnum="+id+'&content='+ content +"&videonum=${video.videonum}";
        // 전달할곳, 전달될 데이터, 콜백함수
        $.post('cmUpdate.do',formData, function(data) {
            $('#cm_list').html(data);
        });
    }

    function lst() {  // 다시 댓글목록 출력 (원래상태로 돌아가기)
        $('#cm_list').load('cmList.do?videonum=${video.videonum}');
    }

    // 삭제
    function del(cno,vno) {
        console.log("del");
        var formData="commentnum="+cno+"&videonum="+vno;
        $.post("cmDelete.do",formData, function(data) {
            $('#cm_list').html(data);
        });
    }
</script>




<c:if test="${cmList == null}">
    댓글이 없습니다.
</c:if>
</body>
</html>
