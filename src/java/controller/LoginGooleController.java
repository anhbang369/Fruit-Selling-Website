/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import google.GooglePojo;
import google.GoogleUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import user.UserDAO;
import user.UserDTO;


/**
 *
 * @author 84348
 */
@WebServlet(name = "LoginGooleController", urlPatterns = {"/LoginGooleController"})
public class LoginGooleController extends HttpServlet {
    static final Logger LOGGER = Logger.getLogger(LoginGooleController.class);

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "menu.jsp";
    private static final long serialVersionUID = 1L;

    public LoginGooleController() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        String url = ERROR;
        if (code == null || code.isEmpty()) {
            url = ERROR;
        } else {
            try {
                HttpSession session = request.getSession();
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
                UserDAO dao = new UserDAO();
                UserDTO loginUser = dao.checkDuplicateGoogle(googlePojo.getEmail());
                if (loginUser == null) {
                    loginUser = new UserDTO();
                    loginUser.setEmail(googlePojo.getEmail());
                    loginUser.setUserID(googlePojo.getEmail());
                    loginUser.setRoleID("RS");
                    boolean check = dao.create(loginUser);
                    if (check) {
                        url = SUCCESS;
                        session.setAttribute("LOGIN_USER", loginUser);
                    }
                } else {
                    url = SUCCESS;
                    session.setAttribute("LOGIN_USER", loginUser);
                }
            } catch (Exception e) {
                LOGGER.error("Error at LoginGoogleController: " + e.toString());
            } finally {
                RequestDispatcher dis = request.getRequestDispatcher(url);
                dis.forward(request, response);
            }

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
