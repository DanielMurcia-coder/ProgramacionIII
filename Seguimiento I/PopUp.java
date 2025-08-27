import javax.swing.JOptionPane;

public class PopUp {

    /**
     * Método main de la clase
     * @param args argumentos de línea de comandos
     */
    public static void main(String[] args) {
        String mensaje = args.length > 0 ? args[0] : "Mensaje desde Elixir";
        mostrar_popup(mensaje);
    }

    /**
     * Muestra un mensaje en una ventana emergente
     * @param mensaje el mensaje a mostrar
     */
    public static void mostrar_popup(String mensaje) {
        JOptionPane.showMessageDialog(null, mensaje, "Mensaje", JOptionPane.INFORMATION_MESSAGE);
    }
}

