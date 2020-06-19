<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Gossip 微網誌</title>
	</head>
	<body>
	<%
	    List<String> error = (List<String>) request.getAttribute("error");
	    if(error != null) {
	%>
	        <h1>新增會員失敗</h1>
	        <ul style='color: rgb(255, 0, 0);'>
	<%
	        for (String err : error) {
	%>
	        <li><%= err %></li>
	<%
	        }
	%>
	        </ul><br>
	<%                
	    }
	%>

        <h1>會員註冊</h1>
        <form method='post' action='register'>
            <table bgcolor=#cccccc>
                <tr>
                    <td>Email：</td>
                    <td><input type='text' name='email' value='${param.email}' size='25' maxlength='100'>
                    </td>
                </tr>
                <tr>
                    <td>Name（最大16字元）：</td>
                    <td><input type='text' name='username' value='${param.username}' size='25' maxlength='16'></td>
                </tr>
                <tr>
                    <td>Password（6到16字元）：</td>
                    <td><input type='password' name='password' size='25' maxlength='16'>
                    </td>
                </tr>
                <tr>
                    <td>Check Password：</td>
                    <td><input type='password' name='password2' size='25' maxlength='16'></td>
                </tr>
                <tr>
                    <td colspan='2' align='center'><input type='submit' value='註冊'></td>
                </tr>
            </table>
        </form>
	</body>
</html>