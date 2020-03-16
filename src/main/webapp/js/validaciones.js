let c = console.log,
    d = document,
    errorLogin = d.getElementById("error-login"),
    formLogin = d.getElementById("formLogin"),
    btnLogin = d.getElementById("btnLogin");
    
if(btnLogin != null && formLogin != null) {
    btnLogin.addEventListener('click', e => {
        
//        let username = d.getElementById("username").value;
//        let password = d.getElementById("password").value;
//        
//        // Validar los campos
//        
//        if(username == " " || !isNaN(username)) {
//            alert("Por favor, ingresa un nombre válido.");
//        } else {
//            formLogin.submit();
//        }
        
        formLogin.submit();
    })
}
        
if(errorLogin != null) {
    if(errorLogin.textContent == "login") {
        alert("El usuario o la contraseña no son correctos");
    }
} 