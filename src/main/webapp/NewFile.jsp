<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- jQuery -->
<script src="vendor/jquery/jquery.min.js"></script>
</head>
<body>

<script type="text/javascript">
var user;
$.ajax({
	dataType:"json",
	type:"POST",
	url:"/user/getAll",
	async:false,
	success:function(data) {
        if (data != null) {
        	console.log(data[0].userId);
        	user = data;
        } else {
            alert("불러오기 실패");
        }
    }   
});

console.log(user[0].userId);
</script>

<div id="body"></div>
</body>
</html>