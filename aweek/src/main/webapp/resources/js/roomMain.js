/**
 * 
 */
const toggleBtn = document.querySelector('.header__toggleBtn');
const menu = document.querySelector('.header__menu');

toggleBtn.addEventListener('click', () => {
  menu.classList.toggle('active');
})