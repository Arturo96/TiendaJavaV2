
package test;

import java.util.*;

public class Test {


    public static void main(String[] args) {
        
        Map<String, String> errores = new HashMap();
        
        errores.put("modelo", "Debes ingresar el modelo");
        errores.put("marca", "Debes ingresar la marca");
        errores.put("precio", "Debes ingresar el precio");
        
//        if(errores.containsKey("modelo")) {
//            System.out.println("Error: " + errores.get("modelo"));
//        } else {
//            System.out.println("No hay error de Modelo");
//        }

        System.out.println("TIPOS DE ERRORES POSIBLES \n");
        
        errores.keySet().forEach((error) -> {
            System.out.println("Tipo de error: " + error);
        });
        
        System.out.println("");
        
        errores.values().forEach(error -> System.out.println("Valor: " + error));
        
    }
    
}
