package practica13

class Categoria {

    String nombre;

    Date dateCreated
    Date lastUpdated
    static constraints = {
        nombre unique: true
    }


    @Override
    public String toString() {
        return this.nombre;
    }
}
