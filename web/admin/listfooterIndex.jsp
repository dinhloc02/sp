<%-- 
    Document   : listfooterIndex
    Created on : Oct 22, 2018, 3:34:04 PM
    Author     : Dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:forEach items="${listF}" var="listF">
    ${listF.content}
</c:forEach>