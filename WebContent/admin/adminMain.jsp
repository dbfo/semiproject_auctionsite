<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>관리자 메인페이지</h1>
<table border="1">
	<tr>
		<th rowspan="2">처리현황</th>
		<th>신고검토중</th>
		<th>문의사항 답변중</th>
		<th>탈퇴처리중</th>
	</tr>
	<tr>
		<td><a href="${cp }/singo.doing.jh?type=0">${singoCount }</a></td>
		<td><a href="${cp }/board.qnadoing.jh?type=0">${qnaCount }</a></td>
		<td><a href="${cp }/members.doing.jh?type=1">${membersCount }</a></td>
	</tr>

</table>