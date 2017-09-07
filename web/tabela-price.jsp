<%-- 
    Document   : tabela-price
    Created on : 06/09/2017, 21:38:11
    Author     : vitoria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <body>
        <h1>Tabela Price</h1>
        <%
        String IdForm = request.getParameter("IdForm");
        double capital=0.0, txJuros=0.0;
        int tempo=1;
           try{
                capital = Double.parseDouble(request.getParameter("capital"));
                tempo = Integer.parseInt(request.getParameter("tempo"));
                txJuros = Double.parseDouble(request.getParameter("txJuros"));                
            }catch(Exception ex){}
        %>
        <form name="IdForm">
            <input typp="text" name="capital" value="<%=capital%>" placeholder = "Total em Reais"><br>
            <input type="number" name="tempo" value="<%=tempo%>" placeholder="Tempo em Meses"><br>
            <input type="number" name="txJuros" value="<%=txJuros%>" placeholder="Taxa de Juros em %(Porcentagem)"><br>
            <input type="submit" value="Enviar">
        </form>
        <%           
            txJuros = txJuros/100;
            double PMT = capital/((1-(Math.pow((1+txJuros),-tempo)))/txJuros);           
        %>
        <%=PMT%>
    </body>
</html>
