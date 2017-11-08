<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Editar Categoria</title>
    <asset:stylesheet src="application.css"/>

</head>

<body class="bg-dark">
<div class="container">
    <div class="card card-register mx-auto mt-5">
        <div class="card-header">Editar Categoria</div>
        <div class="card-body">

            <div class="nav" role="navigation">
                <ul>
                    <li><a  href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link action="index"><g:message code="Listado departamentos" args="[entityName]" /></g:link></li>
                    <li><g:link action="create"><g:message code="Crear Departamento" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div id="show-departamento" class="content scaffold-show" role="main">
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <f:display bean="departamento" />
                <g:form resource="${this.departamento}" method="DELETE">
                    <fieldset class="buttons">
                        <g:link class="edit" action="edit" resource="${this.departamento}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </div>



        </div>
    </div>
</div>
<asset:javascript src="application.js"/>
</body>

</html>
