<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax folder</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<h1>Ajax list</h1>
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">제목 (views)</th>
      <th scope="col">제목 (board)</th>
      <th scope="col">작성일</th>
      <th scope="col">작성시간</th>
    </tr>
  </thead>
  <tbody id="tBody"></tbody>
</table>
<button type="button" class="btn btn-outline-primary" onclick="goPage('/ajax/insert')">글쓰기</button>
<button type="button" class="btn btn-outline-success" onclick="goPage('/ajax/update')">Update</button>
<!-- <button type="button" class="btn btn-outline-primary" onclick="refresh()">Refresh</button> -->
<script>
window.onload = function(){
	var xhr = new XMLHttpRequest();
	xhr.open('GET','/ajax/board/view?cmd=list');
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var list = JSON.parse(xhr.responseText);
			var tBody = document.getElementById('tBody');
			var html = '';
			for(var i=0; i<list.length; i++){
				html += '<tr>';
				html += '<td>' + list[i].biNum + '</td>';
				html += '<td><a href="/views/ajax/view?biNum=' + list[i].biNum +'">' + list[i].biTitle + '</a></td>';
				html += '<td><a href="/ajax/board/view?cmd=view&biNum=' + list[i].biNum +'">' + list[i].biTitle + '</a></td>';
				html += '<td>' + list[i].credat + '</td>';
				html += '<td>' + list[i].cretim + '</td>';
				html += '</tr>';
			}
			tBody.innerHTML = html;
//	 		document.write(xhr.responseText);
		}
	}
	xhr.send();
}

// window.onload = refresh;
</script>
</body>
</html>