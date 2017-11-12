






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
            <div id="chartContainer" style="height: 370px; width: 100%;"></div>
            </div>
    </div>
</div>
<asset:javascript src="application.js"/>
</body>

<g:javascript>
    $( document ).ready(function() {
       var datos = "${datos.encodeAsJson()}";
       var dps = [];
    $.each(JSON.parse(datos), function(k, v) {
dps.push({
			label: k,
			y: v
		});

     });


              var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	title: {
		text: "Contactos por Departamento"
	},
	data: [{
		type: "pie",
		startAngle: 240,
	    indexLabel: "{label} {y}",
		dataPoints: dps
	}]
});
chart.render();
    });

</g:javascript>

</html>

