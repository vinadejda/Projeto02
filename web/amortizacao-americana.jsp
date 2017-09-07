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
        <form name="FormAmericana"
              <input type="number" name="SaldoDevedor" value="" placeholder="Saldo Devedor"><br>
              <input type="number" name="Juros" value="" placeholder="Taxa de Juros"><br>
              <input type="number" name="Tempo" value="" placeholder="Tempo em Meses"><br>
                
           
            
        </form>
        <h1>Hello World!</h1>
    </body>
</html>
