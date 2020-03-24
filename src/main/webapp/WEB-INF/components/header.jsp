<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-xl">
            <a class="navbar-brand link-brand" href="${pageContext.request.contextPath}/index.jsp">SAGPT</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Secciones -->
                
                <ul class="navbar-nav mr-auto">
                    <!-- Productos -->
                    <li class="nav-item active">
                        <a class="nav-link" href="${pageContext.request.contextPath}/ServletProductos?accion=producto">Productos <span class="sr-only">Productos</span></a>
                    </li>

                    <!-- Clientes -->
                    <li class="nav-item active">
                        <a class="nav-link" href="${pageContext.request.contextPath}/clientes.jsp">Clientes <span class="sr-only">Clientes</span></a>
                    </li>

                    <!-- Compras -->
                    <c:if test='${!rol.equals("cliente") && ! empty userLogged}'>
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Compras<span class="sr-only">Compras</span></a>
                        </li>
                    </c:if>
                        
                </ul>
                
                
                <div class="errores-login">
                    <c:if test="${! empty errorLogin}">
                        <p id="error-login">${errorLogin}</p>
                    </c:if>    
                </div>
                        
                <% session.setAttribute("errorLogin", null); %>
        

                <c:choose>
                    <c:when test="${! empty userLogged}">
                        <!-- Logged -->
                        <form class="form-inline my-2 my-lg-0 justify-content-center" 
                              method="POST" action="${pageContext.request.contextPath}/ServletUsers">
                            <label class="user--logged">${persona}</label>
                            <button name="btnAccion" value="signOut" class="btn btn-outline-info my-2 my-sm-0" type="submit">Sign out</button>
                        </form> 
                    </c:when>

                    <c:otherwise>
                        <!-- Login -->
                        <form id="formLogin" class="form-inline my-2 my-lg-0" method="POST"
                              action="${pageContext.request.contextPath}/ServletUsers">
                            <input id="username" name="username" class="form-control mr-sm-2" type="text" placeholder="Username" >
                            <input id="password" name="password" class="form-control mr-sm-2" type="password" placeholder="Password" >
                            <button name="btnAccion" id="btnLogin" value="signIn" class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign in</button>
                        </form> 
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </nav>
</header>
