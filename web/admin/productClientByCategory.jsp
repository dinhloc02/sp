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
                        <h5>Ph????ng th???c thanh to??n</h5>
                    </div>
                </div>
            </div>
            <div class="span9">
            <c:if test="${not empty listP || listP.size()!=0}">
                <ul class="breadcrumb">
                    <li><a href="indexClient.htm">Home</a> <span class="divider">/</span></li>
                    <li class="active">Danh m???c</li>
                </ul>
                <h3> ${listProductByCategory.categoryName} </h3>	
            </c:if>
            <c:if test="${empty listP}">
                <div class="alert alert-block alert-error fade in">
                    <button type="button" class="close" data-dismiss="alert">??</button>
                    <strong>Kh??ng c?? s???n ph???m n??o t???n t???i trong danh m???c n??y !!!</strong>
                </div>
            </c:if>
            <c:if test="${not empty listP || listP.size()!=0}">
                <hr class="soft"/>
                <p style="font-size: 12px; text-align: justify">B???n mu???n mua iPhone gi?? r???? H??y ?????n AnPhat ??? h??? th???ng b??n l??? ???? c?? nhi???u n??m kinh nghi???m ????a iPhone m???i (vd: iPhone XS, iPhone XS Max, iPhone XR ) ??? n?????c ngo??i v??? Vi???t Nam t??? r???t s???m v???i m???c gi?? h???p d???n. Ngo??i ra, AnPhat c??n h??? tr??? mua tr??? g??p, gia h???n b???o h??nh, b???o h??nh c??? tr?????ng h???p l??m r??i v??? hay giao h??ng t???n nh??, mang l???i nhi???u l???i ??ch v?? s??? y??n t??m cho ng?????i d??ng khi s??? d???ng ??i???n tho???i trong th???i gian d??i. B??n c???nh ????, ?????i v???i s???n ph???m s???p v???, qu?? kh??ch c?? th??? ?????t c???c online ????? s??? h???u m??y trong th???i gian s???m nh???t.</p>
                <hr class="soft"/>
                <form class="form-horizontal span6">
                    <div class="control-group">
                        <label class="control-label alignL">S???p x???p theo </label>
                        <select>
                            <option>Gi?? cao ?????n th???p</option>
                            <option>Gi?? th???p ?????n cao</option>
                            <option>B??n ch???y nh???t</option>
                            <option>Xem nhi???u nh???t</option>
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
                                    <h3>M???i | ${p.available?"H???t h??ng":"C??n h??ng"}</h3>				
                                    <hr class="soft"/>
                                    <h5>${p.name} </h5>
                                    <p>
                                        ${p.description}
                                    </p>
                                    <a class="btn btn-small pull-right" href="productClientByDetail.htm?productID=${p.productID}&&categoryID=${p.categoryID.categoryID}">Xem chi ti???t</a>
                                    <br class="clr"/>
                                </div>
                                <div class="span3 alignR">
                                    <form class="form-horizontal qtyFrm">
                                        <h3> <fmt:formatNumber value = "${p.price}" /> $</h3>
                                        <label class="checkbox"></label><br/>
                                        <a href="them-vao-gio-hang.htm?productID=${p.productID}&&cateId=${p.categoryID.categoryID}&&page=${currentPage}&&back=2" class="btn btn-large btn-primary"> Th??m <i class=" icon-shopping-cart"></i></a>
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
                                                <a class="btn" href="them-vao-gio-hang.htm?productID=${p.productID}&&cateId=${p.categoryID.categoryID}&&page=${currentPage}&&back=2">Th??m 
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
                    <h4 style="border-bottom: #6F6F6F 1px dotted; padding-bottom: 5px; "><span style="color: #e11b1e">iPhone </span> ??? Ng?????i k??? nhi???m ho??n h???o c???a iPhone</h4>
                    <p style="font-size: 12px; text-align: justify">Kh??ng thay ?????i nhi???u v??? ngo???i h??nh so v???i ng?????i ti???n nhi???m iPhone nh??ng iPhone ???????c ???l???t x??c??? m???nh m??? ??? b??n trong v?? h???a h???n s??? ti???p t???c t???o n??n nh???ng k??? l???c m???i v??? doanh s??? iPhone cho Apple.</p>
                    <p style="font-size: 12px; text-align: justify">B???n ??ang t??m hi???u v??? vi???c mua iPhone tr??? g??p? H??y ?????n AnPhat. ????y l?? h??? th???ng c???a h??ng kinh doanh ??i???n tho???i, m??y t??nh b???ng, laptop v?? ph??? ki???n ???? c?? nhi???u n??m ph??n ph???i iPhone, chuy??n ????a iPhone m???i (vd: iPhone XS, iPhone XS Max, iPhone XR) v??? Vi???t Nam trong th???i gian ng???n nh???t ngay sau khi s???n ph???m ra m???t ??? n?????c ngo??i. ?????n v???i AnPhat, b???n s??? c?? ???????c chi???c iPhone ??ng ?? nh???t v?? c???m gi??c h??i l??ng v??? ch???t l?????ng d???ch v??? t???i ????y.</p>
                    <h4 style="border-bottom: #6F6F6F 1px dotted; padding-bottom: 5px; ">T???i sao n??n mua iPhone?</h4>
                    <ul>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">L?? m???t trong nh???ng chi???c ??i???n tho???i ?????p nh???t tr??n th??? tr?????ng, th??? hi???n n??t sang tr???ng, ?????ng c???p r???t ri??ng c???a m???t thi???t b??? mang th????ng hi???u Apple.</li>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">M??n h??nh, hi???u n??ng, t??nh n??ng, loa, camera, pin... ?????u ???????c n??ng c???p so v???i iPhone.</li>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">Thi???t k??? gi??? ???????c s??? nh??? g???n d?? k??ch th?????c m??n h??nh l???n, cho c???m gi??c c???m n???m v?? thao t??c tho???i m??i b???ng m???t tay.</li>
                    </ul>
                    <h4 style="border-bottom: #6F6F6F 1px dotted; padding-bottom: 5px; ">T???i sao n??n mua iPhone XS t???i CellphoneS?</h4>
                    <ul>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">?????a ch??? b??n iPhone&nbsp;gi?? r???, c?? nhi???u ??u ????i cho th??nh vi??n.</li>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">Ch??? ????? b???o h??nh chu ????o.</li>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">Nhi???u d???ch v??? ti???n ??ch ??i k??m ????? ng?????i d??ng y??n t??m s??? d???ng trong th???i gian d??i nh??: gia h???n b???o h??nh, b???o h??nh c??? tr?????ng h???p l??m r??i v??? (v???i chi ph?? h???p l??).</li>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">???????c mua tr??? g??p v???i s??? ti???n g??p h??ng th??ng v?? th???i gian g??p t??y ch???n, c?? h??nh th???c tr??? g??p 0% l??i su???t gi??p ng?????i d??ng d??? d??ng c??n ?????i chi ti??u.</li>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">H??? tr??? giao h??ng v??? t???n nh?? d?? ng?????i d??ng s???ng ??? b???t k??? t???nh th??nh n??o tr??n to??n qu???c.</li>
                        <li style="font-size: 12px; text-align: justify; line-height: 18px; list-style-type: circle; margin-bottom: 8px; margin-left: 5px;">?????i ng?? t?? v???n vi??n v?? h??? tr??? k??? thu???t online / t???i c???a h??ng lu??n t???n t??m l???ng nghe, gi???i ????p m???i th???c m???c v?? ????p ???ng m???i nhu c???u nh??? nh???t c???a kh??ch h??ng.</li>
                    </ul>
                </div>
            </c:if>
        </div>
    </jsp:attribute>
</categoies:layoutclientcategory>
