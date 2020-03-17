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

                    <article class="product row">
                        <div class="product-img col-md-3">
                            <img src="${pageContext.request.contextPath}/img/iphone.jpg" alt="Iphone">
                        </div>
                        <div class="product-content col-md-9">
                            <h3 class="product-title">Xiaomi Redmi Note 5</h3>
                            <div class="product-description">
                                <p class="product-p">Especificaciones: RAM - 4 GB;
                                    Procesador Qualcomm Snapdragon 636</p>
                            </div>
                        </div>
                    </article>
                    

                </section>

            </main>

        </div>

        <jsp:include page="./WEB-INF/components/footer.jsp" />
    </body>
</html>