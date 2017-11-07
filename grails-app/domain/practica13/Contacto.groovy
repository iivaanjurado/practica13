package practica13

class Contacto {
    String nombre;
    String apellido;
    String email;
    String telefono;
    String direccion
    String puestoTrabajo;
    String telefonoMovil;
    Categoria categoria;


    static constraints = {
        email unique: true;
        telefonoMovil unique: true;
    }
}
