/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import capchar.ReCaptchar;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author 84348
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String US = "US";
    private static final String RS = "RS";
    private static final String ADMIN_PAGE = "MainController?action=Search&search=";
    private static final String USER_PAGE = "MainController?action=SearchProduct&searchProduct=";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            boolean verify = ReCaptchar.verify(gRecaptchaResponse);
            UserDAO dao = new UserDAO();
            UserDTO loginUser = dao.checkLogin(userID, password);
                if(verify){
                    
                    if (loginUser != null) {
                    HttpSession session = request.getSession();
                    String roleID = loginUser.getRoleID();
                    if (US.equals(roleID)) {
                        session.setAttribute("LOGIN_USER", loginUser);
                        url = ADMIN_PAGE;
                    } else if (RS.equals(roleID)) {
                        session.setAttribute("LOGIN_USER", loginUser);
                        url = USER_PAGE;
                    } else {
                        request.setAttribute("ERROR", "Your roleID not support!");
                    }
                } else {
                    request.setAttribute("ERROR", "Incorrect UserID or Password");
                }
                }else{
                    request.setAttribute("ERROR", "Click Recaptchaer please!!!");
                }
            

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
