const signInBtnLink = document.querySelector('.signInBtn-link');
const signUpBtnLink = document.querySelector('.signUpBtn-link');
const wrapper = document.querySelector('.wrapper');
signUpBtnLink.addEventListener('click', () => {
    wrapper.classList.toggle('active');
});
signInBtnLink.addEventListener('click', () => {
    wrapper.classList.toggle('active');
});
function change(){
	if(document.querySelector("#pass").type=="password"){
		document.querySelector("#pass").type="text";
	}else{
		document.querySelector("#pass").type="password";
	}
}