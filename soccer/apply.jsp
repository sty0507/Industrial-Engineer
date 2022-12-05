<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<h1>선수 등록</h1>
	<form name="frm" action="action.jsp" method="post">
		<table border="1">
			<input type="hidden" value="add" name="mode"/>
			<tr>
				<td>선수ID</td>
				<%
					try{
						Connection con = Util.getConnection();
						Statement stmt = con.createStatement();
						String sql = "select max(player_id) as max from tbl_player_20221205";
						ResultSet rs = stmt.executeQuery(sql);
						rs.next();
				%>
				<td><input type="text" name="id" value=<%= rs.getInt("max")+1%> readonly/></td>
				<%
					}catch(Exception e){
						e.printStackTrace();
					}
				%>
			</tr>
			<tr>
				<td>선수이름</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>포지션</td>
				<td>
					<input type="radio" name="po" value="0" hidden checked/>
					<input type="radio" name="po" value="GF"/>골키퍼
					<input type="radio" name="po" value="DF"/>수비수
					<input type="radio" name="po" value="MF"/>미드필더
					<input type="radio" name="po" value="FW"/>공격수
					
				</td>
			</tr>
			<tr>
				<td>선수등록일</td>
				<td><input type="text" name="day"/></td>
			</tr>
			<tr>
				<td>소속팀</td>
				<td>
					<select name="team">
						<option value="0" hidden>선택하세요</option>
						<option value="000">무소속</option>
						<option value="C03">울산현대</option>
						<option value="D03">삼성블루윙즈</option>
						<option value="C03">스틸러스</option>
						<option value="B01">유나이티드</option>
						<option value="D03">현대모터스</option>
						<option value="C01">FC부산소마고</option>
						<option value="D01">드래곤즈</option>
						<option value="B02">일화천마</option>
						<option value="B03">FC서울</option>
						<option value="D02">시티즌</option>
						<option value="C02">경남FC</option>
						<option value="A01">광주상무</option>
						<option value="A02">강원FC</option>
						<option value="A03">제주유나이티드FC</option>
						<option value="A04">대구FC</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="추가" onclick="return check()"/>
					<input type="reset" value="취소" onclick="Re()"/>
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>