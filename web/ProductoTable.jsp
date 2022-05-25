<%@page import="org.mavridis.dao.Producto"%>
<%@page import="org.mavridis.helper.ProductoHelper"%>
<%@page import="java.util.List"%>
<div class="row">
    <a href="?action=nuevo">
        <button type="button" class="btn btn-outline-primary" >Nuevo</button>
    </a>
    <br/><br/>
</div>
<%
    List<Producto>productoList = null;
    productoList = new ProductoHelper( ).getList( );
    if( productoList == null || productoList.size() == 0 )
    {
%>
        <div class="row mt-4">
            <p>Lista producto sin datos</p>
        </div>
<%            
        return;
    }
%>
        <div class="row">
            <table class="table">
                <thead class="table-primary">
                    <tr>
                        <th>Id</th>
                        <th>Producto</th>
                        <th>Descripci&oacute;n</th>
                        <th>URL</th>
                        <th>Precio</th>
                        <th>Costo</th>
                        <th>Marca</th>
                        <th>Proveedor</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
<%
    for( Producto producto : productoList)
    {
%>
                <tbody>
                    <tr>
                        <td>
                            <%=producto.getIdProducto()%>
                        </td>
                        <td>
                            <%=producto.getNomProducto()%>
                        </td>
                        <td>
                            <%=producto.getDescProducto()%>
                        </td>
                        <td>
                            <%=producto.getUrlProducto()%>
                        </td>
                        <td>
                            <%=producto.getPrecioPubl()%>
                        </td>
                        <td>
                            <%=producto.getCostoProducto()%>
                        </td>
                        <td>
                            <%=producto.getMarca().getNomMarca()%>
                        </td>
                        <td>
                            <%=producto.getProveedor().getNomProveedor()%>
                        </td>
                        <td>
                            <a href="?action=delete&id=<%=producto.getIdProducto()%>">
                                <button type="button" class="btn btn-outline-primary ">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </a>
                            <a href="?action=editar&id=<%=producto.getIdProducto()%>">
                                <button type="button" class="btn btn-outline-primary ">
                                    <i class="fa fa-edit"></i>
                                </button>
                            </a>
                        </td>
                    </tr>
                </tbody>
<%
    }
%>
            </table>
        </div>