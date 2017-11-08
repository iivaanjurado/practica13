<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Editar Contacto</title>
    <asset:stylesheet src="application.css"/>

</head>

<body class="bg-dark">
<div class="container">
    <div class="card card-register mx-auto mt-5">
        <div class="card-header">Editar Contacto</div>
        <div class="card-body">

            <div class="nav" role="navigation">
                <ul>
                    <li><a  href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                    <li><g:link  action="index"><g:message code="Lista De Contactos" args="[entityName]" /></g:link></li>
                    <li><g:link  action="create"><g:message code="Crear Contacto" args="[entityName]" /></g:link></li>
                </ul>
            </div>
            <div id="edit-contacto" class="content scaffold-edit" role="main">
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.contacto}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${this.contacto}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <g:form resource="${this.contacto}" method="PUT">
                    <g:hiddenField name="version" value="${this.contacto?.version}" />
                    <fieldset class="form">

                        <div class="form-group">
                        <div class='fieldcontain required'>
                            <label for='email'>Email
                                <span class='required-indicator'>*</span>
                            </label><input type="text" class="form-control" name="email" value="" required="" id="email" />
                        </div>
                        </div>

                        <div class="form-group">
                            <div class='fieldcontain required'>
                        <label for='telefonoMovil'>Telefono Movil
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="telefonoMovil" class="form-control" value="" required="" id="telefonoMovil" />
                    </div>
                        </div>

                        <div class="form-group">
                            <div class='fieldcontain required'>
                        <label for='puestoTrabajo'>Puesto Trabajo
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="puestoTrabajo" class="form-control" value="" required="" id="puestoTrabajo" />
                    </div>
                        </div>

                        <div class="form-group">
                            <div class='fieldcontain required'>
                        <label for='categoria'>Categoria
                            <span class='required-indicator'>*</span>
                        </label><select name="categoria.id" class="form-control" required="" id="categoria" >

                        </select>
                    </div>
                        </div>

                        <div class="form-group">
                            <div class='fieldcontain required'>
                        <label for='telefono'>Telefono
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="telefono" class="form-control" value="" required="" id="telefono" />
                    </div>
                        </div>

                        <div class="form-group">
                            <div class='fieldcontain required'>
                        <label for='apellido'>Apellido
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="apellido"  class="form-control" value="" required="" id="apellido" />
                    </div>
                        </div>


                        <div class="form-group">
                            <div class='fieldcontain required'>
                        <label for='nombre'>Nombre
                            <span class='required-indicator'>*</span>
                        </label><input type="text" class="form-control" name="nombre" value="" required="" id="nombre" />
                    </div>
                        </div>


                        <div class="form-group">
                            <div class='fieldcontain required'>
                        <label for='direccion'>Direccion
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="direccion" class="form-control" value="" required="" id="direccion" />
                    </div>
                        </div>

                    </fieldset>
                    <div class="form-group">
                    <fieldset class="buttons">
                        <input class="save form-control" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    </fieldset>
                    </div>
                </g:form>
            </div>



        </div>
    </div>
</div>
<asset:javascript src="application.js"/>
</body>

</html>
