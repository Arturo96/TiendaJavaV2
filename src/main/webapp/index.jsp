<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="./WEB-INF/components/head.jsp" />
        <title>Proyecto SAGPT</title>
    </head>
    <body>
        <jsp:include page="./WEB-INF/components/header.jsp" />
        
        <div class="jumbotron mb-0">
            <main class="container">
                <h1 class="display-4 text-center">Bienvenido a SAGPT!!</h1>
                <p class="description">
                    SAGPT permite facilitarle tanto al comprador del producto, como
                    el administrador de la tienda tecnológica, la gestión de las
                    garantías de los productos tecnológicos adquiridos o vendidos,
                    donde al momento de que el comprador adquiera un producto, 
                    el administrador pueda almacenar en la aplicación web la 
                    información del comprador y la información del producto que
                    el comprador adquirió con su garantía asociada. Además, se 
                    le envía al correo de dicho comprador una factura virtual 
                    con todos los detalles del producto adquirido y toda la 
                    información de su garantía, y poder consultarla también aquí. 
                </p>
            </main>
            
        </div>
        
        <jsp:include page="./WEB-INF/components/footer.jsp" />
    </body>
</html>