/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import cart.CartDTO;
import cart.ViewCart;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.UserDAO;
import user.UserOrderDetail;

/**
 *
 * @author 84348
 */
@WebServlet(name = "InsertOrderDetailController", urlPatterns = {"/InsertOrderDetailController"})
public class InsertOrderDetailController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "MainController?action=SendMail";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            boolean create = false;
            HttpSession session = request.getSession();
            ViewCart cart = (ViewCart) session.getAttribute("CART");
            if (cart != null) {
                if (cart.getCart().size() > 0) {
                    for (CartDTO tm : cart.getCart().values()) {
                        UserDAO dao = new UserDAO();
                        double price = tm.getPrice();
                        double quantity = tm.getQuantityUser();
                        int orderID = dao.getOrderId();
                        String product = tm.getProductID();
                        UserOrderDetail detail = new UserOrderDetail(price, quantity, orderID, product);
                        create = dao.createOrderDetail(detail);

                    }
                }
                if (create == true) {
                    if (session != null) {
                        if (cart != null) {
                            session.removeAttribute("CART");
                            url = SUCCESS;

                        }
                    }
                }
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
