<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Categorias</title>
    <asset:stylesheet src="application.css"/>
</head>

<body class="bg-dark">
<!-- Navigation-->



<!-- Breadcrumbs-->
<ol class="breadcrumb">
    <li class="breadcrumb-item">
        Categorias
    </li>

</ol>
<!-- Example DataTables Card-->
<div class="card mb-3">
    <div class="card-header">
        <i class="fa fa-table"></i> Categorias</div>
    <div class="card-body">
        <div class="table-responsive">
            <div class="nav" role="navigation">
                <ul>
                    <li><a  href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link  action="create"><g:message code="Nueva Categoria" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div id="list-categoria" class="content scaffold-list" role="main">

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <f:table collection="${categoriaList}" />

                <div class="pagination">
                    <g:paginate total="${categoriaCount ?: 0}" />
                </div>
            </div>

        </div>
    </div>
</div>

<!-- /.container-fluid-->
<!-- /.content-wrapper-->

<asset:javascript src="application.js"/>
</body>

</html>
