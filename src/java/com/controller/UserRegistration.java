/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.model.Users;
import com.dao.UserDAO;
import com.secure.CheckEmail;
import com.secure.Encrypt;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Umesh
 */
@WebServlet(name = "UserRegistration", urlPatterns = {"/userRegistration"})
public class UserRegistration extends HttpServlet {

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
        RequestDispatcher rd = request.getRequestDispatcher("user_register.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        Long phone = Long.parseLong(request.getParameter("phone"));
        Long pan = Long.parseLong(request.getParameter("phone"));
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String address = request.getParameter("address");
        Date dob = Date.valueOf(request.getParameter("dob"));
        if (password1.equals(password2)) {
            Users newuser = new Users(1, name, email, address, phone, pan, dob, encrypt.encryptPassword(password1));
            try {
                if (userDAO.insertUser(newuser)) {
//                    request.getSession(false).setAttribute("successMessage", "You are successfuly Registered. Please login with your registered account to continue.");
                    response.sendRedirect("login");
                } else {
//                    request.getSession(false).setAttribute("errorMessage", "Sorry! could not register at the moment.");
                    response.sendRedirect("userRegistration");
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserRegistration.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            response.sendRedirect("userRegistration");
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
