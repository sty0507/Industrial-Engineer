<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href= "style.css"/>
</head>


<body>
<jsp:include page="header.jsp"/>
	<section>
	<h1>회원매출조회</h1>
		<form>
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>고객등급</td>
					<td>매출</td>
				</tr>
				
				<%
					request.setCharacterEncoding("UTF-8");
					Connection conn = null;
					Statement stmt = null;
					String grade="";
				
					try{
						conn = Util.getConnection();//디비 연결
						stmt = conn.createStatement();// sql 실행하기 위한 변수
						String sql = "select me.custno, me.custname, me.grade, sum(mo.price) as total from member_tbl_02 me, money_tbl_02 mo where me.custno = mo.custno group by me.custno,me.custname, me.grade order by sum(mo.price) desc";
						
						ResultSet rs = stmt.executeQuery(sql);
						while(rs.next()){
							grade = rs.getString("grade");
							switch(grade){
								case "A":
									grade ="VIP";
									break;
								case "B":
									grade = "일반";
									break;
								case "C":
									grade = "직원";
									break;
							}
				%>
							<tr>
								<td><%= rs.getString("custno") %></td>
								<td><%= rs.getString("custname") %></td>
								<td><%= grade %></td>
								<td><%= rs.getString("total") %></td>
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
	<jsp:include page="footer.jsp"/>
</body>
</html>
