package practica13

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

import javax.xml.bind.SchemaOutputResolver

import static org.springframework.http.HttpStatus.*

class ContactoController {

    ContactoService contactoService
    CategoriaService categoriaService
    DepartamentoContactoService departamentoContactoService


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured('ROLE_ADMIN')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond contactoService.list(params), model:[contactoCount: contactoService.count()]
    }

    @Secured('ROLE_ADMIN')
    def show(Long id) {
        respond contactoService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def create() {
        def map = ['categorias': Categoria.findAll(), 'departamentos': Departamento.findAll()]
          respond map
    }

    @Secured('ROLE_ADMIN')
    def graficos(){

        def departamentos = Departamento.findAll()

        def map = [:]

        departamentos.each {

            map.put(it.nombre,  DepartamentoContacto.findAllByDepartamento(it).size() )
        }

        def mapa = ["datos": map]

        respond mapa

    }

    @Secured('ROLE_ADMIN')
    def seleccionar(){

        def map = ['departamentos': Departamento.findAll()]
        respond map
    }

    @Secured('ROLE_ADMIN')
    def buscar(){

        params.get("departamento")
        def depart = Departamento.findById(params.get("departamento"))


        def contactosDepartamento = DepartamentoContacto.findAllByDepartamento(depart)

       def map = ["contactos": contactosDepartamento]
        respond map

    }

    @Secured('ROLE_ADMIN')
    def save(Contacto contacto) {
        if (contacto == null) {
            notFound()
            return
        }

        try {
            contactoService.save(contacto)
        } catch (ValidationException e) {
            respond contacto.errors, view:'create.gsp'
            return
        }

        def lista = params.departamento.toList()

        for (String x: lista){

            println(x)
            def dep = Departamento.findById(Long.parseLong(x))
            DepartamentoContacto depcon = new DepartamentoContacto(contacto:contacto, departamento: dep).save()
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'contacto.label', default: 'Contacto'), contacto.id])
                redirect contacto
            }
            '*' { respond contacto, [status: CREATED] }
        }
    }

    @Secured('ROLE_ADMIN')
    def edit(Long id) {

        def con = contactoService.get(id)
        println(DepartamentoContacto.findAllByContacto(con) as JSON)

        def map = ['contacto': contactoService.get(id), 'categorias': Categoria.findAll(), 'departamentos': Departamento.findAll(), 'departamentosSeleccionados': DepartamentoContacto.findByContacto(con) as JSON ]
        respond map
    }


    @Secured('ROLE_ADMIN')
    def update(Contacto contacto) {
        if (contacto == null) {
            notFound()
            return
        }

        try {
            contactoService.save(contacto)
        } catch (ValidationException e) {
            respond contacto.errors, view:'edit'
            return
        }

        def lista = params.departamento.toList()

        def depcontacts = DepartamentoContacto.findAllByContacto(contacto);

        depcontacts.each {

            departamentoContactoService.delete(it.id)
        }
        for (String x: lista){

            println(x)
            def dep = Departamento.findById(Long.parseLong(x))
            DepartamentoContacto depcon = new DepartamentoContacto(contacto:contacto, departamento: dep).save()
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'contacto.label', default: 'Contacto'), contacto.id])
                redirect contacto
            }
            '*'{ respond contacto, [status: OK] }
        }
    }


    @Secured('ROLE_ADMIN')
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        contactoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'contacto.label', default: 'Contacto'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'contacto.label', default: 'Contacto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
