<%@page import="org.mavridis.dao.Marca"%>
<%@page import="org.mavridis.helper.MarcaHelper"%>
<%@page import="java.util.List"%>
<div class="row">
    <a href="?action=nuevo">
        <button type="button" class="btn btn-outline-primary" >Nuevo</button>
    </a>
    <br/><br/>
</div>
<%
    List<Marca>marcaList = null;
    marcaList = new MarcaHelper( ).getList( );
    if( marcaList == null || marcaList.size() == 0 )
    {
%>
        <div class="row mt-4">
            <p>Lista marca sin datos</p>
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
                        <th>Marca</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
<%
    for( Marca marca : marcaList)
    {
%>
                <tbody>
                    <tr>
                        <td>
                            <%=marca.getIdMarca()%>
                        </td>
                        <td>
                            <%=marca.getNomMarca()%>
                        </td>
                        <td>
                            <a href="?action=delete&id=<%=marca.getIdMarca()%>">
                                <button type="button" class="btn btn-outline-primary ">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </a>
                            <a href="?action=editar&id=<%=marca.getIdMarca()%>">
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