<%@page import="org.mavridis.helper.ProveedorHelper"%>
<%@page import="org.mavridis.helper.MarcaHelper"%>
<%@page import="java.util.List"%>
<%@page import="org.mavridis.dao.Marca"%>
<%@page import="org.mavridis.dao.Proveedor"%>
<%@page import="org.mavridis.helper.ProductoHelper"%>
<%@page import="org.mavridis.dao.Producto"%>
<%
    Producto producto = new ProductoHelper( ).getProductoById(request);
    
    if( producto == null )
    {
        producto = new Producto( new Marca(), new Proveedor());
        producto.setNomProducto("");
        producto.setDescProducto("");
        producto.setUrlProducto("");
        producto.setPrecioPubl(null);
        producto.setCostoProducto(null);
        producto.getMarca().setNomMarca("");
        producto.getProveedor().setNomProveedor("");
    }
    
%>
<form action="ProductoList.jsp">
    <div class="row mt-4 grey">
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="nomProducto">Nombre:</label>
                <input type="text" class="form-control" id="nomProducto" placeholder="Escribe el nombre del producto" name="nomProducto" value="<%=producto.getNomProducto()%>">
            </div>
        </div>
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="descProducto">Descripci&oacute;n:</label>
                <input type="text" class="form-control" id="descProducto" placeholder="Escribe la descripci&o&oacute;n del producto" name="descProducto" value="<%=producto.getDescProducto()%>">
            </div>
        </div>
    </div>
    <div class="row mt-4 grey">
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="urlProducto">URL:</label>
                <input type="text" class="form-control" id="urlProducto" placeholder="Escribe el url del producto" name="urlProducto" value="<%=producto.getUrlProducto()%>">
            </div>
        </div>
        <div class="col">
            
            <div class="mb-3 mt-3">
                <label for="precioPubl">Precio:</label>
                <input type="number" class="form-control" id="precioPubl" placeholder="Escribe el precio del producto" name="precioPubl" value="<%=producto.getPrecioPubl()%>">
            </div>
        </div>
    </div> 
    <div class="row mt-4 grey">
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="costoProducto">Costo:</label>
                <input type="number" class="form-control" id="costoProducto" placeholder="Escribe el costo del producto" name="costoProducto" value="<%=producto.getCostoProducto()%>">
                
            </div>
        </div>
    </div>
                  
    <div class="row mt-4 grey">
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="nomMarca">Marca</label>
                <select class="form-select form-select-sm mb-3" aria-label=".form-select-lg example" id="nomMarca" placeholder="Escribe un marca" name="nomMarca">
                <%
                        String opcionR = producto.getMarca().getNomMarca();
                        
                        if (producto.getMarca().getNomMarca()== null || producto.getMarca().getNomMarca().length() == 0)
                        {
                            opcionR = "Selecciona una marca";
                        }
                        else 
                        {
                            opcionR = producto.getMarca().getNomMarca();
                        }
                    %>  
                    <option selected><%=opcionR%></option>
                    <%
                        List<Marca>marcaList = new MarcaHelper( ).getList( );
                        if( marcaList != null && marcaList.size() > 0 )
                        {
                           for( Marca marca : marcaList )
                           {
                    %>
                                <option value="<%=marca.getNomMarca()%>"><%=marca.getNomMarca()%></option>
                    <%
                           }
                        }
                    %>
                  </select>
            </div>
        </div>
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="nomProveedor">Proveedor</label>
                <select class="form-select form-select-sm mb-3" aria-label=".form-select-lg example" id="nomProveedor" placeholder="Escribe un proveedor" name="nomProveedor">
                    <%
                        String opcionU = producto.getProveedor().getNomProveedor();
                        
                        if (producto.getProveedor().getNomProveedor()== null || producto.getProveedor().getNomProveedor().length() == 0)
                        {
                            opcionU = "Selecciona un proveedor";
                        }
                        else 
                        {
                            opcionU = producto.getProveedor().getNomProveedor();
                        }
                    %>                
                                    <option selected><%=opcionU%></option>
                    <%
                        List<Proveedor>proveedorList = new ProveedorHelper( ).getList( );
                        if( proveedorList != null && proveedorList.size() > 0 )
                        {
                           for( Proveedor proveedor : proveedorList )
                           {
                    %>
                                <option value="<%=proveedor.getNomProveedor()%>"><%=proveedor.getNomProveedor()%></option>
                    <%
                           }
                        }
                    %>
                  </select>
                  
            </div>
        </div>
    </div>
    <%
            if(producto.getIdProducto()!= null && producto.getIdProducto()> 0 )
            {
    %>
            <input type="hidden" id="action" name="action" value="actualizar" />
            <input type="hidden" id="id" name="id" value="<%=producto.getIdProducto()%>" />
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
