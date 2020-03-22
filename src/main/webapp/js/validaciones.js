let c = console.log,
    d = document,
    errorLogin = d.getElementById("error-login"),
    dateAuthor = d.getElementById("date-author"),
//    modelo = d.getElementById("modelo"),
//    marca = d.getElementById("marca"),
    descripcion = d.getElementById("descripcion");
    
if(errorLogin !== null) {
    alert(errorLogin.textContent);
}

if(dateAuthor !== null) {
    dateAuthor.textContent = new Date ().getFullYear();
}

//if (descripcion !== null ) {
//    descripcion.addEventListener('click', () => {
//        modelo.select();
//    });
//}
