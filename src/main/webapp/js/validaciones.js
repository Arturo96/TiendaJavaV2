let c = console.log,
    d = document,
    errorLogin = d.getElementById("error-login"),
    dateAuthor = d.getElementById("date-author");
    
if(errorLogin != null) {
    alert(errorLogin.textContent);
}

if(dateAuthor !== null) {
    dateAuthor.textContent = new Date ().getFullYear();
}
