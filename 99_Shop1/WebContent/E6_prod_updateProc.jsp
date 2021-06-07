<%@page import="project.ProDao"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
	String configFolder = config.getServletContext().getRealPath("/ABC/images");
	// C:\Users\Sunwoo\Desktop\JSP_PSW\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\17_Project\ABC\images
	String requestFolder = request.getContextPath() + "/ABC/images";
	// /17_Project/ABC/images
	MultipartRequest mr = new MultipartRequest(request,
											   configFolder,
											   1024 * 1024 * 10,
											   "UTF-8",
											   new DefaultFileRenamePolicy());
	String keep = mr.getParameter("keep");
	String pnum = mr.getParameter("pnum");
	String pimage = mr.getOriginalFileName("pimage"); // 새이미지(File) // System.out.println("pimage : " + pimage);
	String pimage2 = mr.getParameter("pimage2"); // 이전이미지(Text). configFolder 경로에서 삭제 요망. // System.out.println("pimage2 : " + pimage2);
	
	// mr.getOriginalFileName() : 파일 원래 이름 받을 때 사용(새로 업데이트할 파일 받을 때 사용)					-- 파일을 넘겨받음
	// mr.getParameter() : 문자열 받을 때 사용, 기존/이전파일 이름만 받을 때 사용								-- 문자열을 넘겨받음
	// mr.getFilesystemName() : 중복된게 입력됬을때 바꿔서 업로드된 이름. 출력은 되지만, 원래의 파일이 아닐 가능성이 있다.-- 파일을 넘겨받음(출력은 되지만 원래 파일이 아닐 수 있다)
	
	// 기존 이미지 파일을 실제 경로에서 삭제하는 방법
	File delFile = null;
	File dir = new File(configFolder); // 폴더가 저장된 경로를 인자값(configFolder)으로 넣어줌.
	
	if(pimage != null) { // 새:O (새 이미지가 선택된 경우)
		if(pimage2 != null) { // 새:O 이전:O (기존,새 이미지 둘 다 있는 경우)
			delFile = new File(dir,pimage2); // dir 경로와 pimage2 파일명을 합쳐 파일화
			delFile.delete(); // delFile 변수가 관리하는 폴더를 지우는 메소드 delete()%>
			<script type="text/javascript">
				alert("이전의 이미지 파일을 삭제하였습니다.")
			</script>
	<%	} else { // 이전:X 새:O (이전 이미지는 없지만 새 이미지가 있는 경우)
			
		}
	}

	ProDao pdao = ProDao.getInstance();
	int cnt = pdao.updatePro(mr); // 수정폼의 모든 값 = mr
	String msg = "", url = "";
	if(cnt > 0) {
		msg = "상품 수정에 성공";
		url = "E3_prod_list.jsp?keep=" + keep;
	} else {
		msg = "상품 수정에 실패";
		url = "E5_prod_update.jsp?a=" + pnum + "&keep=" + keep;
	}
	%>
	
	<script>
		alert("<%=msg%>" + "했습니다.");
		location.href = "<%=url%>";
	</script>
	
	