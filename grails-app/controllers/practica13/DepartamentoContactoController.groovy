package practica13

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class DepartamentoContactoController {



    DepartamentoContactoService departamentoContactoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond departamentoContactoService.list(params), model:[departamentoContactoCount: departamentoContactoService.count()]
    }

    def show(Long id) {
        respond departamentoContactoService.get(id)
    }

    def create() {
        respond new DepartamentoContacto(params)
    }

    def save(DepartamentoContacto departamentoContacto) {
        if (departamentoContacto == null) {
            notFound()
            return
        }

        try {
            departamentoContactoService.save(departamentoContacto)
        } catch (ValidationException e) {
            respond departamentoContacto.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'departamentoContacto.label', default: 'DepartamentoContacto'), departamentoContacto.id])
                redirect departamentoContacto
            }
            '*' { respond departamentoContacto, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond departamentoContactoService.get(id)
    }

    def update(DepartamentoContacto departamentoContacto) {
        if (departamentoContacto == null) {
            notFound()
            return
        }

        try {
            departamentoContactoService.save(departamentoContacto)
        } catch (ValidationException e) {
            respond departamentoContacto.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'departamentoContacto.label', default: 'DepartamentoContacto'), departamentoContacto.id])
                redirect departamentoContacto
            }
            '*'{ respond departamentoContacto, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        departamentoContactoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'departamentoContacto.label', default: 'DepartamentoContacto'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamentoContacto.label', default: 'DepartamentoContacto'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
