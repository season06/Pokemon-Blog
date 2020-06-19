<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.util.*, cc.openhome.model.Pokemon"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="openhome" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Pokemon</title>
	</head>
	<body>
		<form method='post' action='new_message'>
        		分享新鮮事... (200字以內)<br>
            <textarea cols='60' rows='4' name='txt'>${param.txt}</textarea>
            <br>
            <button type='submit'>送出</button>
        </form>
	    <% List<Pokemon> pokemon = (List<Pokemon>) request.getAttribute("pokemon");
			for(Pokemon poke: pokemon) { %>
				<table style="border:3px #cccccc solid;" cellpadding="10" border='1'>
					<tr>
						<td><%= poke.getID() %></td>
						<td><%= poke.getName() %></td>
						<td><%= poke.getAttribute() %></td>
						<td><img src=<%= poke.getPicture() %> width="100px"></td>
					</tr>
				</table>
			<% } %>
    </body>
</html>