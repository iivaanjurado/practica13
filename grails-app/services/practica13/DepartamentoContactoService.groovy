package practica13

import grails.gorm.services.Service

@Service(DepartamentoContacto)
interface DepartamentoContactoService {

    DepartamentoContacto get(Serializable id)

    List<DepartamentoContacto> list(Map args)

    Long count()

    void delete(Serializable id)

    DepartamentoContacto save(DepartamentoContacto departamentoContacto)

}