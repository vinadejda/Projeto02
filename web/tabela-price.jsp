<%-- 
    Document   : tabela-price
    Created on : 06/09/2017, 21:38:11
    Author     : vitoria
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<!--%@include file="WEB-INF/header.jspf" %-->
<!--%@include file="WEB-INF/menu.jspf" %-->
<!--%@include file="WEB-INF/footer.jspf"%>-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css.css">
        <title>Tabela Price</title>
    </head>
    <body>
        <section class="formulario">
            <h1>Tabela Price</h1>
            <%
            String FormPrice = request.getParameter("FormPrice");
            String url = request.getRequestURL().toString();
            
            double capital=0.0, txJuros=0.0;
            int tempo=1;
               try{
                    if(request.getParameter("capital") != null){
                        capital = Double.parseDouble(request.getParameter("capital"));
                    }
                    if(request.getParameter("tempo") != null){
                        tempo = Integer.parseInt(request.getParameter("tempo"));
                    }
                    if(request.getParameter("txJuros") != null){
                        txJuros = Double.parseDouble(request.getParameter("txJuros"));   
                    }

               }catch(Exception ex){%><%="Valor Incorreto"%><%
                }
            %>
            <form name="FormPrice" >
                <%=url%>
                <label>Capital:</label><br><input type="text" name="capital" placeholder = "Total em Reais (R$)"><br>
                <label>Tempo: </label> <br><input type="number" name="tempo" placeholder="Tempo em Meses"><br>
                <label>Taxa de Juros: </label><br><input type="number" name="txJuros" placeholder="Taxa de Juros em %(Porcentagem)"><br>
                <input type="submit" value="Open Modal">
            </form>
        </section>
                
        <%  double saldoDevedor = 0.0, amortizacao = 0.0, tlAmortizacao = 0.0, juros = 0.0, tlJuros=0.0, pmt = 0.0, tlPmt=0.0;
            txJuros = txJuros/100;            
            pmt = capital/((1-(Math.pow((1+txJuros),(-tempo))))/txJuros);  
             
             DecimalFormat df = new DecimalFormat("###,###,###.##");
        %>
        
        <section id="hi" class="tabela">
            <a href="#" id="btnfechar">X</a>
            <div id="conteudo">
                
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
                            tlJuros = tlJuros+juros;
                            amortizacao = pmt-juros;
                            tlAmortizacao = tlAmortizacao+amortizacao;
                            capital = capital-amortizacao;
                            tlPmt = tlPmt+pmt;
                        %>
                        
                            <tr>
                                <td> <%=i%> </td><td> <%=df.format(capital)%> </td><td> <%=df.format(amortizacao)%> </td><td> <%=df.format(juros)%> </td><td><%=df.format(pmt)%></td>
                            <tr>
                                
                        <%}
                    }%>
                    
                    <tr>
                        <td> Total </td><td> - </td><td> <%=df.format(tlAmortizacao)%> </td><td> <%=df.format(tlJuros)%> </td><td><%=df.format(tlPmt)%></td>
                    <tr>
                </table>
            </div>
        </section>
    </body>
</html>
