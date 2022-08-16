/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.UserDTO;

/**
 *
 * @author 84348
 */
@WebServlet(name = "SendMailController", urlPatterns = {"/SendMailController"})
public class SendMailController extends HttpServlet {

    private static final String ERROR = "kk.jsp";
    private static final String SUCCESS = "MainController?action=SearchProduct&searchProduct=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String url = ERROR;
            try {
                HttpSession session = request.getSession();

                final String fromEmail = "bangdase150648@fpt.edu.vn";
                // Mat khai email cua ban
                final String password = "Anhbangse12345#";
                // dia chi email nguoi nhan
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                final String toEmail = loginUser.getEmail();
                final String subject = "Xac nhan don hang";
                String body
                        = "<h1>Don hang cua ban da duoc chap nhan: </h1>"
                        + "<p> Cam on ban da su dung dich vu cua chung toi.</p>";

                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
                props.put("mail.smtp.port", "587"); //TLS Port
                props.put("mail.smtp.auth", "true"); //enable authentication
                props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
                Authenticator auth = new Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(fromEmail, password);
                    }
                };
                Session sessionV2 = Session.getInstance(props, auth);
                MimeMessage msg = new MimeMessage(sessionV2);
                try {
                    //set message headers
                    msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
                } catch (MessagingException ex) {
                    Logger.getLogger(SendMailController.class.getName()).log(Level.SEVERE, null, ex);
                }
                try {
                    msg.addHeader("format", "flowed");
                } catch (MessagingException ex) {
                    Logger.getLogger(SendMailController.class.getName()).log(Level.SEVERE, null, ex);
                }
                msg.addHeader("Content-Transfer-Encoding", "8bit");
                msg.setFrom(new InternetAddress(fromEmail, "NoReply-JD"));
                msg.setReplyTo(InternetAddress.parse(fromEmail, false));
                msg.setSubject(subject, "HTML Message");
                msg.setContent(body, "text/html");
                msg.setSentDate(new Date());
                msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
                Transport.send(msg);

                session.removeAttribute("CART");
                session.removeAttribute("NUMBER_PRODUCT");
                url = SUCCESS;
            } catch (MessagingException ex) {
                Logger.getLogger(SendMailController.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
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
