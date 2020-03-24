<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test='${!rol.equals("admin")}'>
    <% response.sendRedirect("index.jsp");%>
</c:if>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="/WEB-INF/components/head.jsp" />
        <title>SAGPT - Detalle del Producto</title>
    </head>
    <body>
        <jsp:include page="/WEB-INF/components/header.jsp" />

        <div class="jumbotron mb-0">
            <main class="container">
                <h2 class="display-4 text-center">Inserción de productos</h2>
            </main>

        </div>

        <jsp:include page="/WEB-INF/components/footer.jsp" />
    </body>
</html>