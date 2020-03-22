<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="./WEB-INF/components/head.jsp" />
        <title>SAGPT - Productos</title>
    </head>
    <body>
        <jsp:include page="./WEB-INF/components/header.jsp" />

        <div class="jumbotron mb-0">
            <main class="container">
                <section class="productos">
                    <h2 class="display-4 text-center">Nuestros productos</h2>

                    <!-- Listado de Productos de la BD -->
                    <c:forEach var="producto" items="${productos}">
                        <article class="product row">
                            <div class="product-img col-md-3">
                                <img class="img-fluid" src="${pageContext.request.contextPath}/ServletImagenes?id=${producto.id}" >
                            </div>
                            <div class="product-content col-md-9">
                                <h3 class="product-title"><a href="#">${producto.marca} ${producto.modelo}</a></h3>
                                <div class="product-description">
                                    <p class="product-p">Especificaciones: ${producto.descripcion}</p>
                                </div>
                                <p class="product-price">${producto.precio} COP</p>
                                <div class="product-inventory">Quedan ${producto.cantidadInv} unidades disponibles!</div>
                                <button class="btn btn-info mt-4">Ver más</button>
                            </div>
                        </article>

                    </c:forEach>
                    
                </section>

            </main>

        </div>

        <jsp:include page="./WEB-INF/components/footer.jsp" />
    </body>
</html>