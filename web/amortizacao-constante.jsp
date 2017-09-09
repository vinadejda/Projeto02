<%-- 
    Document   : amortizacao-constante
    Created on : 09/09/2017, 13:09:47
    Author     : xxtingxx
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css.css">
        <title>Amortização Constante</title>
    </head>
    <body>
        <section class="formulario">
            <h1>Amortização Constante</h1>
            <% String formConstante=request.getParameter("formConstante");
            double capital=0.0, jurosP=0.0;
            int tempo=1;
            try{
                if(request.getParameter("Enviar") != null){
                    capital = Double.parseDouble(request.getParameter("capital"));
                    jurosP= Double.parseDouble(request.getParameter("jurosP"));
                    tempo= Integer.parseInt(request.getParameter("tempo"));
                }
            }
            catch(Exception ex){%><h1>EROU</h1><%}
            %>
            <form name="formConstante" action="#hi">
                <b>Saldo devedor: </b><input type="number" required step="0.01" name="capital" placeholder="Saldo Devedor(R$)"></br>
                <b>Juros: </b><input type="number" name="jurosP"  required step="0.001" placeholder="Juros" placeholder="(%)"></br>
                <b>Tempo: </b><input type="number" required name="tempo" placeholder="Meses"></br>
                <input type="submit" value="Enviar" name="Enviar">
            </form>
        </section>
            <%
            double amorti=0.0, prest=0.0, jurosK=0.0, juros=0.0,saldoDev=0.0;
            jurosK=(jurosP/100);
            amorti=(capital/tempo);
            saldoDev=capital;
            %>
            
        <section id="hi" class="tabela">
            <a href="#" id="btnfechar">X</a>
                <div id="conteudo">
                    <table border="1">
                        <tr>
                            <th>Período</th><th>Prestação</th><th>Juros</th><th>Amortização</th><th>Saldo devedor</th>
                        <tr>
                         <tr>
                            <td>0</td><td>-</td><td>-</td><td>-</td><td><%=capital%></td>
                        <tr>
                        <% for(int i=1;i<=tempo;i++){
                        saldoDev=capital-amorti;
                        juros=((tempo-i)+1)*jurosK*amorti;
                        prest=juros+amorti;
                        capital=saldoDev;
                        %>
                        <tr>
                            <td><%=i%></td><td><%=prest%></td><td><%=juros%></td><td><%=amorti%></td><td><%=saldoDev%></td>
                        <tr>
                        <%}%>
                    </table>
                </div>
        </section>
    </body>
</html>
    