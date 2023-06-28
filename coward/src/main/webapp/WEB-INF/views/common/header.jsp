<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<header class="header">
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div class="header-wrapper">
          <div class="header-left">
            <h1 class="logo">
              <a href="${contextPath}">
                <img
                  src="${contextPath}/resources/assets/images/home_logo.svg"
                  alt="Coward"
                />
              </a>
            </h1>

            <button
              id="menubar-btn"
              class="header-button sm-only"
              type="button"
              aria-label="메뉴 버튼"
            >
              <i class="ic-hamburger"></i>
            </button>
          </div>

          <div class="header-right sm-hidden">
            <c:choose>
              <c:when test="${ empty sessionScope.loginMember }">
                <button class="header-button-text" type="button">
                  <a href="${contextPath}/member/testLogin">로그인</a>
                </button>
                <button class="header-button-text" type="button">
                  <a href="#">회원가입</a>
                </button>
              </c:when>
              <c:otherwise>
                <button class="header-user-image">
                  <i class="ic-bell"></i>
                </button>
                <a class="header-user-image" href="#">
                  <i class="ic-message"></i>
                </a>
                <a href="${contextPath}/WEB-INF/views/mypage/person-main.jsp">
                  <div class="avatar-24 header-user-image">
                    <c:choose>
                      <c:when test="${empty loginMember.profileImg }">
                        <img
                          src="${contextPath}/resources/assets/images/default-user-img.png"
                          alt="변경 프로필 사진"
                          id="profile-image"
                        />
                      </c:when>
                      <c:otherwise>
                        <img
                          src="${contextPath}/${loginMember.profileImg}"
                          alt="변경 프로필 사진"
                          id="profile-image"
                        />
                      </c:otherwise>
                    </c:choose>
                  </div>
                </a>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>
