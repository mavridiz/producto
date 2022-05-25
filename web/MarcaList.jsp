<%@page import="org.mavridis.helper.MarcaHelper"%>
<%@page import="org.mavridis.dao.Marca"%> 
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Marca List</title>
    </head>
    
        <div class="container-fluid p-5 bg-primary text-white text-center">
            Lista marca
        </div>
        <div class="container mt-4"> 
            <%
                if( request == null )
                {
                    return;
                }
                String action = request.getParameter( "action" );
                if( action == null )
                {
                    action = "";
                }
                switch( action )
                {
                    case "nuevo":
                        
                    case "editar":
            %>
                    <jsp:include page="MarcaForm.jsp" />
            <%
                        break;
                    case "send":
                        if( new MarcaHelper( ).addMarca(request) )
                        {
                            response.sendRedirect("MarcaList.jsp");
                        }
                        break;
                    case "delete":
                        if( new MarcaHelper( ).deleteMarca(request) )
                        {
                            response.sendRedirect("MarcaList.jsp");
                        }
                        break;
                    case "actualizar":
                        if( new MarcaHelper( ).updateMarca(request) )
                        {
                            response.sendRedirect("MarcaList.jsp");
                        }
                        break;
                    default:
            %>
                        <jsp:include page="MarcaTable.jsp" />
            <%
                }
            %>
        
        </div>
</html>
