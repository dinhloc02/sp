<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="categoies" tagdir="/WEB-INF/tags" %>
<categoies:layoutclientcategory title="Producy By Category Page">   
    <jsp:attribute name="content">
        <!--Pagination edited by Hoang-->
        <style type="text/css">
            .pagination {
                display: inline-block;
                padding-left: 0;
                margin: 20px 0;
                border-radius: 4px;
            }
            .pagination > li {

                display: inline;
            }
            .pagination > li > a,
            .pagination > li > span {
                position: relative;
                float: left;
                padding: 6px 12px;
                margin-left: -1px;
                line-height: 1.428571429;
                text-decoration: none;
                background-color: #ffffff;
                border: 1px solid #dddddd;
            }
            .pagination > li:first-child > a,
            .pagination > li:first-child > span {
                margin-left: 0;
                border-bottom-left-radius: 4px;
                border-top-left-radius: 4px;
            }
            .pagination > li:last-child > a,

            .pagination > li:last-child > span {
                border-top-right-radius: 4px;
                border-bottom-right-radius: 4px;
            }
            .pagination > li > a:hover,
            .pagination > li > span:hover,
            .pagination > li > a:focus,
            .pagination > li > span:focus {
                background-color: #eeeeee;
            }
            .pagination > .active > a,
            .pagination > .active > span,
            .pagination > .active > a:hover,
            .pagination > .active > span:hover,
            .pagination > .active > a:focus,
            .pagination > .active > span:focus {
                z-index: 2;
                color: #ffffff;
                cursor: default;
                background-color: #428bca;
                border-color: #428bca;
            }
            .pagination > .disabled > span,
            .pagination > .disabled > span:hover,
            .pagination > .disabled > span:focus,
            .pagination > .disabled > a,
            .pagination > .disabled > a:hover,
            .pagination > .disabled > a:focus {
                color: #999999;
                cursor: not-allowed;
                background-color: #ffffff;
                border-color: #dddddd;
            }
            .pagination-lg > li > a,
            .pagination-lg > li > span {
                padding: 10px 16px;
                font-size: 18px;
            }
            .pagination-lg > li:first-child > a,
            .pagination-lg > li:first-child > span {
                border-bottom-left-radius: 6px;
                border-top-left-radius: 6px;
            }
            .pagination-lg > li:last-child > a,
            .pagination-lg > li:last-child > span {
                border-top-right-radius: 6px;
                border-bottom-right-radius: 6px;
            }
            .pagination-sm > li > a,
            .pagination-sm > li > span {
                padding: 5px 10px;
                font-size: 12px;
            }
            .pagination-sm > li:first-child > a,
            .pagination-sm > li:first-child > span {
                border-bottom-left-radius: 3px;
                border-top-left-radius: 3px;
            }
            .pagination-sm > li:last-child > a,
            .pagination-sm > li:last-child > span {
                border-top-right-radius: 3px;
                border-bottom-right-radius: 3px;
            }
        </style>
        <div id="sidebar" class="span3">
            <jsp:include page="mycartIndex.jsp"></jsp:include>
                <ul id="sideManu" class="nav nav-tabs nav-stacked">
                <c:forEach items="${listC}" var="listC">
                    <li>
                        <a href="productClientByCategory.htm?categoryID=${listC.categoryID}&&page=1">${listC.name}</a>
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
            <c:if test="${not empty listP || listP.size()!=0}">
                <ul class="breadcrumb">
                    <li><a href="indexClient.htm">Home</a> <span class="divider">/</span></li>
                    <li class="active">Danh mục</li>
                </ul>
                <h3> ${listProductByCategory.categoryName} </h3>	
            </c:if>
            <c:if test="${empty listP}">
                <div class="alert alert-block alert-error fade in">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    <strong>Không có sản phẩm nào tồn tại trong danh mục này !!!</strong>
                </div>
            </c:if>
            <c:if test="${not empty listP || listP.size()!=0}">
                <hr class="soft"/>
                <p style="font-size: 12px; text-align: justify">Bạn muốn mua iPhone giá rẻ? Hãy đến AnPhat – hệ thống bán lẻ đã có nhiều năm kinh nghiệm đưa iPhone mới (vd: iPhone XS, iPhone XS Max, iPhone XR ) ở nước ngoài về Việt Nam từ rất sớm với mức giá hấp dẫn. Ngoài ra, AnPhat còn hỗ trợ mua trả góp, gia hạn bảo hành, bảo hành cả trường hợp làm rơi vỡ hay giao hàng tận nhà, mang lại nhiều lợi ích và sự yên tâm cho người dùng khi sử dụng điện thoại trong thời gian dài. Bên cạnh đó, đối với sản phẩm sắp về, quý khách có thể đặt cọc online để sở hữu máy trong thời gian sớm nhất.</p>
                <hr class="soft"/>
                <form class="form-horizontal span6">
                    <div class="control-group">
                        <label class="control-label alignL">Sắp xếp theo </label>
                        <select>
                            <option>Giá cao đến thấp</option>
                            <option>Giá thấp đến cao</option>
                            <option>Bán chạy nhất</option>
                            <option>Xem nhiều nhất</option>
                        </select>
                    </div>
                </form>

                <div id="myTab" class="pull-right">
                    <a href="#listView" data-toggle="tab"><span class="btn btn-large"><i class="icon-list"></i></span></a>
                    <a href="#blockView" data-toggle="tab"><span class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
                </div>
                <br class="clr"/>
                <div class="tab-content">
                    <div class="tab-pane" id="listView"> 
                        <c:forEach items="${listP}" var="p">
                            <div class="row">	  
                                <div class="span2">
                                    <img src="${p.image}" alt="${p.name}" style="width: 170px; height: 120px;"/>
                                </div>
                                <div class="span4">
                                    <h3>Mới | ${p.available?"Hết hàng":"Còn hàng"}</h3>				
                                    <hr class="soft"/>
                                    <h5>${p.name} </h5>
                                    <p>
                                        ${p.description}
                                    </p>
                                    <a class="btn btn-small pull-right" href="productClientByDetail.htm?productID=${p.productID}&&categoryID=${p.categoryID.categoryID}">Xem chi tiết</a>
                                    <br class="clr"/>
                                </div>
                                <div class="span3 alignR">
                                    <form class="form-horizontal qtyFrm">
                                        <h3> <fmt:formatNumber value = "${p.price}" /> $</h3>
                                        <label class="checkbox"></label><br/>
                                        <a href="them-vao-gio-hang.htm?productID=${p.productID}&&cateId=${p.categoryID.categoryID}&&page=${currentPage}&&back=2" class="btn btn-large btn-primary"> Thêm <i class=" icon-shopping-cart"></i></a>
                                        <a href="productClientByDetail.htm?productID=${p.productID}&&categoryID=${p.categoryID.categoryID}" class="btn btn-large"><i class="icon-zoom-in"></i></a>

                                    </form>
                                </div>
                            </div>
                            <hr class="soft"/>
                        </c:forEach>
                    </div>

                    <div class="tab-pane  active" id="blockView">
                        <ul class="thumbnails">
                            <c:forEach items="${listP}" var="p">
                                <li class="span3">
                                    <div class="thumbnail">
                                        <a href="productClientByDetail.htm?productID=${p.productID}&&categoryID=${p.categoryID.categoryID}"><img src="${p.image}" style="width: 230px; height: 160px" alt=""/></a>
                                        <div class="caption">
                                            <h5>${p.name}</h5>
                                            <h4 style="text-align:center">
                                                <a class="btn" href="productClientByDetail.htm?productID=${p.productID}&&categoryID=${p.categoryID.categoryID}"> 
                                                    <i class="icon-zoom-in"></i>
                                                </a> 
                                                <a class="btn" href="them-vao-gio-hang.htm?productID=${p.productID}&&cateId=${p.categoryID.categoryID}&&page=${currentPage}&&back=2">Thêm 
                                                    <i class="icon-shopping-cart"></i>
                                                </a> 
                                                <a class="btn btn-primary" href="#"><fmt:formatNumber value = "${p.price}" /> $</a>
                                            </h4>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                        <hr class="soft"/>
                    </div>
                    <!--Pagination-->
                                <div style="float:right">
                                    <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                        <ul class="pagination">
                                            <c:if test="${currentPage != 1}">
                                                <li class="paginate_button previous">
                                                    <a href="productClientByCategory.htm?categoryID=${id}&&page=${currentPage-1}">Previous</a>
                                                </li>
                                            </c:if>
                                            <c:forEach begin="1" end="${noOfPages}" var="i">
                                                <c:choose>
                                                    <c:when test="${currentPage eq i}">
                                                        <li class="paginate_button active">
                                                            <a>${i} <span class="sr-only"></span></a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="paginate_button">
                                                            <a href="productClientByCategory.htm?categoryID=${id}&&page=${i}">${i}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            <c:if test="${currentPage lt noOfPages}">
                                                <li class="paginate_button next">
                                                    <a href="productClientByCategory.htm?categoryID=${id}&&page=${currentPage+1}">Next</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div>
                                <!--End Pagination-->
                </div>
                <div class="">
                    <h4 style="border-bottom: #6F6F6F 1px dotted; padding-bottom: 5px; "><span style="color: #e11b1e">iPhone </span> – Người kế nhiệm hoàn hảo của iPhone</h4>
                    <p style="font-size: 12px; text-align: justify">Không thay đổi nhiều về ngoại hình so với người tiền nhiệm iPhone nhưng iPhone được “lột xác” mạnh mẽ ở bên trong và hứa hẹn sẽ tiếp tục tạo nên những kỷ lục mới về doanh số iPhone cho Apple.</p>
                    <p style="font-size: 12px; text-align: justify">Bạn đang tìm hiểu về việc mua iPhone trả góp? Hãy đến AnPhat. Đây là hệ thống cửa hàng kinh doanh điện thoại, máy tính bảng, laptop và phụ kiện đã có nhiều năm phân phối iPhone, chuyên đưa iPhone mới (vd: iPhone XS, iPhone XS Max, iPhone XR) về Việt Nam trong thời gian ngắn nhất ngay sau khi sản phẩm ra mắt ở nước ngoài. Đến với AnPhat, bạn sẽ có được chiếc iPhone ưng ý nhất và cảm giác hài lòng về chất lượng dịch vụ tại đây.</p>
                    <h4 style="border-bottom: #6F6F6F 1px dotted; padding-bottom: 5px; ">Tại sao nên mua iPhone?</h4>
                    <ul>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">Là một trong những chiếc điện thoại đẹp nhất trên thị trường, thể hiện nét sang trọng, đẳng cấp rất riêng của một thiết bị mang thương hiệu Apple.</li>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">Màn hình, hiệu năng, tính năng, loa, camera, pin... đều được nâng cấp so với iPhone.</li>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">Thiết kế giữ được sự nhỏ gọn dù kích thước màn hình lớn, cho cảm giác cầm nắm và thao tác thoải mái bằng một tay.</li>
                    </ul>
                    <h4 style="border-bottom: #6F6F6F 1px dotted; padding-bottom: 5px; ">Tại sao nên mua iPhone XS tại CellphoneS?</h4>
                    <ul>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">Địa chỉ bán iPhone&nbsp;giá rẻ, có nhiều ưu đãi cho thành viên.</li>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">Chế độ bảo hành chu đáo.</li>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">Nhiều dịch vụ tiện ích đi kèm để người dùng yên tâm sử dụng trong thời gian dài như: gia hạn bảo hành, bảo hành cả trường hợp làm rơi vỡ (với chi phí hợp lý).</li>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">Được mua trả góp với số tiền góp hàng tháng và thời gian góp tùy chọn, có hình thức trả góp 0% lãi suất giúp người dùng dễ dàng cân đối chi tiêu.</li>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">Hỗ trợ giao hàng về tận nhà dù người dùng sống ở bất kỳ tỉnh thành nào trên toàn quốc.</li>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">Đội ngũ tư vấn viên và hỗ trợ kỹ thuật online / tại cửa hàng luôn tận tâm lắng nghe, giải đáp mọi thắc mắc và đáp ứng mọi nhu cầu nhỏ nhất của khách hàng.</li>
                    </ul>
                </div>
            </c:if>
        </div>
    </jsp:attribute>
</categoies:layoutclientcategory>
