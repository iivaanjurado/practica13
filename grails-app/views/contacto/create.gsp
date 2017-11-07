<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Crear Contacto</title>
    <asset:stylesheet src="application.css"/>

</head>

<body class="bg-dark">
<div class="container">
    <div class="card card-register mx-auto mt-5">
        <div class="card-header">Crear Contacto</div>
        <div class="card-body">

                <div class="nav" role="navigation">
                    <ul >
                        <li ><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        <li ><g:link class="list" action="index"><g:message code="Lista Contactos" args="[entityName]" /> </g:link></li>
                    </ul>
                </div>
                <div id="create-contacto" class="content scaffold-create" role="main">
                    <h1>Crear Contacto</h1>
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
                    <g:form resource="${this.contacto}" method="POST">



                        <div class='fieldcontain required'>
                            <div class="form-group">
                                <label for='email'>Email
                                    <span class='required-indicator'>*</span>
                                </label><input type="text" name="email" class="form-control" value="" required="" id="email" />
                            </div>
                        </div>

                        <div class='fieldcontain required'>
                            <div class="form-group">
                                <label for='telefonoMovil'>Telefono Movil
                                    <span class='required-indicator'>*</span>
                                </label><input type="text" name="telefonoMovil" class="form-control" value="" required="" id="telefonoMovil" />
                            </div>
                        </div>

                        <div class='fieldcontain required'>
                            <div class="form-group">
                                <label for='puestoTrabajo'>Puesto Trabajo
                                    <span class='required-indicator'>*</span>
                                </label><input type="text" name="puestoTrabajo" class="form-control" value="" required="" id="puestoTrabajo" />
                            </div>
                        </div>

                        <div class='fieldcontain required'>
                            <div class="form-group">
                                <label for='categoria'>Categoria
                                    <span class='required-indicator'>*</span>
                                </label><select name="categoria.id"  class="form-control" required="" id="categoria" >
                            </select>
                            </div>
                        </div>

                        <div class='fieldcontain required'>
                            <div class="form-group">
                                <label for='telefono'>Telefono
                                    <span class='required-indicator'>*</span>
                                </label><input type="text" name="telefono" class="form-control" value="" required="" id="telefono" />
                            </div>
                        </div>

                        <div class='fieldcontain required'>
                            <div class="form-group">
                                <label for='apellido'>Apellido
                                    <span class='required-indicator'>*</span>
                                </label><input type="text" name="apellido" value="" class="form-control" required="" id="apellido" />
                            </div>
                        </div>

                        <div class='fieldcontain required'>
                            <div class="form-group">
                                <label for='nombre'>Nombre
                                    <span class='required-indicator'>*</span>
                                </label><input type="text" name="nombre" value="" class="form-control" required="" id="nombre" />
                            </div>
                        </div>

                        <div class='fieldcontain required'>
                            <div class="form-group">
                                <label for='direccion'>Direccion
                                    <span class='required-indicator'>*</span>
                                </label><input type="text" name="direccion" value="" class="form-control" required="" id="direccion" />
                            </div>
                        </div>

                        <fieldset class="buttons">
                            <div class="form-group">
                                <g:submitButton name="create"  class="save form-control" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                            </div>
                        </fieldset>
                    </g:form>
                </div>


            <div class="text-center">
                <a class="d-block small mt-3" href="#">Login Page</a>
                <a class="d-block small" href="#">Forgot Password?</a>
            </div>
        </div>
    </div>
</div>
<asset:javascript src="application.js"/>
</body>

</html>
