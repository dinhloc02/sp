<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="viewcart" tagdir="/WEB-INF/tags" %>
<viewcart:layoutclientcategory title="Cart Page">   
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
                    <li class="active">Giỏ hàng</li>
                </ul>
                <h3> Giỏ hàng của bạn </h3>	
                <hr class="soft"/>
            <c:choose>
                <c:when test="${listCarts.size() != null && listCarts.size() != 0 }">
                    Để xóa sản phẩm khỏi giỏ hàng, bấm <i class="icon-trash"></i></a>. Để mua hàng, click "Gửi đơn hàng"
                <br><br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th style="text-align: center;">Hình ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th style="text-align: center;">Giá sản phẩm</th>
                            <th style="text-align: center;">Giảm giá</th>
                            <th style="text-align: center;">Số lượng</th>
                            <th style="text-align: center;">Tổng</th>
                            <th style="text-align: center;">Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listCarts}" var="listCarts">
                            <tr>
                                <td style="text-align: center; vertical-align: middle;"><img width="60" src="${listCarts.image}" title="${listCarts.name}"></td>
                                <td style="vertical-align: middle;">${listCarts.name}</td>
                                <td style="text-align: center; vertical-align: middle;"><fmt:formatNumber value = "${listCarts.price}" /> $</td>
                                <td style="text-align: center; vertical-align: middle;"><fmt:formatNumber value = "${listCarts.discount}" /> $</td>
                                <td style="text-align: center; vertical-align: middle;">
                                    <div class="input-append" style="margin-bottom: 0px;">
                                        <form action="capnhat.htm" method="post" style="margin: 0 0 0;">
                                            <input name="key" type="hidden" value="${listCarts.productID}"/>
                                            <input name= "quantity" class="span1" style="max-width:34px" value="${listCarts.numberOfProduct}" id="appendedInputButtons" size="16" type="number" min="1">
                                            <button type="submit" class="btn btn-success"><i class="icon-refresh"></i></button>	
                                        </form>
                                    </div>
                                </td>
                                <td style="text-align: center; vertical-align: middle;"><fmt:formatNumber value = "${listCarts.totalPrice}" /> $</td>
                                <td style="text-align: center; vertical-align: middle;"><a href="xoa.htm?key=${listCarts.productID}" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này trong giỏ hàng?')"><i class="icon-trash"></i></a></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="5" style="text-align:right"><strong>Phí vận chuyển </strong></td>
                            <td colspan="2"> <strong> 0 $</strong></td>
                        </tr>
                        <tr>
                            <td colspan="5" style="text-align:right"><strong>Phí thu hộ </strong></td>
                            <td colspan="2"> <strong> 0 $ (Phí này có thể thay đổi) </strong></td>
                        </tr>
                        <tr>
                            <td colspan="5" style="text-align:right"><strong>Tổng cộng </strong></td>
                            <td class="label label-important" style="display:block; text-align: center;"> <strong> <fmt:formatNumber value = "${totalPaid}" /> $ </strong></td>
                            <td style="text-align:center;"><a href="indexClient.htm"><strong>Tiếp tục mua hàng</strong></a></td>
                        </tr>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="alert alert-block alert-error fade in">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    <strong>Không có sản phẩm nào trong giỏ hàng của bạn !! Click vào <a href="indexClient.htm" style="color: red;"> mua hàng </a> để mua hàng !!!</strong>
                </div>
            </c:otherwise>    
        </c:choose>
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <th>Nhập đầy đủ thông tin <span style="color: red;">(*)</span> <span style="float: right; color: red;">${notificationsSuccessfully} ${notificationsError}</span></th>
                </tr>
                <tr> 
                    <td>
                        <spring:form action="addOrder.htm" class="form-horizontal" commandName="o" method="post">
                            <div class="control-group">
                                <label class="control-label" for="inputCountry">Họ và tên <span style="color: red;">(*)</span> </label>
                                <div class="controls">
                                    <spring:input path="shipName" style="width: 90%;" type="text" id="shipName" name="shipName" placeholder="Họ và tên" class="form-control"/><br>
                                    <spring:errors path="shipName" cssStyle="color:red;"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputPost">Email <span style="color: red;">(*)</span> </label>
                                <div class="controls">
                                    <spring:input path="shipEmai" style="width: 90%;" type="text" id="shipEmai" name="shipEmai" placeholder="Email" class="form-control"/><br>
                                    <spring:errors path="shipEmai" cssStyle="color:red;"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputCountry">Số điện thoại <span style="color: red;">(*)</span> </label>
                                <div class="controls">
                                    <spring:input path="shipMobile" style="width: 90%;" type="text" id="shipMobile" name="shipMobile" placeholder="Số điện thoại" class="form-control"/><br>
                                    <spring:errors path="shipMobile" cssStyle="color:red;"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputPost">Địa chỉ <span style="color: red;">(*)</span> </label>
                                <div class="controls">
                                    <spring:input path="shipAdress" style="width: 90%;" type="text" id="shipAdress" name="shipAdress" placeholder="Địa chỉ" class="form-control"/><br>
                                    <spring:errors path="shipAdress" cssStyle="color:red;"/>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputCountry">Ngày gửi đơn </label>
                                <div class="controls">
                                    <spring:input path="createDate" style="width: 90%;" type="date" id="today" name="createDate" readonly="true" placeholder="" class="form-control"/>
                                    <spring:errors path="createDate" cssStyle="color:red;"/>
                                </div>
                            </div>
                            <div class="control-group" hidden="">
                                <label class="control-label" for="inputPost">Trạng thái </label>
                                <div class="controls">
                                    <spring:radiobutton path="status" value="1" checked="true"/>
                                </div>
                            </div>
                            <c:if test="${listCarts.size() != null && listCarts.size() != 0 }">
                                <div class="control-group">
                                    <div class="controls">                                    
                                        <input type="submit" class="btn" value="Gửi đơn hàng" />                                    
                                    </div>
                                </div>
                            </c:if>
                        </spring:form>			  
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</jsp:attribute>
</viewcart:layoutclientcategory>
<script>
    document.querySelector("#today").valueAsDate = new Date();
</script>
