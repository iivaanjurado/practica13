<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Contactos por categoria</title>
    <asset:stylesheet src="application.css"/>

</head>

<body class="bg-dark">
<div class="container">
    <div class="card card-register mx-auto mt-5">
        <div class="card-header">Seleccionar Categoria</div>
        <div class="card-body">



            <g:form controller="contacto" action="buscar" method="POST">
            <div class='fieldcontain required'>
                <div class="form-group">
                    <label for='categoria'>Departamento
                        <span class='required-indicator'>*</span>
                    </label>
                    <select name="departamento"  class="form-control" required="" id="departamento" >
                        <g:each in ="${departamentos}" var = "x">

                            <option value="${x.id}">${x.nombre}</option>
                        </g:each>

                    </select>
                </div>
            </div>


            <fieldset class="buttons">
                <div class="form-group">
                    <g:submitButton name="Buscar"  class="form-control" value="Buscar" />
                </div>
            </fieldset>
            </g:form>


        </div>
    </div>
</div>
<asset:javascript src="application.js"/>
</body>

</html>
