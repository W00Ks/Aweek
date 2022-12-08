const toggleBtn = document.querySelector('.header__toggleBtn');
const menu = document.querySelector('.header__menu');
const hi = "hello";

toggleBtn.addEventListener('click', function() {
  menu.classList.toggle('active');
})

const i1 = document.querySelector('.i__1');
const i2 = document.querySelector('.i__2');
const i3 = document.querySelector('.i__3');
const i4 = document.querySelector('.i__4');

window.onload =  function() {
   	if( window.location.href.indexOf("chat") > -1 ) {
    i1.classList.add("choose");
   	}
};

window.onload =  function() {
   	if( window.location.href.indexOf("calender") > -1 ) {
    i2.classList.add("choose");
   	}
};

window.onload =  function() {
   	if( window.location.href.indexOf("diary") > -1 ) {
    i3.classList.add("choose");
   	}
};

window.onload =  function() {
   	if( window.location.href.indexOf("room") > -1 ) {
    i4.classList.add("choose");
   	}
};

