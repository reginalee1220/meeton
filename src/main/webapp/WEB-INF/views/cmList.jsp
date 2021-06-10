<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1">
    <meta name="viewport" ontent="width=device-width, initial-scale=1.0, maximum-scale=3.0, minimum-scale=1.0" />
    <title>영상보기</title>
    <link rel="stylesheet" type="text/css" href="./css/channel/comment.css"/>
    <script src="http://code.jquery.com/jquery-latest.js"></script>

</head>
<body>
<c:if test="${cmList != null}">
<c:forEach var="cl" items="${cmList}">
<div class="cl">
    <div class="cl_profile"><!-- channel_profile -->
        <div class="cl_img-border">
            <a href="#"><img src=""/></a>
        </div>
    </div><!-- // channel_profile -->
    <div class="cl_subject">
        <div class="cl_sub_top">
            <div class="cl_info">
                <span class="cl_info_name">${cl.userid}</span>
                <span class="cl_info_date">${cl.register}</span>
            </div><!--cl_info end -->
            <div class="cl_likes">
                <span>
                    <a href="">
                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAABh0lEQVRIS81V0U3DMBQ8W+o3ZQLaCSgTUCYAJoBOAHxWLxWumqf+wgSUDWACygR0A8oG9LeRbPQiN3JKS6I0lfCfrfjuvfPdi8Kel9ozPkoTGGOajUbjDUBHilJKTZfL5aUx5vuvIksTMPMLgPMQzDl3F0XRw84EzCwgNwAWWuuOtfbW74dEZHYiYOZrAE8e5ISIZsw8B3AEIN1XJmBm0fvDA/SIaBKcfRFRq8gkW99gPB63rLUC3gTwSEQiCwK5srNSHYxGo67WWqRYr+qViC5WIIE823Dn1treYDCYpm4rupgkyWFoxTiOZ0qp4wJp5kTUXidwckBEKSkz5/ZFWgeF5u6FHfx/Av+OkvbMYbV2EMfxRCl1BSALYG0EflZ9iq211u1+vy9hzLlopzcIEv9ORN3Vo9fWATOL708BpImvlcCnXuRZJEnSCnNTSwfMLBP13jn3HEWRDMdshQTy4zgoG6hN31lrz1Yj4pdE3sOinYzhKmvj8Cv9R6vCmLNpVYCie3vv4ActMOEZRBW80gAAAABJRU5ErkJggg=="/>
                    </a>
                    ${cl.likes}
                </span>
            </div><!--cl_edit end -->
        </div><!--cl_sub_top end -->
        <div class="cl_sub_bottom"><!-- edit1 ajax / edit2 css -->
            <div class="cl_content" id="td_${cl.commentnum}">${cl.content}</div>
            <c:if test="${sessionScope.userid == cl.userid}">
            <div class="cl_edit" id="btn_${cl.commentnum}">
                <input type="button" value="수정" class="edit1" id="${cl.commentnum}" />
                <input type="button" value="삭제" class="edit2" onclick="del(${cl.commentnum},${video.videonum})" />
            </div>
            </c:if>
        </div><!--cl_sub_bottom end -->
    </div>
</div><!-- // cm_form -->
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
