package controlador;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Persona;
import modelo.PersonaDAO;


public class Controlador extends HttpServlet {
    PersonaDAO dao=new PersonaDAO();
    Persona p = new Persona();
    int r;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");
        String message_error = "Correo u/o contraseña incorrectos.";
        
        if(accion.equals("Ingresar")){
            String correo= request.getParameter("txtcorreo");
            String contraseña= request.getParameter("txtcontraseña");
            
            p.setCorreo_usuario(correo);
            p.setContraseña_usuario(contraseña);
            r = dao.Validar(p);
            HttpSession session=request.getSession();
            session.setAttribute("correo_e", correo);
           
            
            if(r==1){
                
                request.getSession().setAttribute("correo", correo);
                session.setAttribute("persona", p);
                
                response.sendRedirect("Cliente/Cliente.jsp");                
            }else{
                request.getSession().setAttribute("message_e", message_error);
                response.sendRedirect("Cliente/Inicio_Sesion_Cliente.jsp");                
            }
        }
        
       if(accion.equals("cerrar")){
            HttpSession session = request.getSession();
            session.removeAttribute("persona");
            response.sendRedirect("Cliente/Inicio_Sesion_Cliente.jsp");    
        }
       
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
