/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.users.UserDAO;
import sample.users.UserDTO;

/**
 *
 * @author tranthihongphuc
 */
public class LoginController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String ADMIN_PAGE = "admin.jsp";
    private static final String USER_PAGE = "user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            UserDTO user = dao.checklogin(userID, password);

            HttpSession session = request.getSession();
            if (user != null) {
                session.setAttribute("LOGIN_USER", user);
                session.setAttribute("email", "testemail");
                String roleID = user.getRoleID();
                if ("AD".equals(roleID)) {
                    url = ADMIN_PAGE;
                
                    Cookie userIDCookie = new Cookie("userID", userID);
                    userIDCookie.setMaxAge(120); 
                    response.addCookie(userIDCookie);
                    
                   
                    Cookie passwordCookie = new Cookie("pwd", password);
                    passwordCookie.setMaxAge(120); 
                    response.addCookie(passwordCookie);
                } else if ("US".equals(roleID)) {
                    url = USER_PAGE;
                    
                    Cookie userIDCookie = new Cookie("userID", userID);
                    userIDCookie.setMaxAge(120); 
                    response.addCookie(userIDCookie);
                    
                    
                    Cookie passwordCookie = new Cookie("pwd", password);
                    passwordCookie.setMaxAge(120); 
                    response.addCookie(passwordCookie);
                } else {
                    session.setAttribute("ERROR_MESSAGE", "Your role is not supported.");
                }
            } else {
                session.setAttribute("ERROR_LOGIN", "Incorrect UserID or Password");
            }
        } catch (Exception e) {
            log("Error at LoginController" + e.toString());
        } finally {
            response.sendRedirect(url);
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
