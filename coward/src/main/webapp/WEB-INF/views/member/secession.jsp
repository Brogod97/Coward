<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="${contextPath}/resources/styles/css//mypage-main-mem.css"
    />
    <link rel="stylesheet" href="${contextPath}/resources/styles/css/member-secession.css" />
    <title>Coward | 회원 탈퇴</title>
  </head>
  <body>
    <!-- 헤더 -->
    <header class="header">
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <div class="header-wrapper">
              <div class="header-left">
                <h1 class="logo">
                  <a href="#">
                    <img
                      src="${contextPath}/resources/assets/images/home_logo.svg"
                      alt="Coward"
                    />
                  </a>
                </h1>

                <button
                  class="header-button sm-only"
                  type="button"
                  aria-label="메뉴 버튼"
                >
                  <i class="ic-hamburger"></i>
                </button>
              </div>

              <div class="header-right sm-hidden">
                <!-- Note: 로그인을 하지 않은 경우 -->
                <div class="header-buttons">
                  <button
                    class="header-button md-only"
                    type="button"
                    aria-label="통합 검색 버튼"
                  >
                    <i class="ic-search"></i>
                  </button>
                  <button class="header-button-text" type="button">
                    <a href="${contextPath}/member/login">로그인</a>
                  </button>
                  <button class="header-button-text" type="button">
                    <a href="${contextPath}/member/join">회원가입</a>
                  </button>
                </div>
                <!-- Note: 로그인을 한 경우 -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>

    <nav class="nav">
      <h2 class="visually-hidden">메뉴</h2>
      <div class="container">
        <div class="row">
          <div class="col-sm-4">
            <div class="nav-wrapper">
              <div class="nav-left">
                <ul class="nav-list">
                  <li class="nav-item is-active">
                    <a href="#">공모전</a>
                  </li>
                  <li class="nav-item">
                    <a href="#">개발자 찾기</a>
                  </li>
                  <li class="nav-item">
                    <a href="#">가격 안내</a>
                  </li>
                </ul>
              </div>

              <div class="nav-right lg-only">
                <form class="nav-search" action="#">
                  <input
                    class="nav-search-input"
                    type="text"
                    placeholder="어떤 공모전을 찾으시나요?"
                  />
                  <i class="ic-search" aria-hidden></i>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </nav>
    <!-- 배너 -->
    <!-- web-box 중앙 배치 위해 -->
    <div class="full">
      <div class="banner-top sm-hidden">
        <img src="../assets/images/mypage-banner.png" />
      </div>

      <!-- 웹 페이지 -->
      <!-- 웹에서 헤더랑 푸터 사이 간격 주기 위해 사용 -->
      <div class="empty-box">
        <!-- 네비 + 내용을 감싸는 박스(모든 페이지 크기 고정)-->
        <div class="web-box">
          <!-- 네비게이션 바 -->

          <aside>
            <nav class="category">
              <div class="container">
                <div class="row">
                  <div class="col-sm-4 category-web">
                    <p class="profile-mypage lg-only">마이페이지</p>
                    <div class="profile lg-only">
                      <div class="profile-img avatar">
                        <img
                          src="${contextPath}/resources/assets/images/default-user-img.png"
                        />
                      </div>
                      <div class="profile-info">
                        <div class="profile-type">Back</div>
                        <p class="profile-nick">빡과장</p>
                      </div>
                    </div>

                    <ul class="category-bar">
                      <li><a href="#">내 정보</a></li>
                      <li><a href="#">공모전 관리</a></li>
                      <li><a href="#">크레딧 인출</a></li>
                      <li><a href="#">프로필 수정</a></li>
                      <li><a href="#">회원 탈퇴</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </nav>
          </aside>

          <!-- 본문 시작 -->
          <main class="profile-mem">
            <div class="container">
              <div class="row">
                <div class="col-sm-4">
                  <div class="profile-wrapper">
                    <!------------------------- 여기서 부터 작성 --------------------------->
                    <!-- 비밀번호 수정 - 현재 비밀번호 확인-->

                    <div class="title md-hidden">
                      <span class="secession">회원 탈퇴</span>
                      <hr class="line" />
                    </div>
                    <div class="secession-wrapper">
                      <div class="secession-box">
                      <form action="secession" method="POST" name="myPage-form" onsubmit="return secessionValidate()">
                      	<span class="pw-input-title">현재 비밀번호</span>
                        <div class="input-bundle">
                          <input
                            class="pw-input"
                            id="current-pw"
                            name="memberPw"
                            type="password"
                            placeholder="현재 비밀번호를 입력해주세요!"
                          />
                          <i class="ic-eye-close"></i>
                        </div>
                        <button class="next-btn" id="secessionBtn">다음</button>
                        </form>
                      </div>
                    </div>
                    <!-- 본문 끝 -->
                  </div>
                </div>
              </div>
            </div>
          </main>
        </div>
      </div>
    </div>
    <!-- 푸터 -->
    <footer class="footer">
      <div class="container">
        <div class="row">
          <div class="col-sm-4 col-md-2 col-lg-3">
            <h1 class="logo">
              <a href="#">
                <img
                  src="${contextPath}/resources/assets/images/home_logo.svg"
                  alt="Coward"
                />
              </a>
            </h1>
          </div>

          <div class="col-sm-4 col-md-5 col-lg-3">
            <div class="service-center">
              <a href="#">
                <h3>고객센터</h3>
                <i class="ic-chevron"></i>
              </a>
            </div>
            <div class="service-info">
              <div class="row">
                <div class="service-info-wrapper">
                  <div class="service-info-time">
                    <div class="service-info-title">상담시간</div>
                    <p>
                      평일 11:00 ~ 17:00 <br />
                      점심 12:30 ~ 13:30 <br />
                      (주말, 공휴일 제외)
                    </p>
                  </div>

                  <div class="service-info-tel">
                    <div class="service-info-title">연락처</div>
                    <a class="footer-tel" href="tel:02-1234-5678"
                      >02-1234-5678</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-4">
          <address class="footer-info sm-hidden">
            <p>서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F</p>
            <p>Copyright © 2023 Coawrd All Right Reserved</p>
          </address>
        </div>

        <div class="col-sm-4">
          <div class="footer-links">
            <div class="row">
              <div class="footer-links-wrapper">
                <div class="icon-link">
                  <a class="icon-link-item" href="#"
                    ><img
                      src="${contextPath}/resources/assets/images/github.png"
                      alt="Github 바로가기"
                  /></a>
                  <a class="icon-link-item" href="#">
                    <img
                      src="${contextPath}/resources/assets/images/notion.png"
                      alt="Notion 바로가기"
                    />
                  </a>
                  <a class="icon-link-item" href="#"
                    ><img
                      src="${contextPath}/resources/assets/images/figma.png"
                      alt="Figma 바로가기"
                  /></a>
                </div>

                <div class="text-link">
                  <ul class="text-link-list">
                    <li class="text-link-item"><a href="#">이용가이드</a></li>
                    <li class="text-link-item">
                      <a href="#">개인정보처리방침</a>
                    </li>
                    <li class="text-link-item"><a href="#">이용약관</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <address class="footer-info sm-only">
          <p>서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F</p>
          <p>Copyright © 2023 Coawrd All Right Reserved</p>
        </address>
      </div>
    </footer>
    <!-- tiny-slider -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tiny-slider/2.9.2/min/tiny-slider.js"></script>
    <script src="${contextPath}/resources/js/mypage-slider.js"></script>
    <script src="${contextPath}/resources/js/secession.js"></script>
  </body>
</html>
