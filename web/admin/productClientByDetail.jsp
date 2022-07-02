<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="detail" tagdir="/WEB-INF/tags" %>
<detail:layoutclientdetail title="Detail Page">   
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
                    <li>Sản phẩm<span class="divider">/</span></li>
                <li class="active">${listIndexDetail.name}</li>
            </ul>	
            <div class="row">	  
                <div id="gallery" class="span3">
                    <a href="${listIndexDetail.image}" title="${listIndexDetail.name}">
                        <img src="${listIndexDetail.image}" style="width:100%" alt="${listIndexDetail.name}"/>
                    </a>
                </div>
                <div class="span6">
                    <h3>${listIndexDetail.name}</h3>				
                    <small style="color:#db0006; font-family:Roboto Condensed; font-size:15px">Mã SP : ${listIndexDetail.code}</small>
                    <small style="color:#db0006; font-family:Roboto Condensed; font-size:15px; float:right">Số Lượng : ${listIndexDetail.quantity} Sản Phẩm</small>
                    <hr class="soft"/>
                    <form class="form-horizontal qtyFrm">
                        <div class="control-group">
                            <label class="control-label"><span>Đơn Giá : <fmt:formatNumber value = "${listIndexDetail.price}" /> $</span></label>
                            <div class="controls">
                                <label class="control-label"><span>Lượt Xem : ${listIndexDetail.views}</span></label>
                                <a href="them-vao-gio-hang.htm?productID=${listIndexDetail.productID}&&cateId=${listIndexDetail.categoryID.categoryID}&&page=1&&back=3" class="btn btn-large btn-primary pull-right"> Thêm <i class=" icon-shopping-cart"></i></a>
                            </div>
                        </div>
                    </form>
                    <hr class="soft clr"/>
                    <p style="text-align: justify">
                        ${listIndexDetail.description}
                    </p>
                    <a class="btn btn-small pull-right" href="#detail">Xem chi tiết</a>
                    <br class="clr"/>
                    <a href="#" name="detail"></a>
                    <hr class="soft"/>
                </div>

                <div class="span9">
                    <ul id="productDetail" class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab">Chi tiết sản phẩm</a></li>
                        <li><a href="#profile" data-toggle="tab">Sản phẩm liên quan</a></li>
                        <li><a href="#comment" data-toggle="tab">Bình luận</a></li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div class="tab-pane fade active in" id="home">
                            ${listIndexDetail.detail}
                        </div>
                        <div class="tab-pane fade" id="profile">
                            <div id="myTab" class="pull-right">
                                <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a>
                                <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
                            </div>
                            <br class="clr"/>
                            <hr class="soft"/>
                            <div class="tab-content">
                                <div class="tab-pane" id="listView">
                                    <c:forEach items="${productRelated}" var="productRelated">
                                        <div class="row">	  
                                            <div class="span2">
                                                <img src="${productRelated.image}" alt="${productRelated.name}" style="width: 170px; height: 120px;"/>
                                            </div>
                                            <div class="span4">
                                                <h3>Mới | ${productRelated.available?"Hết hàng":"Còn hàng"}</h3>				
                                                <hr class="soft"/>
                                                <h5>${productRelated.name} </h5>
                                                <p>
                                                    ${productRelated.description}
                                                </p>
                                                <a class="btn btn-small pull-right" href="productClientByDetail.htm?productID=${productRelated.productID}&&categoryID=${productRelated.categoryID.categoryID}">Xem chi tiết</a>
                                                <br class="clr"/>
                                            </div>
                                            <div class="span3 alignR">
                                                <form class="form-horizontal qtyFrm">
                                                    <h3> <fmt:formatNumber value = "${productRelated.price}" /> $</h3>
                                                    <label class="checkbox"></label><br/>
                                                    <a href="them-vao-gio-hang.htm?productID=${productRelated.productID}&&cateId=${productRelated.categoryID.categoryID}&&back=3" class="btn btn-large btn-primary"> Thêm <i class=" icon-shopping-cart"></i></a>
                                                    <a href="productClientByDetail.htm?productID=${productRelated.productID}&&categoryID=${productRelated.categoryID.categoryID}" class="btn btn-large"><i class="icon-zoom-in"></i></a>

                                                </form>
                                            </div>
                                        </div>
                                        <hr class="soft"/>
                                    </c:forEach>
                                </div>
                                <div class="tab-pane active" id="blockView">
                                    <ul class="thumbnails">
                                        <c:forEach items="${productRelated}" var="productRelated">
                                            <li class="span3">
                                                <div class="thumbnail">
                                                    <a href="productClientByDetail.htm?productID=${productRelated.productID}&&categoryID=${productRelated.categoryID.categoryID}"><img src="${productRelated.image}" style="width: 230px; height: 160px" alt=""/></a>
                                                    <div class="caption">
                                                        <h5>${productRelated.name}</h5>
                                                        <h4 style="text-align:center"><a class="btn" href="productClientByDetail.htm?productID=${productRelated.productID}&&categoryID=${productRelated.categoryID.categoryID}"> <i class="icon-zoom-in"></i></a> <a class="btn" href="them-vao-gio-hang.htm?productID=${productRelated.productID}&&cateId=${productRelated.categoryID.categoryID}&&back=3">Thêm <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#"><fmt:formatNumber value = "${productRelated.price}" /> $</a></h4>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <hr class="soft"/>
                                </div>
                            </div>
                            <br class="clr">
                        </div>
                        <div class="tab-pane fade" id="comment">
                            <div class="fb-comments" data-href="http://localhost:8080/OnlineShopClient/productClientByDetail.htm?productID=${listIndexDetail.productID}" data-width="860" data-numposts="10"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>
</detail:layoutclientdetail>
