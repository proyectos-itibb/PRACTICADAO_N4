package com.emergentes.controlador;

import com.emergentes.dao.AvisoDAO;
import com.emergentes.dao.AvisoDAOimpl;
import com.emergentes.modelo.Aviso;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="Inicio", urlPatterns={"/Inicio"})
public class Inicio extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            AvisoDAO dao = new AvisoDAOimpl();
            int id;
            Aviso avi = new Aviso();
            
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            
            switch(action){
                case "view":
                    List<Aviso> lista = dao.getAll();
                    request.setAttribute("avisos", lista);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
                default:
                    break;
            }
        } catch (Exception ex) {
            Logger.getLogger(Inicio.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 
}
