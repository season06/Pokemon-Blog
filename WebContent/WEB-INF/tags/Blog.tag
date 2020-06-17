<%@ tag pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:choose>
    <c:when test="${requestScope.blog == null}">
        <c:set var="blog" value="${applicationScope.userService.newest}" scope="page"/>
    </c:when>
    <c:otherwise>
        <c:set var="blog" value="${requestScope.blog}" scope="page"/>
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
       <c:forEach var="info" items="${pageScope.blog}">
           <tr>
               <td style='vertical-align: top;'>${info.username}<br> 
               		<c:out value="${info.id}"/><br>
               		<c:out value="${info.pokemon}"/><br>
                    <c:out value="${info.txt}"/><br>
                   	<fmt:formatDate value="${info.time}" type="both" 
                                   dateStyle="full" timeStyle="full"/>  
                   	<c:if test="${sessionScope.login != null}">
                       <a href='del_message?id=${info.time.time}'>刪除</a>
                   	</c:if>                                               
                   <hr>
               </td>
           </tr>
       </c:forEach>
   </tbody>
</table>
<c:remove var="blog" scope="page"/>