<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>������ ó���� ����Ʈ</h1>
<table border="1">
	<tr>
		<th>NO</th>
		<th>���Ǳ� ����</th>
		<th>�ۼ���</th>
		<th>�亯����</th>
		<th>�����</th>
	</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td>${vo.b_num }</td>		
			<td><a href="${cp }/board.detail.jh?b_num=${vo.b_num}&m_id=${vo.m_id}">
			${vo.b_title}</a></td>		
			<td>${vo.m_id}</td>		
			<td>${vo.boardName }</td>
			<td>${vo.b_regdate }</td>
		</tr>
	</c:forEach>
</table>
<br>
<div>
	<c:choose>
		<c:when test="${startPage>3}">
				<a href="${cp}/board.qnadoing.jh?pageNum=${startPage-3}&field=${field}
				&keyword=${keyword}&type=${type}">[����]</a>
		</c:when>
	</c:choose>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:choose>
			<c:when test="${pageNum==i }">
				<span><a href="${cp}/board.qnadoing.jh?pageNum=${i}&field=${field}
				&keyword=${keyword}&type=${type}">
				[${i}]</a></span>
			</c:when>
			<c:otherwise>
				<span><a href="${cp}/board.qnadoing.jh?pageNum=${i}&field=${field}
				&keyword=${keyword}&type=${type}">
				[${i}]</a></span>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<!-- ������ư -->
		<c:choose>
		<c:when test="${endPage<pageCount }">
			<a href="${cp}/board.qnadoing.jh?pageNum=${endPage+1}&field=${field}
			&keyword=${keyword}&type=${type}">[����]</a>
		</c:when>
	</c:choose>
</div>
<br>
<!-- �˻���� -->
<div>
	<form method="post" action="${cp }/board.qnadoing.jh?type=${type}">
		<select name="field">
			<option value="id" <c:if test="${field=='id' }">selected</c:if>>�ۼ���</option>
			<option value="b_title" <c:if test="${field=='b_title' }">selected</c:if>>������</option>
			<option value="b_content" <c:if test="${field=='b_contnent' }">selected</c:if>>����</option>
		</select>
		<input type="text" name="keyword" value="${keyword }">
		<input type="submit" value="�˻�">
	</form>
</div>