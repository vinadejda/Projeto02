<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortiza&ccedilão Americana</title>
    </head>
    <body>
        <%
            String FormAmericana = request.getParameter("FormAmericana");
                double saldodevedor=0, txjuros=0;
                int prestacoes=0;
                try{
                    saldodevedor = Double.parseDouble(request.getParameter("saldodevedor"));
                    txjuros = Double.parseDouble(request.getParameter("txjuros"));
                    prestacoes = Integer.parseInt(request.getParameter("prestacoes"));
                }catch(Exception ex){}
            
           %>
           <form name="FormAmericana" action="calc">
               <table>
                    <tr><td class = "title" colspan = "2"><strong>Amortiza&ccedil;&atilde;o Sistema Americano</strong></td></tr>
                    <tr><td>Saldo Devedor:</td>
                        <td><input type="number" style="text-align:center" name="SaldoDevedor" value="" placeholder="Saldo Devedor"><br></td></tr>
                    <tr><td>Juros:</td>
                        <td><input type="number" style="text-align:center" name="Juros" value="" placeholder="Taxa de Juros"><br></td></tr>
                    <tr><td>Tempo em Meses:</td>
                        <td><input type="number" style="text-align:center" name="Tempo" value="" placeholder="Tempo em Meses"><br></td></tr>    
                    <tr><td><input type="submit" style="align-content: center" value="Enviar"
                        <td><input type="reset" style="align-content: center" value="Reset"></td></td></tr>
              
                
              
               </table>
        </form>
        <h1>Hello World!</h1>
    </body>
</html>
