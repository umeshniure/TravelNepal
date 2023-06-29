/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.dao.UserDAO;
import com.model.Users;
import com.secure.CheckEmail;
import com.secure.Encrypt;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Umesh
 */
@WebServlet(name = "verifyLogin", urlPatterns = {"/login"})
public class verifyLogin extends HttpServlet {
    
    private Encrypt encrypt;
    private CheckEmail checkemail;
    private UserDAO userDAO;

    public void init() {
        encrypt = new Encrypt();
        checkemail = new CheckEmail();
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }

    public void passvalue(HttpServletRequest request, HttpServletResponse response, String _email, String message)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        request.setAttribute("message", message);
        request.setAttribute("email", _email);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String _email = request.getParameter("email");
        String _password = request.getParameter("password");
        String message;
        try {
            if (!_email.equals("") && !_password.equals("")) {
                Users user = userDAO.selectUserByEmailAndPassword(_email, encrypt.encryptPassword( _password));
                if (user != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("id", user.getId());
                    session.setAttribute("user_type", user.getUser_type());
                    switch (user.getUser_type()) {
                        case 1:
                            request.getSession(false).setAttribute("successMessage", "Hello " + user.getName()+ ", welcome back to BookStack!");
                            response.sendRedirect("home");
                            break;
                        case 2:
                            request.getSession(false).setAttribute("successMessage", "Welcome vendor! you are successfully logged in.");
                            response.sendRedirect("uploadPackage");
                            break;
                        case 3:
                            request.getSession(false).setAttribute("successMessage", "Hello admin! You are successfully logged in.");
                            response.sendRedirect("admin");
                            break;
                        default:
                            request.getSession(false).setAttribute("successMessage", "Hello " + user.getName() + ", welcome back to BookStack!");
                            response.sendRedirect("home");
                            break;
                    }
                } else {
                    message = "Incorect email or password!";
                    passvalue(request, response, _email, message);
                }
            } else {
                message = "Empty email or password!";
                passvalue(request, response, _email, message);
            }

        } catch (IOException | ServletException e) {
            System.out.println(e);
        }
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
