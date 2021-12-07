const modal = document.querySelector('.js-modal');
const modalLogin = document.querySelector('.js-login');
const modalClose = document.querySelector('.js-modal-close');
const modalContainer = document.querySelector('.js-modal-container');
const modalLoginBtn = document.querySelector('.js-login-modal');

// hàm hiển thị phần đăng nhập
function showBuyLogin() {
    modal.classList.add('open')
}
// hàm ẩn modal đăng nhập
function hideBuyLogin() {
    modal.classList.remove('open')
}
modalLogin.addEventListener('click', showBuyLogin)

modalClose.addEventListener('click', hideBuyLogin)
    //
modal.addEventListener('click', hideBuyLogin)
    //
modalContainer.addEventListener('click', function(even) {
    even.stopPropagation()
})

const register = document.querySelector('.js_register')
const modalRegister = document.querySelector('.js-modal-register');
const modalCloseRegister = document.querySelector('.js-modal-close-register');
const modalContainerRegister = document.querySelector('.js-modal-container-register');
const modalRegisterBtn = document.querySelector('.js-register-modal')

// hiện thị phần đăng ký
function showModalRegister() {
    modalRegister.classList.add('open')
}

// hàm ẩn modal đăng kí
function hideModalRegister() {
    modalRegister.classList.remove('open')
}

register.addEventListener('click', showModalRegister)
    // modalRegisterBtn.addEventListener('click', showModalRegister)
modalCloseRegister.addEventListener('click', hideModalRegister)
modalRegister.addEventListener('click', hideModalRegister)

modalRegisterBtn.addEventListener('click', showModalRegister)
modalRegisterBtn.addEventListener('click', hideBuyLogin)
modalLoginBtn.addEventListener('click', showBuyLogin)
modalLoginBtn.addEventListener('click', hideModalRegister)


modalContainerRegister.addEventListener('click', function(even) {
    even.stopPropagation()
})

function incrementValue()
{
    var value = parseInt(document.getElementById('number').value, 10);
    value = isNaN(value) ? 1 : value;
    value++;
    document.getElementById('number').value = value;
}
function reduceValue()
{
    var value = parseInt(document.getElementById('number').value, 10);
    value = (isNaN(value)) ? 1 : value;
    value--;
    if(value<1){
        value=1;
    }
    document.getElementById('number').value = value;
}