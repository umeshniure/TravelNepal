/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.dao.BookingDAO;
import com.dao.CategoriesDAO;
import com.dao.PackagesDAO;
import com.dao.UserDAO;
import com.model.Category;
import com.model.Packages;
import com.model.Users;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Subin
 */
public class PackageController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
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
        doPost(request,response);
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
        String page = request.getParameter("page");
        if (page.equalsIgnoreCase("listPackage")){
            List<Packages> packageList = new PackagesDAO().getPackageList();
            request.setAttribute("packages", packageList);
            RequestDispatcher rd=  request.getRequestDispatcher("PackageList.jsp");
            rd.include(request, response);
        }
        if (page.equalsIgnoreCase("getPackage")){
            Packages packag = new PackagesDAO().getPackage(Integer.parseInt(request.getParameter("get")));
            request.setAttribute("packag", packag);
            String category = new CategoriesDAO().getCategory(packag.getCategory());
            request.setAttribute("category", category);
            RequestDispatcher rd=  request.getRequestDispatcher("package.jsp");
            rd.include(request, response);
        }
        if (page.equalsIgnoreCase("editPackage")){
            Packages packag = new PackagesDAO().getPackage(Integer.parseInt(request.getParameter("get")));
            request.setAttribute("packag", packag);
            List<Category> cat = new CategoriesDAO().selectAllCategory();
            request.setAttribute("categories", cat);
            RequestDispatcher rd=  request.getRequestDispatcher("editPackage.jsp");
            rd.include(request, response);
        }
        if (page.equalsIgnoreCase("deletePackage")){
            HttpSession session = request.getSession(false);
            if (session != null) {
                if (session.getAttribute("user_type") != null) {
                    if ((int) session.getAttribute("user_type") == 2) {
                        int packageId = Integer.parseInt(request.getParameter("on"));
                        PackagesDAO packages = new PackagesDAO();
                        boolean deleteSuccessful = packages.deletePackage(packageId);
                        if (deleteSuccessful) {
                            String confirmationMessage = "Deletion successful!.";
                            request.setAttribute("confirmationMessage", confirmationMessage);
                        } else {
                            String errorMessage = "Deletion failed! Please try again.";
                            request.setAttribute("errorMessage", errorMessage);
                        }
                        RequestDispatcher rd=  request.getRequestDispatcher("packages?page=listPackage");
                        rd.include(request, response);
                    }
                }
            }
        }
        if(page.equalsIgnoreCase("editPackages")){
            HttpSession session = request.getSession(false);
            if (session != null) {
                if (session.getAttribute("user_type") != null) {
                    if ((int) session.getAttribute("user_type") == 2) {
                        String title = request.getParameter("title");
                        int packageId = Integer.parseInt(request.getParameter("packageId"));
                        double price = Double.parseDouble(request.getParameter("price"));
                        int duration = Integer.parseInt(request.getParameter("duration"));
                        int people = Integer.parseInt(request.getParameter("people"));
                        int category = Integer.parseInt(request.getParameter("category"));

                        String description = request.getParameter("description");
                        String location = request.getParameter("location");

                        int agencyid = (int) session.getAttribute("id");
                        String fileName = request.getParameter("picture");
                        java.sql.Date updated_date = new java.sql.Date(System.currentTimeMillis());
                        Packages newPackage = new Packages(title, category, description, location, people, duration, price, agencyid, fileName, updated_date);
                        PackagesDAO packageDAO = new PackagesDAO();
                        if (packageDAO.updatePackage(packageId, newPackage)) {
                            String confirmationMessage = "Change sucessful!";
                            request.setAttribute("confirmationMessage", confirmationMessage);
                        } else {
                            String errorMessage = "Change failed! Please try again.";
                            request.setAttribute("errorMessage", errorMessage);
                        }
                        RequestDispatcher rd=  request.getRequestDispatcher("packages?page=getPackage&get="+packageId);
                        rd.include(request, response);

                    } else {
                        request.getSession(false).setAttribute("errorMessage", "Sorry, You are not allowed to access this page.");
                        response.sendRedirect("home");
                    }
                } else {
                    request.getSession(false).setAttribute("errorMessage", "Ohh! looks like you are not logged in yet. Please login first.");
                    response.sendRedirect("login");
                }
            }
        }
        if (page.equalsIgnoreCase("bookPackage")){
            HttpSession session = request.getSession(false);
            if (session != null) {
                if (session.getAttribute("user_type") != null) {
                    int packageId = Integer.parseInt(request.getParameter("packageId"));
                    Users customer  = new UserDAO().getUser(Integer.parseInt(session.getAttribute("id").toString()));
                    String customerName = customer.getName();
                    String customerEmail = customer.getEmail();
                    Date bookingDate = new Date(); // Use current date or retrieve from the form
                    int numberOfPeople = Integer.parseInt(request.getParameter("numberOfPeople"));

                    // Perform booking logic
                    BookingDAO bookingService = new BookingDAO();
                    boolean bookingSuccessful = bookingService.makeBooking(packageId, customerName, customerEmail, bookingDate, numberOfPeople);
                    if (bookingSuccessful) {
                        String confirmationMessage = "Booking successful! Your booking has been confirmed.";
                        request.setAttribute("confirmationMessage", confirmationMessage);
                    } else {
                        String errorMessage = "Booking failed! Please try again.";
                        request.setAttribute("errorMessage", errorMessage);
                    }
                    RequestDispatcher rd=  request.getRequestDispatcher("packages?page=getPackage&get="+packageId);
                    rd.include(request, response);
                }
            }
            
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
