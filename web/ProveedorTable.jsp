<%@page import="org.mavridis.dao.Proveedor"%>
<%@page import="org.mavridis.helper.ProveedorHelper"%>
<%@page import="java.util.List"%>
<div class="row">
    <a href="?action=nuevo">
        <button type="button" class="btn btn-outline-primary" >Nuevo</button>
    </a>
    <br/><br/>
</div>
<%
    List<Proveedor>proveedorList = null;
    proveedorList = new ProveedorHelper( ).getList( );
    if( proveedorList == null || proveedorList.size() == 0 )
    {
%>
        <div class="row mt-4">
            <p>Lista proveedor sin datos</p>
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
                        <th>Proveedor</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
<%
    for( Proveedor proveedor : proveedorList)
    {
%>
                <tbody>
                    <tr>
                        <td>
                            <%=proveedor.getIdProveedor()%>
                        </td>
                        <td>
                            <%=proveedor.getNomProveedor()%>
                        </td>
                        <td>
                            <a href="?action=delete&id=<%=proveedor.getIdProveedor()%>">
                                <button type="button" class="btn btn-outline-primary ">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </a>
                            <a href="?action=editar&id=<%=proveedor.getIdProveedor()%>">
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