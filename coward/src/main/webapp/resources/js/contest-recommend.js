// 맞춤 선택 STEP
var step1 = document.getElementById("recommend-step-1");
var step2 = document.getElementById("recommend-step-2");
var step3 = document.getElementById("recommend-step-3");
var step4 = document.getElementById("recommend-step-4");

// 이전, 다음 버튼
var nextBtn1 = document.getElementById("next1");
var nextBtn2 = document.getElementById("next2");
var nextBtn3 = document.getElementById("next3");
var backBtn1 = document.getElementById("back1");
var backBtn2 = document.getElementById("back2");
var backBtn3 = document.getElementById("back3");

// dev_Type 카드
var typeNo = document.getElementById("typeNo");
var mobile = document.getElementById("mobileCard");
var web = document.getElementById("webCard");
var game = document.getElementById("gameCard");
var security = document.getElementById("securityCard");

// 기능 수행

// 버튼 기능
function next1() {
  step1.style.display = "none";
  step2.style.display = "block";
  nextBtn1.style.display = "none";
  nextBtn2.style.display = "block";
  backBtn2.style.display = "block";
}

function next2() {
  step2.style.display = "none";
  step3.style.display = "block";
  nextBtn2.style.display = "none";
  nextBtn3.style.display = "block";
  backBtn2.style.display = "none";
  backBtn3.style.display = "block";
}

function back2() {
  step1.style.display = "block";
  step2.style.display = "none";
  nextBtn1.style.display = "block";
  nextBtn2.style.display = "none";
  backBtn2.style.display = "none";
}

function back3() {
  step2.style.display = "block";
  step3.style.display = "none";
  nextBtn2.style.display = "block";
  nextBtn3.style.display = "none";
  backBtn2.style.display = "block";
  backBtn3.style.display = "none";
}

// dev_Type 카드 function

function mobileClick() {
  typeNo.value = 1;
  console.log("Mobile Clicked"); // 로그 메시지 추가
  console.log(typeNo.value);
}

function webClick() {
  typeNo.value = 2;
  console.log("Web Clicked"); // 로그 메시지 추가
}

function gameClick() {
  typeNo.value = 3;
  console.log("Game Clicked"); // 로그 메시지 추가
}

function securityClick() {
  typeNo.value = 4;
  console.log("Security Clicked"); // 로그 메시지 추가
}

// 프로그래밍 언어 또는 프레임워크 선택하는 박스 fuction

function javaClick() {
  skill.value = "Java";
  console.log("Java Clicked");
}
function springClick() {
  skill.value = "SPRING";
}
function springBootClick() {
  skill.value = "springBoot";
}
function phpClick() {
  skill.value = "PHP";
}
function oracleClick() {
  skill.value = "Oracle";
}
function mySqlClick() {
  skill.value = "MySQL";
}
function pythonClick() {
  skill.value = "Python";
}
function kotlinClick() {
  skill.value = "Kotrlin";
}
function swiftClick() {
  skill.value = "Swift";
}
function cPlusClick() {
  skill.value = "C++";
}
function cSharplick() {
  skill.value = "C#";
}
function htmlClick() {
  skill.value = "HTML";
}
function cssClick() {
  skill.value = "CSS";
}
function javaScriptClick() {
  skill.value = "JavaScript";
}
function jQueryClick() {
  skill.value = "jQuery";
}

function vueClick() {
  skill.value = "Vue.js";
}
function reactClick() {
  skill.value = "React";
}
function nodeClick() {
  skill.value = "Node.js";
}

// 상금 값 input 창에 넣기

var slider = document.getElementById("recommend-reward-slide");
var priceSpan = document.getElementById("priceSpan");
var price = document.getElementById("price");
priceSpan.innerHTML = slider.value;

slider.oninput = function () {
  priceSpan.innerHTML = this.value;
  price.value = priceSpan.innerHTML;

  console.log(price.value);
};

// 맞춤 콘테스트 정보 조회(AJAX)
nextBtn3.addEventListener("click", function () {
  const typeNo = document.getElementById("typeNo");
  const div = document.getElementById("result1");

  $.ajax({
    url: "recommend",
    data: { typeNo: typeNo.value },
    type: "POST",
    dataType: "json",

    success: function (response) {
      const recommendList = response; // 이미 JavaScript 객체로 해석된 상태

      div.innerHTML = "";

      if (recommendList.length > 0) {
        for (let i = 0; i < recommendList.length; i++) {
          const contest = recommendList[i];

          const divContest = document.createElement("div");
          divContest.className = "contest-slider-card";

          const divImg = document.createElement("div");
          divImg.className = "contest-slider-card-img";
          const img = document.createElement("img");
          img.src = contest.thumbnail;
          divImg.appendChild(img);

          const divInfo = document.createElement("div");
          divInfo.className = "contest-slider-card-info";

          const divTitle = document.createElement("div");
          divTitle.className = "contest-slider-card-info-title";
          const pTitle = document.createElement("p");
          pTitle.innerText = "콘테스트 제목: " + contest.contestTitle;
          divTitle.appendChild(pTitle);

          const divDetail1 = document.createElement("div");
          divDetail1.className = "contest-slider-card-info-detail";
          const pDetail1_1 = document.createElement("p");
          pDetail1_1.innerText = "상금";
          const pDetail1_2 = document.createElement("p");
          pDetail1_2.innerText = contest.price + "만원";
          divDetail1.appendChild(pDetail1_1);
          divDetail1.appendChild(pDetail1_2);

          const divDetail2 = document.createElement("div");
          divDetail2.className = "contest-slider-card-info-detail";
          const pDetail2_1 = document.createElement("p");
          pDetail2_1.innerText = "남은기간";
          const pDetail2_2 = document.createElement("p");
          pDetail2_2.innerText = contest.remainingDays + "일";
          divDetail2.appendChild(pDetail2_1);
          divDetail2.appendChild(pDetail2_2);

          const divButton = document.createElement("div");
          divButton.className = "contest-slider-card-info-button";
          const button = document.createElement("button");
          button.className = "btn-outlined btn-32";
          button.innerText = "참여하러가기";
          divButton.appendChild(button);

          divInfo.appendChild(divTitle);
          divInfo.appendChild(divDetail1);
          divInfo.appendChild(divDetail2);
          divInfo.appendChild(divButton);

          divContest.appendChild(divImg);
          divContest.appendChild(divInfo);

          div.appendChild(divContest);
        }
      } else {
        const h4 = document.createElement("h4");
        h4.innerText = "일치하는 콘테스트가 없습니다";

        div.append(h4);
      }
    },
    error: function (request, status, error) {
      console.log("AJAX 에러 발생");
      console.log("상태코드 : " + request.status); // 404, 500
    },
  });
});
