<%@page import="java.util.List"%>
<%@page import="org.mavridis.dao.Proveedor"%>
<%@page import="org.mavridis.helper.ProveedorHelper"%>
<%
    Proveedor proveedor = new ProveedorHelper( ).getProveedorById(request);
    
    if( proveedor == null )
    {
        proveedor = new Proveedor();
        proveedor.setNomProveedor("");
    }
%>
<form action="ProveedorList.jsp">
    <div class="row mt-4 grey">
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="nomProveedor">Nombre:</label>c
                <input type="text" class="form-control" id="nomProveedor" placeholder="Escribe el nombre del proveedor" name="nomProveedor" value="<%=proveedor.getNomProveedor()%>">
            </div>
        </div>
    </div>        
            
<br/>
    <%
            if(proveedor.getIdProveedor()!= null && proveedor.getIdProveedor() > 0 )
            {
    %>
        <input type="hidden" id="action" name="action" value="actualizar" />
        <input type="hidden" id="id" name="id" value="<%=proveedor.getIdProveedor()%>" />
    <%
            }
            else
            {
    %>
            <input type="hidden" id="action" name="action" value="send" />
    <%
            }
    %>        
            
    <div class="row mt-4 grey">
        <input type="hidden" id="action" name="action" value="send" />
        <div class=""input-group mb-3">
            <button type="submit" class="btn btn-primary">Enviar</button>
            <button type="reset" class="btn btn-primary">Borrar</button>
        </div>
    </div>
</form>
<br/>
<div class="row mt-6">
    <a href="?">
        <button type="button" class="btn btn-outline-primary" >Regresar</button>
    </a>
</div>
