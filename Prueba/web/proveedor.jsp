<%-- 
    Document   : proveedor.jsp
    Created on : Jul 14, 2017, 1:14:57 AM
    Author     : Victor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Controlador.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hola con JSP</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="general"></div>
        <hr id="hr1"/>
          </div>
          <form action="GuardarProveedor" method="POST" style="display:block"><br/><br/>
        <div class="clase" align="center" display="inline">
            <div>Proveedor</div>
            <div>
                <select id="id1" name="prov" style="width: 140px">
                    <% Queries consulta = new Queries(); %>
                    <% ResultSet resultset = consulta.getProveedores(); %>
                    <%  while(resultset.next()){ %>
                    <option><%= resultset.getString(2)%></option>
                    <% } %>
                </select></div>
        </div>
        <div class="clase" align="center">
            <div>Clave</div>
            <div><input type="text" name="clave" size="15px"></div>
        </div>
        <div class="clase" align="center">
            <div>Costo</div>
            <div><input type="text" name="costo" size="15px"></div>
        </div>
          <div id=div3 align="center">
              <br/>
          <input type="submit" value="Guardar"/>
          </div>
      </form>
        <hr id="hr1"/>
    </body>
</html>