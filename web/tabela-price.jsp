<%-- 
    Document   : tabela-price
    Created on : 06/09/2017, 21:38:11
    Author     : vitoria
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
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
        String FormPrice = request.getParameter("FormPrice");
        double capital=0.0, txJuros=0.0;
        int tempo=1;
           try{
                if(request.getParameter("capital") != null){
                    capital = Double.parseDouble(request.getParameter("capital"));
                }
                if(request.getParameter("capital") != null){
                    tempo = Integer.parseInt(request.getParameter("tempo"));
                }
                if(request.getParameter("capital") != null){
                    txJuros = Double.parseDouble(request.getParameter("txJuros"));   
                }
                             
           }catch(Exception ex){%><%="Valor Incorreto"%><%
            }
        %>
        <form name="FormPrice">
            <input typp="text" name="capital" value="<%=capital%>" placeholder = "Total em Reais (R$)"><br>
            <input type="number" name="tempo" value="<%=tempo%>" placeholder="Tempo em Meses"><br>
            <input type="number" name="txJuros" value="<%=txJuros%>" placeholder="Taxa de Juros em %(Porcentagem)"><br>
            <input type="submit" value="Enviar">
        </form>
        <%  double saldoDevedor = 0.0, amortizacao = 0.0, juros = 0.0, pmt = 0.0;
            txJuros = txJuros/100;            
            pmt = capital/((1-(Math.pow((1+txJuros),(-tempo))))/txJuros);  
             
             DecimalFormat df = new DecimalFormat("###,###,###.##");
            
            //verificar se o numero digitado e negativo
            //verificar se o numero for string
        %>
        <section>
            <table border='1'>
                <tr><th>Período</th><th>Saldo devedor(R$)</th><th>Amortização(R$)</th><th>Juros(R$)</th><th>Prestação(R$)</th></tr>
                <% for(int i=0; i<=tempo; i++){    
                    
                    if(i==0){ %>
                        <tr>
                            <td> <%=i%> </td><td> <%=df.format(capital)%> </td><td> - </td><td> - </td><td> - </td>
                        <tr>
                    <%}
                    else{
                        juros = capital*txJuros;                        
                        amortizacao = pmt-juros;
                        capital = capital-amortizacao;
                        
                    %>
                        <tr>
                            <td> <%=i%> </td><td> <%=df.format(capital)%> </td><td> <%=df.format(amortizacao)%> </td><td> <%=df.format(juros)%> </td><td><%=df.format(pmt)%></td>
                        <tr>
                    <%}
                        
                }%>
            </table>
        </section>
    </body>
</html>
