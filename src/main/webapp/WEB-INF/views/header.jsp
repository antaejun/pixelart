<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<header id="header">
	<div class="logo">
		Logo
	</div>
	<div class="userId">
		<c:if test="${sessionScope.SNAME != null }">
		<div class="name">
			<span class="username">${sessionScope.SNAME} </span>님 환영합니다
		</div>
		</c:if>
		<c:if test="${sessionScope.SNAME == null }">
		<div class="name">
			<span class="username">guest</span>님 환영합니다
		</div>
		</c:if>
		<div class="logout">
			<a href="logout.jsp">로그아웃</a>
		</div>
	</div>
	<label id="lnb_btn" for="lnb_chk">메뉴</label>
	<!--.user-->
</header>
<!--#header-->