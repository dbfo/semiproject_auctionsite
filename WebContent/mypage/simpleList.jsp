<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
	function td_copy(val){
		
		table1 = document.getElementById("table");
	
	    table1.rows[1].cells[0].innerHTML = "hello";
	
	}
	
</script>

<table border=1 id = "table">
	<tr>
		<th rowspan="2">MY</th>
		<th>������</th>
		<th>�Աݿ�û</th>
		<th>���</th>
		<th>�Ǹ���</th>
		<th>��ۿ�û</th>
		<th>������ ����</th>
	</tr>
	<tr>
		<td>0</td>
		<td>0</td>
		<td>0</td>
		<td>0</td>
		<td>0</td>
		<td>0</td>
	</tr>
</table>

<input type = "button" onclick = "td_copy(0)">