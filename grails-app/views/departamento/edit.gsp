<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Editar Departamento</title>
    <asset:stylesheet src="application.css"/>

</head>

<body class="bg-dark">
<div class="container">
    <div class="card card-register mx-auto mt-5">
        <div class="card-header">Editar Departamento</div>
        <div class="card-body">

            <div class="nav" role="navigation">
                <ul>
                    <li><a href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link  action="index"><g:message code="Listado Departamentos" args="[entityName]" /></g:link></li>
                    <li><g:link  action="create"><g:message code="Crear Departamento" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div id="edit-departamento" class="content scaffold-edit" role="main">
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.departamento}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.departamento}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <g:form resource="${this.departamento}" method="PUT">
                    <g:hiddenField name="version" value="${this.departamento?.version}" />
                    <fieldset class="form">

                        <div class="form-group">
                            <div class='fieldcontain required'>
                                <label for='nombre'>Nombre
                                    <span class='required-indicator'>*</span>
                                </label><input type="text" class="form-control" name="nombre" value="${departamento.nombre}" required="" id="nombre" />
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="buttons">
                        <input class="save form-control" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </fieldset>
                </g:form>
            </div>

        </div>
    </div>

</div>
<asset:javascript src="application.js"/>
</body>

</html>
