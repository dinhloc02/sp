<%-- 
    Document   : listTopMenu
    Created on : Oct 14, 2018, 11:08:34 AM
    Author     : Dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${empty usernameClient}">
    <a href="indexloginClient.htm">
        <span class="btn btn-mini btn-primary"> 
            Đăng nhập
        </span> 
    </a>
    <a href="initIndexAddUser.htm">
        <span class="btn btn-mini btn-primary"> 
            Đăng ký
        </span> 
    </a>
</c:if>
<c:if test="${not empty usernameClient}">
    <div class="row">
        <i>Xin chào : ${usernameClient}</i>
    </div>
    <div class="row">
        <a href="initIndexUpdateUser.htm?userID=${useridClient}">
            <span class="btn btn-mini btn-primary"> 
                Thông tin cá nhân
            </span> 
        </a>
        <a href="logoutClient.htm">
            <span class="btn btn-mini btn-primary"> 
                Đăng xuất
            </span> 
        </a> 
    </div>
    <!--them 1 nut nua o day la ngon--> 
</c:if>