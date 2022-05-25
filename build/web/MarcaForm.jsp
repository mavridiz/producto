<%@page import="java.util.List"%>
<%@page import="org.mavridis.dao.Marca"%>
<%@page import="org.mavridis.helper.MarcaHelper"%>
<%
    Marca marca = new MarcaHelper( ).getMarcaById(request);
    
    if( marca == null )
    {
        marca = new Marca();
        marca.setNomMarca("");
    }
%>
<form action="MarcaList.jsp">
    <div class="row mt-4 grey">
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="nomMarca">Nombre:</label>
                <input type="text" class="form-control" id="nomMarca" placeholder="Escribe el nombre del marca" name="nomMarca" value="<%=marca.getNomMarca()%>">
            </div>
        </div>
    </div>        
            

<br/>
    <%
            if(marca.getIdMarca()!= null && marca.getIdMarca() > 0 )
            {
    %>
        <input type="hidden" id="action" name="action" value="actualizar" />
        <input type="hidden" id="id" name="id" value="<%=marca.getIdMarca()%>" />
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
