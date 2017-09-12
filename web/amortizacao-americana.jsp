<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@include file="WEB-INF/header.jspf" %>
<%@include file="WEB-INF/menu.jspf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css.css">
        <title>Amortização Americana</title>
    </head>
    <body>
        <section class="formulario">
            <h1>Amortização Americana</h1>
            <% String formAmericana=request.getParameter("formAmericana");
            double saldodevedor=0.0, jurosP=0.0, saldoDevFinal=0, saldoDev=0.0;
            saldodevedor=saldoDev;
            int tempo=1;
            try{
                if(request.getParameter("Enviar") != null){
                    saldodevedor = Double.parseDouble(request.getParameter("saldodevedor"));
                    jurosP= Double.parseDouble(request.getParameter("jurosP"));
                    tempo= Integer.parseInt(request.getParameter("tempo"));
                }
            }
            catch(Exception ex){%><span id="hi" class="tabela"><span id="alerta"><%="Valor Incorreto."%><a href="#"><button>Tentar Novamente</button></a></span></span><%
                }
        %>
            <form name="formAmericana" action="#hi"method="post">
                <label>Saldo Devedor:</label>><input type="number" required step="0.01" name="saldodevedor" placeholder="Saldo Devedor(R$)"></br>
                <label>Juros:</label><input type="number" name="jurosP"  required step="0.001" placeholder="Juros" placeholder="(%)"></br>
                <label>Tempo:</label><input type="number" required name="tempo" placeholder="Meses"></br>
                <input type="submit" value="Enviar" name="Enviar">
                
            </form>
        </section>  
            <%
            double amorti=0.0, prestacao=0.0, jurosD=0.0, juros=0.0,PrestacaoTotal=0.0, JurosTotal=0.0, AmortizacaoTotal=0.0, ultimaparcela=0.0, sdfinal=0.0;
            jurosD=(jurosP/100);
            DecimalFormat df = new DecimalFormat("###,###,###.##");
            %>
            
        <section id="hi" class="tabela">
            <a href="#" id="btnfechar">X</a>
                <div id="conteudo">
                    <h3 align="left">Saldo devedor: R$<%=df.format(saldodevedor)%> ; Tempo: <%=tempo%> meses; Juros: <%=jurosP%>%</h3>
                    <table border="2" >
                        <tr>
                            <th>Período</th><th>Prestação</th><th>Juros</th><th>Amortização</th><th>Saldo devedor</th>
                        </tr>
                         <tr>
                            <td>0</td><td>-</td><td>-</td><td>-</td><td><%=df.format(saldodevedor)%></td>
                        </tr>
                        
                        <% for(int i=1;i<=tempo;i++){
                        juros = jurosD*saldodevedor;
                        saldoDev = saldodevedor;
                        prestacao=juros;
                        PrestacaoTotal=PrestacaoTotal+prestacao;
                        JurosTotal=JurosTotal+juros;
                        AmortizacaoTotal=saldodevedor;
                        sdfinal=saldodevedor;
                        if(i==tempo){   
                            PrestacaoTotal=(juros*tempo)+saldodevedor;
                            saldoDev = 0;
                            amorti=saldodevedor;
                        }
                        %>
                        <tr>
                            <td><%=i%></td><td><%=df.format(prestacao)%></td><td><%=df.format(juros)%></td><td><%=df.format(amorti)%></td><td><%=df.format(saldoDev)%></td>
                        </tr>
                        <%}%>
                        <tr>
                            <td>TOTAL</td><td><%=df.format(PrestacaoTotal)%></td><td><%=df.format(JurosTotal)%></td><td><%=df.format(AmortizacaoTotal)%></td><td>-</td>
                        </tr>
                    </table>
                </div>
        </section>
        <%@include file="WEB-INF/footer.jspf"%>
    </body>
</html>
