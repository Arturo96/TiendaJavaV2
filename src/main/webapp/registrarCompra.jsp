<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test='${!rol.equals("admin") && !rol.equals("vendedor")}'>
    <% response.sendRedirect("index.jsp");%>
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/WEB-INF/components/head.jsp" />
        <title>SAGPT - Registrar Compra</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/components/header.jsp" />

        <div class="jumbotron mb-0">
            <main class="container">
                <h2 class="display-4 text-center">Registro de compras</h2>

                <form action="${pageContext.request.contextPath}/ServletCompras"
                      class="frmAddProduct mx-auto was-validated" method="POST" >

                    <!-- Tipo de Producto 
                    <div class="form-group">
                        <label for="tipoProducto">Tipo de Producto: </label>
                        <select class="form-control" name="tipoProducto" id="tipoProducto">
                    <c:forEach var="categoria" items="${categorias}">
                        <option value="${categoria.id}">${categoria.nombre}</option>
                    </c:forEach>
                </select>
            </div> -->



                    <!-- Producto -->
                    <section id="productos">
                        <div id="producto1" class="producto">
                            <!-- Modelo -->
                            <div class="form-group">
                                <label>Producto: </label>
                                <select class="form-control" name="modelo1" id="modelo1">
                                    <c:forEach var="producto" items="${productos}">
                                        <option value="${producto.id}">${producto.modelo}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!-- Cantidad a comprar -->
                            <div class="form-group">
                                <label>Cantidad en Inventario: </label>
                                <input name="cantidad1" id="cantidad1" class="form-control" min="1" type="number" required>
                            </div>  
                        </div>
                        
                        
                    </section>

                    <button type="button" id="btnAdd" class="btn btn-info">Agregar producto</button>
                    <button type="button" id="btnDelete" class="btn btn-danger d-none">Eliminar producto</button>

                    <!-- Marca 
                    <div class="form-group">
                        <label for="marca">Marca: </label>
                        <input id="marca" name="marca" class="form-control" type="text" required>
                    </div> -->


                    <!-- Precio 
                    <div class="form-group">
                        <label for="precio">Precio: </label>
                        <input id="precio" name="precio" class="form-control" min="100" type="number" required>
                    </div> -->





                    <c:if test="${! empty errores}">
                        <div class="errores">
                            <c:forEach var="error" items="${errores}">
                                <p>${error}</p>
                            </c:forEach>
                        </div>
                    </c:if>

                    <% session.setAttribute("errores", null);%>

                    <button type="submit" name="add" class="btn btn-primary w-75 d-block mt-4 mx-auto" >Ingresar producto</button>
                </form>

            </main>

        </div>

        <jsp:include page="/WEB-INF/components/footer.jsp" />
    </body>
</html>