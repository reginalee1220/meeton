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
        body{
            width: 100%;
            height: 100vh;
            position: relative;
            padding: 50px;
        }
        .payPopUp{
            width: 500px;
            height: 350px;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            border: 1px solid #d9dddf;
            border-radius: 10px;
            box-shadow: 2px 5px 5px 1px rgba(91, 91, 91, .1);
            text-align: center;
            padding: 10px;
        }
        .title{
            font-size: 14px;
            color: #a0a0a0;
            margin-bottom: 10px;
        }
        table {
            width: 100%;
            border-top: 1px solid #d9dddf;
            border-collapse: collapse;
            font-size: 13px;
            color: #a0a0a0;
        }
        th, td {
            border: 1px solid #d9dddf;
            padding: 10px;
        }
        table tr:last-child{
            background-color: #f8fafc;
        }
        .paybtn{
            vertical-align: middle;
            margin: 10px 0;
        }
        input[type=button]{
            vertical-align: middle;
            display: inline-block;
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
                    // dataType:'json',
                    success:function (data){
                        window.open(data);
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
<div class="payPopUp">
    <h3> 채널 구독 결제 화면입니다.</h3>
    <div>
        <div class="title">결제정보 </div>
        <table>
            <tr>
                <td>주문상품</td>
                <td>채널 1달 구독권</td>
            </tr>
            <tr>
                <td>상품금액</td>
                <td>100원</td>
            </tr>
            <tr>
                <td>VAT</td>
                <td>10원</td>
            </tr>
            <tr>
                <td>최종금액</td>
                <td>110원</td>
            </tr>
        </table>
    </div>
    <div class="paybtn">
      <input type="button" value="KakaoPay" id="apibtn" >
    </div>

</div>
</body>
</html>