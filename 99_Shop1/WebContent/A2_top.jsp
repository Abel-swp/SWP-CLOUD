<%@page import="project.CatBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.CatDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%ArrayList<CatBean> list2 = null;%>
    
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/custom2.css">
	<link rel="stylesheet" type="text/css" href="css/kfonts2.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	
	<script>
		function homeh(){
			location.href = "ABC/A_user/A1_display.jsp?keep=guest";
		}
	</script>
    
    <font size=6>Food Safety Store</font> <p>
    <a href="A1_main.jsp"><font size=3>HOME</font></a> <p>
    
    <table border="1" width="800" height="400" align="center" class="">
    	<tr>
    		<td rowspan="3" align="center">
    		<!-- ********************** -->
    		<form method="post" action="B4_loginProc.jsp">
			<table border="0" class="table">
				<tr class="active">
					<td bgcolor="#FFCC00" align="center"> :: ID :: <br>
					</td>
				</tr>
				<tr>
					<td>
						<div style="position:relative; top:10px;">
							<input type="text" name="id" class="form-control" placeholder="아이디 입력"> <br>
						</div>
					</td>
				</tr>
				<tr class="active">
					<td  bgcolor="#FFCC00" align="center"> :: PASSWORD :: <br>
					</td>
				</tr>
				<tr>
					<td>
						<div style="position:relative; top:10px;">
							<input type="password" name="password" class="form-control" placeholder="비밀번호 입력">
						</div>
					</td>
				</tr>
			</table>
			<table style="margin:auto;" class="table">
				<tr class="success">
					<td><input type="submit" class="btn btn-success" value="로그인"></td>
				</tr>
				<tr class="success">
					<td><input type="button" class="btn btn-success" value="회원가입" onClick="location.href='B1_register.jsp'"></td>
				</tr>
				<tr class="warning">
					<td><input type="button" class="btn btn-warning" value="아이디 찾기" onClick="location.href='C1_findid.jsp'"></td>
				</tr>
				<tr class="warning">
					<td><input type="button" class="btn btn-warning" value="비번 찾기" onClick="location.href='C3_findpw.jsp'"></td>
				</tr>
				<tr class="active">
					<td><input type="button" class="btn btn-info" name="home" value="사용자 홈" onClick="homeh()"></td>
				</tr>
			</table>	
			</form>
			<!-- ********************** -->
    		</td>
    		<%
			CatDao dao2 = CatDao.getInstance();
			list2 = dao2.AllCat();
			%>
			<%if(list2.size() == 0) {%>
				<td align="center" height="30" class="active">
					<ul class="nav nav-pills" style="position:relative; left:18.75em">
						<li><a href="">등록된 카테고리 없음</a></li>
					</ul>
				</td>
				<%-- <%out.print("<td align='center' height='30' class='active'>등록된 카테고리 없음</td>");%> --%>
			<%} else {%>
				<%for(CatBean bean : list2){ // A2_display_top.jsp 에서 가져온 카테고리 for문
				String cname = bean.getCname();
				String ccode = bean.getCcode();%>
				<td align="center" height="30" class="active">
					<ul class="nav nav-pills">
						<li><a href="ABC/A_user/B1_display_cglist.jsp?cname=<%=cname%>&ccode=<%=ccode%>&keep=guest"><%=cname%></a></li>
    				<%-- <a href="ABC/A_user/B1_display_cglist.jsp?cname=<%=cname%>&ccode=<%=ccode%>&keep=<%=decode%>"><%=cname%></a> --%>
    				</ul>
    			</td>
				<%}%>
			<%}%>
    	</tr>
    	<tr height="400">
    		<!-- ********************** -->

    	