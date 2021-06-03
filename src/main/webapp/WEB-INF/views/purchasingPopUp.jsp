<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>meeton</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <style>
        input[type=button]{
            width: 90px;
            height: 30px;
            font-size: 13px;
            color: #a0a0a0;
            background-color: #f8fafc;
            border: 1px solid #d9dddf;
            border-radius: 2px;
            cursor: pointer;
            line-height: 30px;
            vertical-align: center;
        }
        input[type=button]:hover{
            color: #4BA9E1;
            border: 1px solid #4BA9E1;
        }
    </style>
    <script>
        $(function(){
            $('#apibtn').click(function (){
                $.ajax({
                    url:'kakaoPay.do',
                    dataType:'json',
                    success:function (data){
                        var box = data.next_redirect_pc_url;
                        window.open(box);
                    },
                    error:function (error){
                        alert("결제할 수 없습니다.");
                    }
                });
            });
        })

    </script>
</head>
<body>
    <input type="button" value="KakaoPay" id="apibtn" >
</body>
</html>