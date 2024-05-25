
import com.emergentes.dao.AvisoDAO;
import com.emergentes.dao.AvisoDAOimpl;
import com.emergentes.modelo.Aviso;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AvisoController", urlPatterns = {"/AvisoController"})
public class AvisoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AvisoDAO dao = new AvisoDAOimpl();

        Aviso avi = new Aviso();
        int id;

        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
        switch (action) {
            case "add":
                request.setAttribute("aviso", avi);
                request.getRequestDispatcher("registro.jsp").forward(request, response);
                break;
            case "edit":
                id = Integer.parseInt(request.getParameter("id"));
                try {
                    avi = dao.getById(id);
                } catch (Exception ex) {
                    System.out.println("Error al obtener registro " + ex.getMessage());
                }
                request.setAttribute("aviso", avi);
                request.getRequestDispatcher("registro.jsp").forward(request, response);
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                try {
                    dao.delete(id);
                    dao.renumerarIDs();  // Llamada para renumerar los IDs
                } catch (Exception ex) {
                    System.out.println("Error al eliminar: " + ex.getMessage());
                }
                response.sendRedirect("AvisoController");
                break;
            case "view":
                List<Aviso> lista = new ArrayList<Aviso>();
                try {
                    lista = dao.getAll();
                } catch (Exception ex) {
                    System.out.println("Error al listar " + ex.getMessage());
                }
                request.setAttribute("avisos", lista);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String fecha = request.getParameter("fecha");
        String titulo = request.getParameter("titulo");
        String contenido = request.getParameter("contenido");
        Aviso avi = new Aviso();

        avi.setId(id);
        avi.setFecha(fecha);
        avi.setTitulo(titulo);
        avi.setContenido(contenido);

        AvisoDAO dao = new AvisoDAOimpl();

        if (id == 0) {
            try {
                dao.insert(avi);
            } catch (Exception ex) {
                System.out.println("Error al insertar: " + ex.getMessage());
            }
        } else {
            try {
                dao.update(avi);
            } catch (Exception ex) {
                System.out.println("Error al editar: " + ex.getMessage());
            }
        }
        response.sendRedirect("AvisoController");
    }
}
