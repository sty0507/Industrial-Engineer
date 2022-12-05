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
<jsp:include page="header.jsp"></jsp:include>
<script type="text/javascript" src="check.js"></script>
<section>
<h1>등록된 선수 정보 수정</h1>
	<form name="frm" action="action.jsp">
		<table border="1">
		<input type="hidden" value="modify" name="mode"/>
		<%
			String id = request.getParameter("pid");
			try{
				Connection con = Util.getConnection();
				Statement stmt = con.createStatement();
				String sql = "select * from tbl_player_20221205 where player_id = "+id;
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
		%>
			
			<tr>
				<td>선수ID</td>
				<td><input type="text" name="id" value=<%= id %> /></td>
			</tr>
			<tr>
				<td>선수이름</td>
				<td><input type="text" name="name" value=<%= rs.getString("player_name") %> /></td>
			</tr>
			<tr>
				<td>포지션</td>
				<td>
					<input type="radio" name="po" value="GF" <% if(rs.getString("player_position").equals("GF")) out.print("checked"); %>/>골키퍼
					<input type="radio" name="po" value="DF" <% if(rs.getString("player_position").equals("DF")) out.print("checked"); %>/>수비수
					<input type="radio" name="po" value="MF" <% if(rs.getString("player_position").equals("MF")) out.print("checked"); %>/>미드필더
					<input type="radio" name="po" value="FW" <% if(rs.getString("player_position").equals("FW")) out.print("checked"); %>/>공격수
					
				</td>
			</tr>
			<tr>
				<td>선수등록일</td>
				<td><input type="text" name="day" value=<%= rs.getString("player_date") %> /></td>
			</tr>
			<tr>
				<td>소속팀</td>
				<td>
					<select name="team">
						<option value="K00" <% if(rs.getString("team_id").equals("K00")) out.print("selected"); %> >무소속</option>
						<option value="K01" <% if(rs.getString("team_id").equals("K01")) out.print("selected"); %> >울산현대</option>
						<option value="K02" <% if(rs.getString("team_id").equals("K02")) out.print("selected"); %> >삼성블루윙즈</option>
						<option value="K03" <% if(rs.getString("team_id").equals("K03")) out.print("selected"); %> >스틸러스</option>
						<option value="K04" <% if(rs.getString("team_id").equals("K04")) out.print("selected"); %> >유나이티드</option>
						<option value="K05" <% if(rs.getString("team_id").equals("K05")) out.print("selected"); %> >현대모터스</option>
						<option value="K06" <% if(rs.getString("team_id").equals("K06")) out.print("selected"); %> >FC부산소마고</option>
						<option value="K07" <% if(rs.getString("team_id").equals("K07")) out.print("selected"); %> >드래곤즈</option>
						<option value="K08" <% if(rs.getString("team_id").equals("K08")) out.print("selected"); %> >일화천마</option>
						<option value="K09" <% if(rs.getString("team_id").equals("K09")) out.print("selected"); %> >FC서울</option>
						<option value="K10" <% if(rs.getString("team_id").equals("K10")) out.print("selected"); %> >시티즌</option>
						<option value="K11" <% if(rs.getString("team_id").equals("K11")) out.print("selected"); %> >경남FC</option>
						<option value="K12" <% if(rs.getString("team_id").equals("K12")) out.print("selected"); %> >광주상무</option>
						<option value="K13" <% if(rs.getString("team_id").equals("K13")) out.print("selected"); %> >강원FC</option>
						<option value="K14" <% if(rs.getString("team_id").equals("K14")) out.print("selected"); %> >제주유나이티드FC</option>
						<option value="K15" <% if(rs.getString("team_id").equals("K15")) out.print("selected"); %> >대구FC</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="추가" onclick="return check()"/>
					<input type="reset" value="취소" onclick="Re()"/>
				</td>
			</tr>
			<%
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			%>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>