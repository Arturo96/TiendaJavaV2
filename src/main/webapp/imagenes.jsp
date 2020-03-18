<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="./WEB-INF/components/head.jsp" />
        <title>SAGPT - Clientes</title>
    </head>
    <body>
        <jsp:include page="./WEB-INF/components/header.jsp" />
        
        <div class="jumbotron mb-0">
            <main class="container">
                <h2 class="display-4 text-center">Imágenes</h2>
                
                <c:if test="${! empty imagen}">
                    <p>Id: ${imagen.id}</p>
                    
                    <img src="${pageContext.request.contextPath}/ServletCargarImagen?id=${imagen.id}" alt="">
                </c:if>
                
            </main>
            
        </div>
        
        <jsp:include page="./WEB-INF/components/footer.jsp" />
    </body>
</html>