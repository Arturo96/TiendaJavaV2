let c = console.log,
        d = document,
        errorLogin = d.getElementById("error-login"),
        dateAuthor = d.getElementById("date-author"),
        divCantidades = d.getElementById("cantidades"),
        cantidad1 = d.getElementById("cantidad1"),
        btnAdd = d.getElementById("btnAdd"),
        btnDelete = d.getElementById("btnDelete");

if (btnAdd !== null) {
    btnAdd.addEventListener('click', () => {
        let numero = d.getElementsByClassName("cantidad").length + 1;        
        if (cantidad1 !== null && divCantidades !== null) {
            if(numero == 2) btnDelete.classList.remove('d-none');
            let cantidad = cantidad1.cloneNode(true);
            cantidad.id = `cantidad${numero}`;
            cantidad.children[1].name = `cantidad${numero}`;
          //  c(cantidad);
            divCantidades.appendChild(cantidad);
        }
    });
}

if (btnDelete !== null) {
    btnDelete.addEventListener('click', () => {
        let numero = d.getElementsByClassName("cantidad").length;        
        if(numero > 1) {
            if(numero == 2) btnDelete.classList.add('d-none');
            let cantidadActual = d.getElementById(`cantidad${numero}`);
            if(cantidadActual !== null) {
                cantidadActual.remove();
            }
            
        }
    });
}

if (errorLogin !== null) {
    alert(errorLogin.textContent);
}

if (dateAuthor !== null) {
    dateAuthor.textContent = new Date().getFullYear();
}

