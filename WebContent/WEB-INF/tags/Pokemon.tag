<%@ tag pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:choose>
    <c:when test="${requestScope.pokemon == null}">
        <c:set var="pokemon" value="${applicationScope.userService.newest}" scope="page"/>
    </c:when>
    <c:otherwise>
        <c:set var="pokemon" value="${requestScope.pokemon}" scope="page"/>
    </c:otherwise>
</c:choose>
<table style='text-align: left; width: 510px; height: 88px;'
                border='0' cellpadding='2' cellspacing='2'>
   <thead>
       <tr>
           <th><hr></th>
       </tr>
   </thead>
   <tbody>
       <c:forEach var="poke" items="${pageScope.pokemon}">
           <tr>
               <td style='vertical-align: top;'>${poke.name}<br>
               		<c:out value="${poke.id}"/><br>
               		<c:out value="${poke.attribute}"/><br>
                    <c:out value="${poke.path}"/><br>                                               
                   <hr>
               </td>
           </tr>
       </c:forEach>
   </tbody>
</table>
<c:remove var="pokemon" scope="page"/>