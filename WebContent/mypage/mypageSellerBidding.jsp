<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<div id = "page-wrapper">
<div id="leftMenu">
	<jsp:include page="newLeftMenu.jsp"></jsp:include>
</div>

<div id="page-content-wrapper">
    <div class="container-fluid">
      <h1>입찰 중 리스트</h1>
    </div>
	<table  class="table table-bordered" border=1 style="text-align: center; 
		margin-top: 40px"> 
		<thead class = "thead">
		<tr>
			<th scope="col">NO</th>
			<th scope="col">물품명</th>
			<th scope="col">조회</th>
			<th scope="col">시작일</th>
			<th scope="col">마감일</th>
			<th scope="col">현재가</th>
			<th scope="col">입찰</th>
			<th scope="col">남은 일자</th>
		</tr>

		<c:if test="${getListSize == 0  }">
			<tr>
				<td colspan="8" scope="row">>정보가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		
		<c:set var="i" value="0"/>
		<c:forEach var="anum" items="${anumList}">
			<c:set var="i" value = "${i+1 }"/>
			<tr>
				<td scope="row">${i}</td>

				<!-- 경매 정보-->
				<c:forEach var = "bidinfo" items = "${BiddingInfoList}">
					<c:if test="${ bidinfo.key == anum }">
						<td>${bidinfo.value.a_title}</td>
						<td>${bidinfo.value.a_check}</td>
						<td>${bidinfo.value.a_startdate}</td>
						<td>${bidinfo.value.a_enddate}</td>

				<!-- 현재 입찰 가격 -->
				<c:forEach var = "currP" items = "${currPriceList}">
					<c:if test="${ currP.key == anum }">
						<td>${currP.value}</td>
					</c:if>				
				</c:forEach>

				<!-- 입찰 등록 수-->
				<c:forEach var = "bidCount" items = "${BidCountList}">
					<c:if test="${ bidCount.key == anum }">
						<td>${bidCount.value}</td>
					</c:if>				
				</c:forEach>

				<td>${bidinfo.value.remainDate}</td>
					</c:if>				
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</div>
</div>