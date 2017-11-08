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
    Date dateCreated
    Date lastUpdated


    static constraints = {
        email unique: true;
        telefonoMovil unique: true;
    }


    @Override
    public String toString() {
        return this.nombre + " " + this.apellido;
    }
}
