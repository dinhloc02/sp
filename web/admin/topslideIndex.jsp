<%-- 
    Document   : topslideIndex
    Created on : Oct 14, 2018, 10:40:01 PM
    Author     : LeDung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="myCarousel" class="carousel slide">
    <div class="carousel-inner">
        <div class="item active">
            <div class="container">
                <a href="register.html"><img style="width:100%; height: 340px;" src="themes/images/carousel/1.jpg" alt="special offers"/></a>
            </div><br /><br />
        </div>
        <c:forEach items="${listS}" var="listS">
            <div class="item">
                <div class="container">
                    <a><img style="width:100%; height:340px" src="${listS.image}" alt=""/></a>
                </div><br /><br />
            </div>
        </c:forEach>
    </div>
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div> 

