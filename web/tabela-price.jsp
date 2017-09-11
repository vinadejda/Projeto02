<%-- 
    Document   : tabela-price
    Created on : 06/09/2017, 21:38:11
    Author     : vitoria
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@include file="WEB-INF/header.jspf" %>
<%@include file="WEB-INF/menu.jspf" %>
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
            <% String FormPrice = request.getParameter("FormPrice");            
            double cptInicial=0.0, txJuros=0.0;
            int tempo=1;
               try{
                    if(request.getParameter("cptInicial") != null){
                        cptInicial = Double.parseDouble(request.getParameter("cptInicial"));
                    }
                    if(request.getParameter("tempo") != null){
                        tempo = Integer.parseInt(request.getParameter("tempo"));
                    }
                    if(request.getParameter("txJuros") != null){
                        txJuros = Double.parseDouble(request.getParameter("txJuros"));   
                    }
   }catch(Exception ex){%><span id="hi" class="tabela"><span id="alerta"><%="Valor Incorreto."%><a href="#"><button>Tentar Novamente</button></a></span></span><%
                } %>
            <form name="FormPrice" action="#hi">
                <label>Capital:</label><br><input type="text" name="cptInicial" placeholder = "Total em Reais (R$)"><br>
                <label>Tempo: </label> <br><input type="number" name="tempo" placeholder="Tempo em Meses"><br>
                <label>Taxa de Juros: </label><br><input type="number" name="txJuros" placeholder="Taxa de Juros em %(Porcentagem)"><br>
                <input type="submit" value="Enviar">
            </form>
        </section>                
        <%  double capital =cptInicial, saldoDevedor = 0.0, amortizacao = 0.0, tlAmortizacao = 0.0, juros = 0.0, tlJuros=0.0, pmt = 0.0, tlPmt=0.0;
            txJuros = txJuros/100;            
            pmt = cptInicial/((1-(Math.pow((1+txJuros),(-tempo))))/txJuros);              
            DecimalFormat df = new DecimalFormat("###,###,###.##"); %>
        <section id="hi" class="tabela">
            <a href="#" id="btnfechar">X</a>
            <aside id="conteudo">   
                <h1>Resultado: </h1>
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
                            tlPmt = tlPmt+pmt; %>                        
                            <tr>
                                <td> <%=i%> </td><td> <%=df.format(capital)%> </td><td> <%=df.format(amortizacao)%> </td><td> <%=df.format(juros)%> </td><td><%=df.format(pmt)%></td>
                            <tr>                                
                        <%}
                    }%>                    
                    <tr>
                        <td><b> Total </b></td><td><b> - </b></td><td><b> <%=df.format(tlAmortizacao)%> </b></td><td><b> <%=df.format(tlJuros)%></b> </td><td><b><%=df.format(tlPmt)%></b></td>
                    <tr>
                </table>
                <aside id="dados">
                    <h2> Dados:</h2>
                    Capital: R$ <%=df.format(cptInicial)%><br>
                    Tempo: <%=tempo%> meses<br>
                    Taxa de Juros: <%=txJuros*100%>%<br>
                    <br>
                    Total gasto em Amortização: <%=df.format(tlAmortizacao)%> <br>
                    Total gasto em Juros: <%=df.format(tlJuros)%><br>
                    Valor Total: <%=df.format(tlPmt)%>
                </aside>
            </aside>
        </section>
        <%@include file="WEB-INF/footer.jspf"%>
    </body>
</html>
