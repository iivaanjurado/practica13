package practica13

class BootStrap {

    def init = { servletContext ->

        def contabilidad = new Departamento(nombre: "contabilidad").save()
        def desarrollo = new Departamento(nombre: "desarrollo").save()
        def empleado = new Categoria(nombre: "empleado").save()
        def gerente = new Categoria(nombre: "gerente").save()
        def Isaac = new Contacto(nombre: "Isaac", apellido: "Perez", email: "isaacenmanuel28@gmail.com",
                telefono: "809-806-6470", direccion: "su casa", puestoTrabajo: "desarrollador junior",
                telefonoMovil: "829-715-8943", categoria: empleado ).save()
        def isaacDesarrollo = new DepartamentoContacto(contacto: Isaac, departamento: desarrollo);
    }
    def destroy = {
    }
}
