let c = console.log,
        d = document,
        errorLogin = d.getElementById("error-login"),
        dateAuthor = d.getElementById("date-author"),
        divProductos = d.getElementById("productos"),
        producto1 = d.getElementById("producto1"),
        btnAdd = d.getElementById("btnAdd"),
        btnDelete = d.getElementById("btnDelete");

if (btnAdd !== null) {
    btnAdd.addEventListener('click', () => {
        let numero = d.getElementsByClassName("producto").length + 1;        
        if (producto1 !== null && divProductos !== null) {
            if(numero == 2) btnDelete.classList.remove('d-none');
            let producto = producto1.cloneNode(true);
            producto.id = `producto${numero}`;
            
            let modelo = producto.querySelector('#modelo1');
            modelo.id = `modelo${numero}`;
            modelo.name = `modelo${numero}`;
            
            let cantidad = producto.querySelector('#cantidad1');
            cantidad.id = `cantidad${numero}`;
            cantidad.name = `cantidad${numero}`;
           
            divProductos.appendChild(producto);
        }
    });
}

if (btnDelete !== null) {
    btnDelete.addEventListener('click', () => {
        let numero = d.getElementsByClassName("producto").length;        
        if(numero > 1) {
            if(numero == 2) btnDelete.classList.add('d-none');
            let productoActual = d.getElementById(`producto${numero}`);
            if(productoActual !== null) {
                productoActual.remove();
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

