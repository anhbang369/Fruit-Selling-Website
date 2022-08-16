/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 84348
 */
public class MainController extends HttpServlet {

    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String ERROR = "error.jsp";
    private static final String SEARCH_PRODUCT_ADMIN = "Search";
    private static final String SEARCH_PRODUCT_ADMIN_CONTROLLER = "SearchProductAdminController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String INSERT_PRODUCT = "Insert";
    private static final String INSERT_PRODUCT_CONTROLLER = "InsertProductController";
    private static final String UPDATE_PRODUCT = "UpdateProduct";
    private static final String UPDATE_PRODUCT_CONTROLLER = "UpdateProductController";
    private static final String DELETE_PRODUCT = "Delete Product";
    private static final String DELETE_PRODUCT_CONTROLLER = "DeleteProductController";
    private static final String SEARCH_PRODUCT_USER = "SearchProduct";
    private static final String SEARCH_PRODUCT_USER_CONTROLLER = "SearchProductUserController";
    private static final String ADD_CART = "AddCart";
    private static final String ADD_CART_CONTROLLER = "AddCartController";
    private static final String INSERT_ORDER = "Checkout";
    private static final String INSERT_ORDER_CONTROLLER = "InsertOrderController";
    private static final String INSERT_ORDER_DETAIL = "InsertOrderDetail";
    private static final String INSERT_ORDER_DETAIL_CONTROLLER = "InsertOrderDetailController";
    private static final String SEND_EMAIL = "SendMail";
    private static final String SEND_EMAIL_CONTROLLER = "SendMailController";
    private static final String UPDATE_CART = "Update";
    private static final String UPDATE_CART_CONTROLLER = "UpdateCartController";
    private static final String DELETE_CART = "Delete";
    private static final String DELETE_CART_CONTROLLER = "DeleteCartController";
    private static final String LOGIN_GG = "LoginGoole";
    private static final String LOGIN_GG_CONTROLLER = "LoginGooleController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String url = ERROR;
        try{
            String action = request.getParameter("action");
            if(LOGIN.equals(action)){
                url = LOGIN_CONTROLLER;
            }else if(SEARCH_PRODUCT_ADMIN.equals(action)){
                url = SEARCH_PRODUCT_ADMIN_CONTROLLER;
            }else if(LOGOUT.equals(action)){
                url = LOGOUT_CONTROLLER;
            }else if(INSERT_PRODUCT.equals(action)){
                url = INSERT_PRODUCT_CONTROLLER;
            }else if(UPDATE_PRODUCT.equals(action)){
                url = UPDATE_PRODUCT_CONTROLLER;
            }else if(DELETE_PRODUCT.equals(action)){
                url = DELETE_PRODUCT_CONTROLLER;
            }else if(SEARCH_PRODUCT_USER.equals(action)){
                url = SEARCH_PRODUCT_USER_CONTROLLER;
            }else if(ADD_CART.equals(action)){
                url = ADD_CART_CONTROLLER;
            }else if(INSERT_ORDER.equals(action)){
                url = INSERT_ORDER_CONTROLLER;
            }else if(INSERT_ORDER_DETAIL.equals(action)){
                url = INSERT_ORDER_DETAIL_CONTROLLER;
            }else if(SEND_EMAIL.equals(action)){
                url = SEND_EMAIL_CONTROLLER;
            }else if(UPDATE_CART.equals(action)){
                url = UPDATE_CART_CONTROLLER;
            }else if(DELETE_CART.equals(action)){
                url = DELETE_CART_CONTROLLER;
            }else if(LOGIN_GG.equals(action)){
                url = LOGIN_GG_CONTROLLER;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
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
