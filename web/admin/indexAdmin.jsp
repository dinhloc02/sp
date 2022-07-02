<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:layout title="Home Page">
    <jsp:attribute name="content">
        <div class="inner" style="min-height: 700px;">
            <div class="row">
                <div class="col-lg-12">
                    <h1> Trang quản trị </h1>
                </div>
            </div>
            <hr />
            <!--BLOCK SECTION -->
            <div class="row">
                <div class="col-lg-12">
                    <div style="text-align: center;">
                        
                        <a class="quick-btn" href="initAddProduct.htm">
                            <i class="icon-trophy icon-2x"></i>
                            <span> Sản phẩm</span>
                            <span class="label label-danger">Thêm nhanh</span>
                        </a>
                        <a class="quick-btn" href="initAddProducer.htm">
                            <i class="icon-indent-left icon-2x"></i>
                            <span> Nhà sản xuất</span>
                            <span class="label label-success">Thêm nhanh</span>
                        </a>
                        <a class="quick-btn" href="initAddUserGroup.htm">
                            <i class="icon-user-md icon-2x"></i>
                            <span> Phân quyền</span>
                            <span class="label label-warning">Thêm nhanh</span>
                        </a>
                        <a class="quick-btn" href="initAddUser.htm">
                            <i class="icon-user icon-2x"></i>
                            <span> Tài khoản</span>
                            <span class="label btn-metis-2">Thêm nhanh</span>
                        </a>
                        <a class="quick-btn" href="listFB.htm">
                            <i class="icon-lemon icon-2x"></i>
                            <span> Phản hồi</span>
                            <span class="label btn-metis-4">Xem</span>
                        </a>
                        <a class="quick-btn" href="listO.htm">
                            <i class="icon-shopping-cart icon-2x"></i>
                            <span> Đơn hàng</span>
                            <span class="label label-default">Xem</span>
                        </a>
                    </div>
                </div>
            </div>            
            <!--END BLOCK SECTION -->
            <hr />            
            <div class="row">
                <div class="col-lg-12">
                    <img src="themes/img/nen.jpg" style="width: 100%; height: 440px;" alt=""/>
                </div>
            </div>
        </div>
    </jsp:attribute>
</mt:layout>