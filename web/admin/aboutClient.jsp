<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="about" tagdir="/WEB-INF/tags" %>
<about:layoutclientcategory title="About Page">   
    <jsp:attribute name="content">
        <div id="sidebar" class="span3">
            <jsp:include page="mycartIndex.jsp"></jsp:include>
                <ul id="sideManu" class="nav nav-tabs nav-stacked">
                <c:forEach items="${listC}" var="listC">
                    <li>
                        <a href="productClientByCategory.htm?categoryID=${listC.categoryID}">${listC.name}</a>
                    </li>
                </c:forEach>
            </ul>
            <br/>
            <jsp:include page="topviewIndex.jsp"></jsp:include>
                <div class="thumbnail">
                    <img src="themes/images/payment_methods.png" title="Bootshop Payment Methods" alt="Payments Methods">
                    <div class="caption">
                        <h5>Phương thức thanh toán</h5>
                    </div>
                </div>
            </div>
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="indexClient.htm">Home</a> <span class="divider">/</span></li>
                    <li class="active">Giới thiệu</li>
                </ul>
                <h3> Giới thiệu </h3>	
                <hr class="soft"/>
                <div class="tab-content">

                <c:forEach items="${listAbout}" var="p">
                    <div class="span4" style="margin-left: 0px; margin-bottom: 20px; margin-right: 35px;">
                        <img src="${p.image}" />
                    </div>
                    <div class="span4">
                        ${p.detail}
                    </div>
                </c:forEach>


                <div class="col-lg-12">
                    <iframe style="width:100%; height:300px; border: 0px" scrolling="no" src="https://maps.google.co.uk/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=18+California,+Fresno,+CA,+United+States&amp;aq=0&amp;oq=18+California+united+state&amp;sll=39.9589,-120.955336&amp;sspn=0.007114,0.016512&amp;ie=UTF8&amp;hq=&amp;hnear=18,+Fresno,+California+93727,+United+States&amp;t=m&amp;ll=36.732762,-119.695787&amp;spn=0.017197,0.100336&amp;z=14&amp;output=embed"></iframe><br>
                    <small><a href="https://maps.google.co.uk/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=18+California,+Fresno,+CA,+United+States&amp;aq=0&amp;oq=18+California+united+state&amp;sll=39.9589,-120.955336&amp;sspn=0.007114,0.016512&amp;ie=UTF8&amp;hq=&amp;hnear=18,+Fresno,+California+93727,+United+States&amp;t=m&amp;ll=36.732762,-119.695787&amp;spn=0.017197,0.100336&amp;z=14" style="color:#0000FF;text-align:left">View Larger Map</a></small>
                </div>
                <hr class="soft"/>
            </div>
        </div>
    </jsp:attribute>
</about:layoutclientcategory>
