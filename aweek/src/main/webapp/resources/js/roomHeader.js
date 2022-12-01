const toggleBtn = document.querySelector('.header__toggleBtn');
const menu = document.querySelector('.header__menu');
const hi = "hello";

toggleBtn.addEventListener('click', function() {
  menu.classList.toggle('active');
	console.log("hi");
	
})

console.log("hi");
console.log(hi);


const boo = window.location.href;
console.log(boo);

const i3 = document.querySelector('.i__3');
console.log(i3);

window.onload =  function() {
    if( window.location.href.indexOf("diary") > -1 ) {
      console.log("hello2");
      i3.classList.add("choose");
      console.log(hi);
   	}
};
