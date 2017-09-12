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
            <h1>Sistemas de Amortização</h2> 
            <p><b>Definição:</b> São modelos de pagamentos de prestações de um empréstimo.</p>
            <p><b>Sistema de Amortização Americano:</b> Determina os juros aplicados na operação de um empréstimo, deve ser pago, periodicamente, enquanto o
capital emprestado é efetuada ao final do período contratado (de uma só vez).</p>
            <p><b>Sistema de Amortização Constante:</b> As amortizações do capital sempre são iguais (ou constantes). Portanto, o valor da
amortização é obtido mediante a divisão do capital emprestado pelo número de prestações. Os juros por
incidirem sobre o saldo devedor, cujo montante decresce após o pagamento de cada amortização,
assumem valores decrescentes no período, ou seja, os juros são crescentes e a amortização é decrescente.</p>
            <p><b>Sistema Price:</b> As prestações devem ser iguais, periódicas e
sucessivas. Os juros, por incidirem sobre o saldo devedor são decrescentes, e as parcelas de
amortização assumem valores crescentes. As prestações são determinadas pela aplicação da seguinte
fórmula:</p>
            <img src="formula.png" alt="Valor da prestação = Capital divido por 1-(1+ Taxa de Juros) elevado ao -Tempo) dividido pela Taxa de Juros); "/>
        </section>
        <section id="equipe">
            <h1>Projeto desenvolvido por:</h1>
            <br>
                <ul>
                    <li><b>Gabriel Daichi:</b> Responsavél pelo cálculo do Sistema de Amortização Constante</li>
                    <li><b>Leonardo Umbelino:</b> Responsavél pelo cálculo do Sistema de Amortização Americana</li>
                    <li><b>Vitória Nadejda:</b> Responsavél pelo cálculo do Sistema Price e pela Página Home</li>
                </ul>
            <aside id="detalhes"><i>Programação Orientado a Objeto<br><br>
                    4° Ciclo - ADS - Vespertino</i></aside>
        </section>

        <%@include file="WEB-INF/footer.jspf" %>
    </body>
</html>
