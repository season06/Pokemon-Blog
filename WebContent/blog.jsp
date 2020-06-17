<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*,cc.openhome.model.Blog" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="openhome" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Blog</title>
	</head>
	<body>
	    <% List<Blog> blog = (List<Blog>) request.getAttribute("blog");
			for(Blog info: blog) { %>
				<table style="border:3px #cccccc solid;" cellpadding="10" border='1'>
					<tr>
						<td><%= info.getID() %></td>
						<td><%= info.getUsername() %></td>
						<td><%= info.getPokemon() %></td>
						<td><%= info.getTxt() %></td>
					</tr>
					<button type="button" formaction="/del_message?id=<%=info.getID()%>" formmethod="get">刪除</button>
				</table>
			<% } %>
	</body>
</html>