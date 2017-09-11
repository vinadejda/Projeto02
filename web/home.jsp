<%-- 
    Document   : home.jsp
    Created on : 06/09/2017, 23:10:35
    Author     : vitoria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/header.jspf" %>
<%@include file="WEB-INF/menu.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css.css">
        <title>Home</title>
    </head>
    <body>
        <section id="aplicacao">
            <h1>Sistema de Amortização</h2> 
            <h2>Definição: São modelos de pagamentos de prestações de um empréstimo</h2>
            <p><b>Sistema de Amortização Americano:</b> As prestações representam os pagamentos dos juros e a amortização é no final do prazo definido no empréstimo</p>
            <p><b>Sistema de Amortização Constante:</b> Os pagamentos da amortização são fixas e os juros são crescentes e as prestações decrescentes</p>
            <p><b>Sistema Price:</b> Os pagamentos das prestações são fixas e a amortização crescente e os juros são decrescentes</p>
        </section>
        <section id="equipe">
            <h1>Integrantes:</h1>
            <h2> Gabriel Daichi</h2>
            <h2>Leonardo Umbelino</h2>
            <h2>Vitória Nadejda</h2>
        </section>

        <%@include file="WEB-INF/footer.jspf" %>
    </body>
</html>
