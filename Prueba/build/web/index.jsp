<%-- 
    Document   : index
    Created on : Jul 11, 2017, 9:53:20 PM
    Author     : Victor
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Controlador.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java Web Application</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <script src="jquery-3.2.1.js"></script>  
        <script type="text/javascript">
             $(document).ready(function() {      
     $('td').click(function() {
         var col = 1+$(this).prevAll().length;
         var row = $(this).parent('tr').attr('id');
         var editable = $(this).parent('tr').attr('contenteditable');
         
         if(col===5)
         {
             window.location.reload();
         }
         
         if(col === 1)
         {   
             if(editable === undefined || editable === 'false')
             {
                 $(this).parent('tr').attr('contenteditable','true');
             }
             
             else
             {
                 $(this).parent('tr').attr('contenteditable','false');
                 var tds = $(this).closest("tr");
                 var val2 = tds.find("td:nth-child(2)");
                 var val3 = tds.find("td:nth-child(3)");
                 var val4 = tds.find("td:nth-child(4)");
                 var at2 = val2.text();
                 var at3 = val3.text();
                 var at4 = val4.text();

             }
         }
          //alert(col);
          //alert(row);
          
           $.ajax({ //Comunicación jQuery hacia JSP
           type: "POST",
           url: "index.jsp",
           data: {row : row, col : col, at2 : at2, at3 : at3, at4 : at4, editable : editable}
        });  
            <% String renglon = request.getParameter("row");   %>
            <% String columna = request.getParameter("col");   %>
            <% String at2 = request.getParameter("at2");   %>
            <% String at3 = request.getParameter("at3");   %>  
            <% String at4 = request.getParameter("at4");   %>
            <% String editable = request.getParameter("editable");   %>
            <% Queries query = new Queries();   %>
            <% 
                if(columna != null){
                    if(columna.equals("5")){
                        boolean eliminado = query.eliminarProveedor(renglon);
                        
                    }
                    
                    else if(editable.equals("true")){
                        boolean actualizado = query.editarProveedor(renglon, at2, at3, at4);
                    }
                }
                  %>
                 
    });
 });
        </script>
        
        <div id="general"></div>
        <br/><hr id="hr1"/>
        <br/><br/><br/>
       <form action="GuardarProducto" method="POST" style="display:inline">
           <div id="columna"> </div>
           <div id="div1">Clave:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;
           <input type="text" name="claveProducto"/></div> 
           <div id="div1">Nombre:
           <input type="text" name="nombreProducto"/></div>
          <br/><br/><br/>
          
          <div id="columna"></div>
          <div id="div1">Tipo Producto:
              <select name="tipo" style="width: 150px" label="Tipo producto">
                  <% Queries consulta = new Queries(); %>
                  <% ResultSet resultset = consulta.getTipoProducto(); %>
                  <%  while(resultset.next()){ %>
                  <option><%= resultset.getString(2)%></option>
                  <% } %>
              </select>
          </div>
              <div id="div1">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="status" value="activo" />&nbsp;&nbsp;&nbsp;Es activo</div>
              <br/><br/><br/><br/>
              <div id="columna"> </div>
              <div id="div1">Proveedores:</div>
              <br/><br/>
              <table id="resultTable" border="1px" align="center">
                  <tr>
                      <th bgcolor="#D8D8D8">Editor</th>
                      <th bgcolor="#D8D8D8">Proveedor</th>
                      <th bgcolor="#D8D8D8">Clave Producto</th>
                      <th bgcolor="#D8D8D8">Costo</th>
                      <th bgcolor="#D8D8D8">Eliminar</th>
                  </tr>
                  
                  <% Queries consulta2 = new Queries(); %>
                    <% ResultSet resultset2 = consulta2.getTablaProveedores(); %>
                    <% int i = 0; %>
                    <%  while(resultset2.next()){ %>
                    <% i = i+1; %>
                    <tr id="<%=resultset2.getString(1)%>">
                        <td id="1" align="center"><img src="lapiz.png"></td>
                        <td id="2" align="center"><%= resultset2.getString(2)%></td>
                        <td id="3" align="center"><%= resultset2.getString(3)%></td>
                        <td id="4" align="center"><%= resultset2.getString(4)%></td>
                        <td id="5" align="center"><img src="Cruz_roja.png"></td>
                        
                    </tr>
                    <% } %>
              </table>
              <br/>
              <div id="div3" align="right"><a href="proveedor.jsp" color="#6CBFF7">Agregar Proveedor</a></div><br/><br/>
               <div id="div3" align="right"><input type="submit" value="Guardar"/></div>
                                    </form>
              <br/>
              <hr id="hr1"/>                          
    </body>
</html>