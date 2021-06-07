<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="sb" class="project.ShopBean" scope="session"/>

    <%
    String keep = request.getParameter("keep");
    String pnum = request.getParameter("pnum");
    sb.deleteShop(pnum);
    response.sendRedirect("B4_display_cartlist.jsp?keep=" + keep);
    %>