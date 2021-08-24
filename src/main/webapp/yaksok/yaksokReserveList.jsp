<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    			
    			<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <br>
                    <h1 class="h3 mb-2 text-gray-800">예약관리</h1><br>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>이름</th>
                                            <th>전화번호</th>
                                            <th>메모</th>
                                            <th>날짜</th>
                                            <th>확인 여부</th>
                                        </tr>
                                     </thead>
                                     <tbody>   
                                        <c:if test="${reserveList eq null or empty reserveList}">
                                        <tr>
                                            <td>등록된 예약이 없습니다.</td>
                                        </tr>
                                        </c:if>
                                        
                                        <c:if test="${reserveList ne null and not empty reserveList}">
                                        <c:forEach var="list" items="${reserveList}">
                                        <tr>
                                            <td>${list.ridx}</td>
                                            <td>${list.rusername}</td>
                                            <td>${list.rhp}</td>
                                            <td>${list.rcontent}</td>
                                            <td>${list.rindate}</td>
                                            <td>${list.rcheckedstate}</td>
                                        </tr>
                                        </c:forEach>
                                        </c:if>
                                    </tbody>
                                    <tfoot>
										<tr>
											<td colspan="3">
												<ul class="pagination justify-content-center">
													<c:forEach var="i" begin="1" end="${pageCount}">
														<li class="page-item <c:if test="${param.cpage eq i}">active</c:if>">
															<a class="page-link" 
															href="prodDetail.me?cpage=${i}&pnum=${item.pnum}">${i}</a>
														</li>
													</c:forEach>
												</ul>
											</td>
										</tr>
									</tfoot>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->