const toggleBtn = document.querySelector('.header__toggleBtn');
const menu = document.querySelector('.header__menu');
const hi = "hello";

toggleBtn.addEventListener('click', function() {
  menu.classList.toggle('active');
})

const i3 = document.querySelector('.i__3');

window.onload =  function() {
    if( window.location.href.indexOf("diary") > -1 ) {
      i3.classList.add("choose");
   	}
};
