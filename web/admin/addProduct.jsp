<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:layout title="Product Page">   
    <jsp:attribute name="content">
        <div class="inner">
            <div class="row">
                <div class="col-lg-12">
                    <h3> Sản phẩm </h3>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-lg-12">
                    <div class="box">
                        <header>
                            <div class="icons"><i class="icon-th-large"></i></div>
                            <h5>Màn hình nhập dữ liệu</h5>
                            <div class="toolbar">
                                <ul class="nav">
                                    <li>
                                        <div class="btn-group">
                                            <a class="accordion-toggle btn btn-xs minimize-box" data-toggle="collapse" href="#collapseOne">
                                                <i class="icon-chevron-up"></i>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </header>
                        <div id="collapseOne" class="accordion-body collapse in body">
                            <spring:form action="addProduct.htm" class="form-horizontal" commandName="p" method="post">
                                <div class="form-group">
                                    <label class="control-label col-lg-2">Tên Sản Phẩm</label>
                                    <div class="col-lg-10">
                                        <spring:input path="name" type="text" id="name" name="name" placeholder="" class="form-control"/>
                                        <spring:errors path="name" cssStyle="color:red;"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2">Mã Sản Phẩm</label>
                                    <div class="col-lg-10">
                                        <spring:input path="code" type="text" id="code" value="MD01" name="code" placeholder="" class="form-control"/>
                                        <spring:errors path="code" cssStyle="color:red;"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2">Đơn Giá</label>
                                    <div class="col-lg-10">
                                        <spring:input path="price" type="number" id="price" name="price" placeholder="" class="form-control"/>
                                        <spring:errors path="price" cssStyle="color:red;"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2">Giá Khuyến Mãi</label>
                                    <div class="col-lg-10">
                                        <spring:input path="discount" type="number" id="discount" name="discount" placeholder="" class="form-control"/>
                                        <spring:errors path="discount" cssStyle="color:red;"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2">Hình ảnh</label>
                                    <div class="col-lg-10">
                                        <spring:input path="image" type="text" id="productmodel_image" name="productmodel_image" placeholder="" readonly="true" class="form-control" style="width:50%; display:unset;" />
                                        <input type="button" id="Browse" value="Select Image" class="btn btn-outline-secondary" style="border: 1px solid #ced4da;"/><br>
                                        <spring:errors path="image" cssStyle="color:red;"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2">Trạng Thái Hàng</label>
                                    <div class="col-lg-10" style="padding-top: 8px;">
                                        <spring:radiobutton path="available" value="false" checked="true"/> Còn hàng
                                        &nbsp;&nbsp;
                                        <spring:radiobutton path="available" value="true"/> Hết hàng
                                        <spring:errors path="available" cssStyle="color:red;"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2">Mô Tả</label>
                                    <div class="col-lg-10">
                                        <spring:input path="description" type="text" id="description" name="description" placeholder="" class="form-control"/>
                                        <spring:errors path="description" cssStyle="color:red;"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-2">Mô tả chi tiết</label>
                                    <div class="col-lg-10">
                                        <spring:textarea path="detail" type="text" id="detail" name="detail" placeholder="" class="form-control"></spring:textarea>
                                        <spring:errors path="detail" cssStyle="color:red;"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2">Bảo Hành</label>
                                    <div class="col-lg-10" style="padding-top: 8px;">
                                        <spring:radiobutton path="warranty" value="6" checked="true"/> 6 tháng
                                        &nbsp;&nbsp;
                                        <spring:radiobutton path="warranty" value="1"/> 1 năm
                                        <spring:errors path="warranty" cssStyle="color:red;"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2">Số Lượng</label>
                                    <div class="col-lg-10">
                                        <spring:input path="quantity" type="number" id="quantity" name="quantity" placeholder="" class="form-control"/>
                                        <spring:errors path="quantity" cssStyle="color:red;"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2">Nổi bật</label>
                                    <div class="col-lg-10">
                                        <spring:radiobutton path="special" value="false"/> Có
                                        &nbsp;&nbsp;
                                        <spring:radiobutton path="special" value="true" checked="true"/> Không
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-2">Ngày Tạo</label>
                                    <div class="col-lg-10">
                                        <spring:input path="createDate" type="date" id="today" readonly="true" name="createDate" placeholder="" class="form-control"/>
                                        <spring:errors path="createDate" cssStyle="color:red;"/>
                                    </div>
                                </div>
                                <div class="form-group" hidden="">
                                    <label class="control-label col-lg-2">Lượt Xem</label>
                                    <div class="col-lg-10">
                                        <spring:input path="views" type="text" id="views" value="1" name="views" placeholder="" class="form-control"/>
                                        <spring:errors path="views" cssStyle="color:red;"/>
                                    </div>
                                </div>
                                <div class="form-group" hidden="">
                                    <label class="control-label col-lg-2">Tài Khoản Đăng</label>
                                    <div class="col-lg-10">
                                        <spring:select path="userID" class="form-control" name="userID">
                                            <spring:options items="${listUser}" itemLabel="name" itemValue="userID"/>                                           
                                        </spring:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2">Danh Mục Sản Phẩm</label>
                                    <div class="col-lg-10">
                                        <spring:select path="categoryID" class="form-control" name="categoryID">
                                            <spring:options items="${listCategory}" itemLabel="name" itemValue="categoryID"/>                                           
                                        </spring:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2">Nhà Sản Xuất</label>
                                    <div class="col-lg-10">
                                        <spring:select path="producerID" class="form-control" name="producerID">
                                            <spring:options items="${listProducer}" itemLabel="name" itemValue="producerID"/>                                           
                                        </spring:select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-2">Trạng Thái</label>
                                    <div class="col-lg-10" style="padding-top: 8px;">
                                        <spring:radiobutton path="status" value="false" checked="true"/> Kích hoạt
                                        &nbsp;&nbsp;
                                        <spring:radiobutton path="status" value="true"/> Khóa
                                        <spring:errors path="status" cssStyle="color:red;"/>
                                    </div>
                                </div>
                                <div class="form-actions no-margin-bottom" style="text-align:center;">
                                    <a href="listP.htm?page=1" type="button" class="btn btn-default">Quay lại</a>
                                    <input type="submit" class="btn btn-primary" value="Lưu" />
                                </div>
                            </spring:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>
</mt:layout>
<script>
    document.querySelector("#today").valueAsDate = new Date();
    CKEDITOR.replace('detail');
    $('#Browse').on('click', function (e) {
        e.preventDefault();
        var finder = new CKFinder();
        finder.selectActionFunction = function (url) {
            $('#productmodel_image').val(url);
        };
        finder.popup();
    });
</script>