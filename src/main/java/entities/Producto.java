
package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Producto.findAll", query = "SELECT p FROM Producto p"),
    @NamedQuery(name = "Producto.findById", query = "SELECT p FROM Producto p WHERE p.id = :id"),
    @NamedQuery(name = "Producto.findByModelo", query = "SELECT p FROM Producto p WHERE p.modelo = :modelo"),
    @NamedQuery(name = "Producto.findByMarca", query = "SELECT p FROM Producto p WHERE p.marca = :marca"),
    @NamedQuery(name = "Producto.findByPrecio", query = "SELECT p FROM Producto p WHERE p.precio = :precio"),
    @NamedQuery(name = "Producto.findByCantidadInv", query = "SELECT p FROM Producto p WHERE p.cantidadInv = :cantidadInv"),
    @NamedQuery(name = "Producto.findByMesesGarantia", query = "SELECT p FROM Producto p WHERE p.mesesGarantia = :mesesGarantia"),
    @NamedQuery(name = "Producto.findByFechaPublicacion", query = "SELECT p FROM Producto p WHERE p.fechaPublicacion = :fechaPublicacion")})
public class Producto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    private String modelo;
    @Lob
    private byte[] imagen;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    private String marca;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 16777215)
    private String descripcion;
    @Basic(optional = false)
    @NotNull
    private double precio;
    @Basic(optional = false)
    @NotNull
    private int cantidadInv;
    @Basic(optional = false)
    @NotNull
    private int mesesGarantia;
    @Basic(optional = false)
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaPublicacion;
    @JoinColumn(name = "tipoProducto", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Tipoproducto tipoProducto;

    public Producto() {
    }

    public Producto(Integer id) {
        this.id = id;
    }

    public Producto(String modelo, byte[] imagen, String marca, String descripcion, double precio, int cantidadInv, int mesesGarantia, Date fechaPublicacion, Tipoproducto tipoProducto) {
        this.modelo = modelo;
        this.imagen = imagen;
        this.marca = marca;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidadInv = cantidadInv;
        this.mesesGarantia = mesesGarantia;
        this.fechaPublicacion = fechaPublicacion;
        this.tipoProducto = tipoProducto;
    }

    public Producto(String modelo, String marca, String descripcion, double precio, int cantidadInv, int mesesGarantia, Date fechaPublicacion, Tipoproducto tipoProducto) {
        this.modelo = modelo;
        this.marca = marca;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidadInv = cantidadInv;
        this.mesesGarantia = mesesGarantia;
        this.fechaPublicacion = fechaPublicacion;
        this.tipoProducto = tipoProducto;
    }
    
    public Producto(Integer id, String modelo, byte[] imagen, String marca, String descripcion, double precio, int cantidadInv, int mesesGarantia, Date fechaPublicacion, Tipoproducto tipoProducto) {
        this.id = id;
        this.modelo = modelo;
        this.imagen = imagen;
        this.marca = marca;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidadInv = cantidadInv;
        this.mesesGarantia = mesesGarantia;
        this.fechaPublicacion = fechaPublicacion;
        this.tipoProducto = tipoProducto;
    }

    public Producto(Integer id, String modelo, String marca, String descripcion, double precio, int cantidadInv, int mesesGarantia, Date fechaPublicacion, Tipoproducto tipoProducto) {
        this.id = id;
        this.modelo = modelo;
        this.marca = marca;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidadInv = cantidadInv;
        this.mesesGarantia = mesesGarantia;
        this.fechaPublicacion = fechaPublicacion;
        this.tipoProducto = tipoProducto;
    }
   
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantidadInv() {
        return cantidadInv;
    }

    public void setCantidadInv(int cantidadInv) {
        this.cantidadInv = cantidadInv;
    }

    public int getMesesGarantia() {
        return mesesGarantia;
    }

    public void setMesesGarantia(int mesesGarantia) {
        this.mesesGarantia = mesesGarantia;
    }

    public Date getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(Date fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }

    public Tipoproducto getTipoProducto() {
        return tipoProducto;
    }

    public void setTipoProducto(Tipoproducto tipoProducto) {
        this.tipoProducto = tipoProducto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Producto)) {
            return false;
        }
        Producto other = (Producto) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Producto[ id=" + id + " ]";
    }
    
}
