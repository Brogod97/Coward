<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      href="${contextPath}/resources/styles/css/mypage-main-mem.css"
    />

    <link
      rel="stylesheet"
      href="${contextPath}/resources/styles/css/mypage-company-main.css"
    />

    <link
      rel="stylesheet"
      href="${contextPath}/resources/styles/css/slider.css"
    />

    <title>Coward | 마이페이지</title>
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <jsp:include page="/WEB-INF/views/common/nav.jsp" />

    <!-- 배너 -->
    <!-- web-box 중앙 배치 위해 -->
    <div class="full">
      <div class="banner-top sm-hidden">
        <img src="${contextPath}/resources/assets/images/mypage-banner.png" />
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
                      <div class="profile-img-box">
                        <div class="profile-img avatar">
                          <img src="${contextPath}/${loginMember.profileImg}" />
                        </div>
                      </div>

                      <div class="profile-info">
                        <!-- <div class="profile-type">Back</div>-->
                        <p class="profile-nick">${loginMember.memberNick}</p>
                      </div>
                    </div>

                    <ul class="category-bar">
                      <li>
                        <a href="${contextPath}/mypage/companyMain">내 정보</a>
                      </li>
                      <li>
                        <a href="${contextPath}/mypage/companyManagement"
                          >공모전 관리</a
                        >
                      </li>

                      <li>
                        <a href="${contextPath}/mypage/companyProfile"
                          >프로필 수정</a
                        >
                      </li>
                      <li>
                        <a href="${contextPath}/member/changePw"
                          >비밀번호 변경</a
                        >
                      </li>
                      <li>
                        <a href="${contextPath}/member/secession">회원 탈퇴</a>
                      </li>
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

                    <div class="mypage">
                      <div class="title-wrapper lg-only">
                        <p class="title">내 정보</p>
                      </div>
                      <div class="mypage-img-wrapper lg-hidden">
                        <div class="avatar">
                          <img
                            src="${contextPath}/resources/assets/images/default-user-img.png"
                          />
                        </div>
                      </div>

                      <div class="mypage-input-box-wrapper">
                        <div class="mypage-input-box">
                          <p>소개</p>
                          <div class="mypage-introduce col-lg-4">
                            ${loginMember.introduce}
                          </div>
                        </div>
                        <div class="mypage-input-box">
                          <p>관심있는 개발자</p>

                          <div class="mypage-developer-card-scroll">
                            <c:forEach
                              var="member"
                              items="${developerLikeList}"
                            >
                              <div class="mypage-developer-card">
                                <div class="card-content">
                                  <div class="avatar-32">
                                    <img
                                      src="${contextPath}/${member.profileImg}"
                                    />
                                  </div>
                                  <div class="nick-name-wrapper">
                                    <p class="nick-name">
                                      ${member.memberNick}
                                    </p>
                                    <div class="user-type">${member.stack}</div>
                                    <div class="one-line-intro">
                                      <p>${member.slogan}</p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </c:forEach>
                          </div>
                        </div>
                      </div>

                      <p>내가 개최한 공모전</p>
                      <div class="btn-wrapper-status">
                        <input
                          type="hidden"
                          id="conStatus"
                          name="conStatus"
                          value=""
                        />
                        <button
                          class="btn-32 btn-secondary filterBtn"
                          id="all"
                          data-parameter="전체"
                        >
                          전체
                        </button>
                        <button
                          class="btn-32 btn-secondary filterBtn"
                          id="recruiting"
                          data-parameter="모집중"
                        >
                          모집중
                        </button>
                        <button
                          class="btn-32 btn-secondary filterBtn"
                          id="casting"
                          data-parameter="심사중"
                        >
                          심사중
                        </button>
                        <button
                          class="btn-32 btn-secondary filterBtn"
                          id="end"
                          data-parameter="완료"
                        >
                          완료
                        </button>
                      </div>
                    </div>

                    <div class="row">
                      <div class="scroll" id="contest-slider">
                        <c:forEach var="contest" items="${contestList}">
                          <div class="col-sm-4 col-md-4">
                            <a
                              href="${contextPath}/mypage/winnerSelect/${contest.contestNo}"
                            >
                              <div class="contest-slider-card">
                                <div class="contest-slider-card-img">
                                  <img
                                    src="${contextPath}/${contest.thumbnail}"
                                    alt=""
                                  />
                                </div>
                                <div class="contest-slider-card-info">
                                  <div class="contest-slider-card-info-title">
                                    <p>${contest.contestTitle}</p>
                                  </div>
                                  <div class="contest-slider-card-info-detail">
                                    <p>상금</p>
                                    <p>${contest.dueDate}일 남음</p>
                                  </div>
                                  <div class="contest-slider-card-info-detail">
                                    <p>남은기간</p>
                                    <p>${contest.dueDate}일</p>
                                  </div>
                                </div>
                              </div>
                            </a>
                          </div>
                        </c:forEach>
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
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- tiny-slider -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
      const contextPath = "${contextPath}";
    </script>

    <script src="${contextPath}/resources/js/mypage-company-main.js"></script>
  </body>
</html>
