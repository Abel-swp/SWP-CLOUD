<%@page import="project.ProDao"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
	String keep = request.getParameter("keep");
    String pnum = request.getParameter("a"); // E3_prod_list.jsp 로 부터 get방식으로 넘겨받은 a(pnum) 값. Dao로 넘김.
    String pimage = request.getParameter("b"); // E3_prod_list.jsp 로 부터 get방식으로 넘겨받은 b(pimage) 값. Dao로 넘기지 않음.
    
    String configFolder = config.getServletContext().getRealPath("/ABC/images");
 	// System.out.println(configFolder);
 	// C:\Users\Sunwoo\Desktop\JSP_PSW\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\17_Project\ABC\images
    
 	// 기존 이미지 파일을 실제 경로에서 삭제하는 방법
 	File delFile = null;
 	File dir = new File(configFolder); // 폴더가 저장된 경로를 인자값(configFolder)으로 넣어줌.
 	
 	delFile = new File(dir,pimage); // dir 경로와 pimage 파일명을 합쳐 파일화
 	delFile.delete(); // delFile 변수가 관리하는 폴더를 지우는 메소드 delete()%>
 	
 		<script type="text/javascript">
 			alert("해당 상품의 이미지 파일을 삭제하였습니다.")
 		</script><%
    
    ProDao dao = ProDao.getInstance();
    
    int cnt = dao.deletePro(pnum);
    
	String msg = "", url = "";
    if(cnt > 0) {
		msg = "해당 상품이 완전히 삭제되었습니다.";
		url = "E3_prod_list.jsp?keep=" + keep;
	} else {
		msg = "해당 상품의 삭제를 취소하였습니다.";
		url = "E3_prod_list.jsp?keep=" + keep;
	}
	%>
	
	<script>
		alert("<%=msg%>");
		location.href = "<%=url%>";
	</script>
	
	