<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
	<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Pokemon</title>
	</head>
	<body>
		<a href='register.jsp'>Register</a>
			<div style='color: rgb(255, 0, 0);'>${ requestScope.error }</div>
        <form method='post' action='login'>
            <table bgcolor='#cccccc'>
                <tr>
                    <td colspan='2'>----- Login -----</td>
                </tr>
                <tr>
                    <td>Username：</td>
                    <td><input type='text' name='username' value="${ param.username }"></td>
                </tr>
                <tr>
                    <td>Password：</td>
                    <td><input type='password' name='password'></td>
                </tr>
                <tr>
                    <td colspan='2' align='center'><input type='submit' value='Login'></td>
                </tr>
                <tr>
                    <td colspan='2'><a href='forgot.html'>forget the password？</a></td>
                </tr>
            </table>
        </form>
	</body>
</html>