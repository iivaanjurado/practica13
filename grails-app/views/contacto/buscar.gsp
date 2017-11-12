<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Contactos por Departamento</title>
    <asset:stylesheet src="application.css"/>

</head>

<body class="bg-dark">
<div class="container">
    <div class="card card-register mx-auto mt-5">
        <div class="card-header">Contactos por Departamento</div>
        <div class="card-body">

        <ul>
            <g:each in ="${contactos}" var = "x">

                <li>${x.contacto}</li>
            </g:each>

        </ul>

        </div>
    </div>
</div>
<asset:javascript src="application.js"/>
</body>

</html>
