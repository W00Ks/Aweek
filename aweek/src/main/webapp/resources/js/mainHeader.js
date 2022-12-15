
/**
 * 검색창 제어
 */
// 검색창 요소(.search) 찾기.
const searchEl = document.querySelector('.nav__search')
const searchInputEl = searchEl.querySelector('input')

// 검색창 요소를 클릭하면 실행.
searchEl.addEventListener('click', function () {
  searchInputEl.focus()
})

// 검색창 요소 내부 실제 input 요소에 포커스되면 실행.
searchInputEl.addEventListener('focus', function () {
  searchEl.classList.add('focused')
  searchInputEl.setAttribute('placeholder', '검색어를 입력하세요')
})

// 검색창 요소 내부 실제 input 요소에서 포커스가 해제(블러)되면 실행.
searchInputEl.addEventListener('blur', function () {
  searchEl.classList.remove('focused')
  searchInputEl.setAttribute('placeholder', '')
})


const toggleBtn = document.querySelector('.nav__toggleBtn');
const menu = document.querySelector('.nav__menu');

toggleBtn.addEventListener('click', function() {
  menu.classList.toggle('active');
})


/**
 * 로그인
 */
 Kakao.init('83db0909626a39e8a1cdaf664b67a04d'); //발급받은 키 중 javascript키를 사용해준다.
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
           console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
}


$(document).ready(function() {

   $("#btnLogout").click(function() {
      kakaoLogout();
      $.ajax({
         type:"post"
         , url: "/member/logout"
         , data: {
         }
      , dataType: "html"
      , success: function( res ) {
         swal("로그아웃 완료!","다음에 또 만나요~", "success").then(function(){
            window.location.href="/aweekHome";            
         })
      }
      });
   })

})
