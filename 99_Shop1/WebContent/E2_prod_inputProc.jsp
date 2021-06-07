<%@page import="project.ProDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    String keep = request.getParameter("keep");
	String configFolder = config.getServletContext().getRealPath("/ABC/images"); // configFolder => 업로드 전용. // System.out.println(configFolder);
	// C:\Users\Sunwoo\Desktop\JSP_PSW\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\17_Project\ABC\images
	String requestFolder = request.getContextPath() + "/ABC/images"; // requestFolder => 다운로드 전용. // System.out.println(requestFolder);
	// /17_Project/ABC/images
	MultipartRequest mr = new MultipartRequest(request,
											   configFolder,
											   1024 * 1024 * 10,
											   "UTF-8",
											   new DefaultFileRenamePolicy());
	
	String pimage = mr.getOriginalFileName("pimage");
	System.out.println("pimage 수정 입력 : " + pimage);
	
	ProDao dao = ProDao.getInstance();
	int cnt = dao.insertPro(mr); // 입력폼의 모든 값 = mr
	String msg = "", url = "";
	if(cnt > 0) {
		msg = "상품 등록에 성공";
		url = "E3_prod_list.jsp?keep=" + keep;
	} else {
		msg = "상품 등록에 실패";
		url = "E1_prod_input.jsp?keep=" + keep;
	}
	%>
	
	<script>
		alert("<%=msg%>" + "했습니다.");
		location.href = "<%=url%>";
	</script>
	
	