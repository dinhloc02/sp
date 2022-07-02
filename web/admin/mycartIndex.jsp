<%-- 
    Document   : topviewIndex
    Created on : Oct 15, 2018, 10:47:16 AM
    Author     : Dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="well well-small">
    <a id="myCart" href="giohang.htm">
        <img src="themes/images/ico-cart.png" alt="cart">${listCart == null ? 0:listCart.size()} sản phẩm trong giỏ hàng
    </a>
</div>
