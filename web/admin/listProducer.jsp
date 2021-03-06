<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<mt:layout title="Producer Page">   
    <jsp:attribute name="content">
        <div class="inner">
            <div class="row">
                <div class="col-lg-12">
                    <h3> Nhà sản xuất </h3>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-lg-12">
                    <div id="div-5" class="accordion-body collapse in body">
                        <div class="form-group row">
                            <div class="col-lg-4"></div>
                            <div class="col-lg-5" style="margin-bottom:-8px;">
                                <form action="initfindPro.htm" class="form-horizontal" method="post">
                                    <div class="form-group input-group">
                                        <input path="name" type="text" id="name" name="name" placeholder="Tên nhà sản xuất" value="${currentName}" class="form-control"/>
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="submit"><i class="icon-search"></i></button>
                                        </span>
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-3">
                                <div id="AlertBox" class="a hiden" style="margin-top: 6px; font-size: large; color: #468847;">
                                    ${notificationsSuccessfully}
                                </div>
                                <div id="AlertBox2" class="b hiden" style="margin-top: 6px; font-size: large; color: #b94a48;">
                                    ${notificationsError}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Màn hình hiển thị dữ liệu
                            <div style="float:right">
                                <a href="initAddProducer.htm" class="btn btn-default btn-sm" style="margin-top:-5px">
                                    Thêm Mới
                                </a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th style="width: 150px;">Tên Nhà Cung Cấp</th>
                                            <th style="width: 150px;">Gmail</th>
                                            <th style="width: 150px;">Logo</th>
                                            <th style="width: 150px;">Điện Thoại</th>
                                            <th style="width: 150px;">Thao Tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listProducer}" var="p">
                                            <tr>
                                                <td>${p.name}</td>
                                                <td>${p.email}</td>
                                                <td><img src="${p.logo}" width="220px;" height="175px;" /></td>
                                                <td>${p.phone}</td>
                                                <td>
                                                    <a href="initUpdateProducer.htm?producerID=${p.producerID}" class="btn btn-primary"><i class="icon-pencil icon-white"></i></a>
                                                    <a href="deleteProducer.htm?producerID=${p.producerID}&&find=${currentName}&&page=${currentPage}" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa bản ghi này?')"><i class="icon-remove icon-white"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <!--Pagination-->
                                <c:choose>
                                    <c:when test="${currentName != null}">
                                        <div style="float:right">
                                            <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                                <ul class="pagination">
                                                    <c:if test="${currentPage != 1}">
                                                        <li class="paginate_button previous">
                                                            <a href="findPro.htm?name=${currentName}&&page=${currentPage-1}">Previous</a>
                                                        </li>
                                                    </c:if>
                                                    <c:forEach begin="1" end="${noOfPages}" var="i">
                                                        <c:choose>
                                                            <c:when test="${currentPage eq i}">
                                                                <li class="paginate_button active">
                                                                    <a>${i} <span class="sr-only">(current)</span></a>
                                                                </li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="paginate_button">
                                                                    <a href="findPro.htm?name=${currentName}&&page=${i}">${i}</a>
                                                                </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                    <c:if test="${currentPage lt noOfPages}">
                                                        <li class="paginate_button next">
                                                            <a href="findPro.htm?name=${currentName}&&page=${currentPage+1}">Next</a>
                                                        </li>
                                                    </c:if>
                                                </ul>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div style="float:right">
                                            <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                                <ul class="pagination">
                                                    <c:if test="${currentPage != 1}">
                                                        <li class="paginate_button previous">
                                                            <a href="listPro.htm?page=${currentPage-1}">Previous</a>
                                                        </li>
                                                    </c:if>
                                                    <c:forEach begin="1" end="${noOfPages}" var="i">
                                                        <c:choose>
                                                            <c:when test="${currentPage eq i}">
                                                                <li class="paginate_button active">
                                                                    <a>${i} <span class="sr-only">(current)</span></a>
                                                                </li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="paginate_button">
                                                                    <a href="listPro.htm?page=${i}">${i}</a>
                                                                </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                    <c:if test="${currentPage lt noOfPages}">
                                                        <li class="paginate_button next">
                                                            <a href="listPro.htm?page=${currentPage+1}">Next</a>
                                                        </li>
                                                    </c:if>
                                                </ul>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <!--End Pagination-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>
</mt:layout>
