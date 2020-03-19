<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test='${!rol.equals("admin")}'>
    <% response.sendRedirect("index.jsp");%>
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/WEB-INF/components/head.jsp" />
        <title>SAGPT - Agregar Producto</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/components/header.jsp" />

        <div class="jumbotron mb-0">
            <main class="container">
                <h2 class="display-4 text-center">Inserción de productos</h2>

                <form action="${pageContext.request.contextPath}/ServletProductos"
                      class="frmAddProduct mx-auto" method="POST">

                    <!-- Tipo de Producto -->
                    <div class="form-group">
                        <label for="tipoProducto">Tipo de Producto: </label>
                        <select class="form-control" name="tipoProducto" id="tipoProducto">
                            <c:forEach var="categoria" items="${categorias}">
                                <option value="${categoria.id}">${categoria.nombre}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <!-- Modelo -->
                    <div class="form-group">
                        <label for="modelo">Modelo: </label>
                        <input id="modelo" name="modelo" class="form-control" type="text">
                    </div>

                    <!-- Imagen -->
                    <div class="form-group">
                        <label for="imagen">Imagen: </label>
                        <input id="imagen" name="imagen" class="mb-2 form-control" type="file">
                    </div>

                    <!-- Marca -->
                    <div class="form-group">
                        <label for="marca">Marca: </label>
                        <input id="marca" name="marca" class="form-control" type="text">
                    </div>

                    <!-- Descripción -->
                    <div class="form-group">
                        <label for="descripcion">Descripción: </label>
                        <textarea class="form-control" rows="5" id="descripcion" 
                                  name="descripcion"></textarea>
                    </div>

                    <!-- Precio -->
                    <div class="form-group">
                        <label for="precio">Precio: </label>
                        <input id="precio" name="precio" class="form-control" type="text">
                    </div>

                    <!-- Cantidad en Inventario -->
                    <div class="form-group">
                        <label for="cantidadInv">Cantidad en Inventario: </label>
                        <input id="cantidadInv" name="cantidadInv" class="form-control" type="text">
                    </div>

                    <!-- Tiempo de Garantia (Meses) -->
                    <div class="form-group">
                        <label for="mesesGarantia">Tiempo de Garantia (Meses): </label>
                        <input id="mesesGarantia" name="mesesGarantia" class="form-control" type="text">
                    </div>

                    <c:if test="${! empty errores}">
                        <div class="errores">
                            <c:forEach var="error" items="${errores}">
                                <p>${error}</p>
                            </c:forEach>
                        </div>
                    </c:if>

                    <% session.setAttribute("errores", null); %>

                    <button type="submit" name="add" class="btn btn-primary w-75 d-block mt-4 mx-auto" >Ingresar producto</button>
                </form>

            </main>

        </div>

        <jsp:include page="/WEB-INF/components/footer.jsp" />
    </body>
</html>