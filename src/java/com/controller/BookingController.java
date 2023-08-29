/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.dao.BookingDAO;
import com.dao.CategoriesDAO;
import com.dao.PackagesDAO;
import com.dao.UserDAO;
import com.model.Booking;
import com.model.Packages;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Subin
 */
@WebServlet(name = "BookingController", urlPatterns = {"/bookings"})
public class BookingController extends HttpServlet {

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
        if(page.equalsIgnoreCase("view")){
            HttpSession session = request.getSession(false);
            if (session != null) {
                if (session.getAttribute("user_type") != null) {
                    int userType = (int) session.getAttribute("user_type");
                    int userId = (int) session.getAttribute("id");

                    if (userType == 1) {
                        List<Booking> userBookings = new BookingDAO().findBookingsByEmail(new UserDAO().getUser(userId).getEmail());
                        request.setAttribute("userBookings", userBookings);
                        List<Packages> packageList = new PackagesDAO().getPackageList();
                        request.setAttribute("packages", packageList);
                        request.setAttribute("userType", userType);
                    } else if (userType == 2) {
                        List<Booking> vendorBookings = new BookingDAO().findBookingsByPackage(userId);
                        request.setAttribute("userType", userType);
                        request.setAttribute("vendorBookings", vendorBookings);
                    }

                    RequestDispatcher dispatcher = request.getRequestDispatcher("viewBooking.jsp");
                    dispatcher.forward(request, response);
                }else{
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                }
            }else{
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }
        }
        if(page.equalsIgnoreCase("detail")){
            HttpSession session = request.getSession(false);
            if (session != null) {
                if (session.getAttribute("user_type") != null) {
                    int booking = Integer.parseInt(request.getParameter("get"));
                    Booking b = new BookingDAO().findBookingsById(booking);
                    Packages p = new PackagesDAO().getPackage(b.getPackageId());
                    String category = new CategoriesDAO().getCategory(p.getCategory());
                    request.setAttribute("categoy", category);
                    request.setAttribute("packags", p);
                    request.setAttribute("booking", b);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("bookingDetail.jsp");
                    dispatcher.forward(request, response);
                }else{
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                }
            }else{
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }
        }
        if(page.equalsIgnoreCase("delete")){
            HttpSession session = request.getSession(false);
            if (session != null) {
                if (session.getAttribute("user_type") != null) {
                    int booking = Integer.parseInt(request.getParameter("get"));
                    BookingDAO bookings = new BookingDAO();
                    boolean deleteSuccessful = bookings.deleteBooking(booking);
                    if (deleteSuccessful) {
                        String confirmationMessage = "Deletion successful!.";
                        request.setAttribute("confirmationMessage", confirmationMessage);
                    } else {
                        String errorMessage = "Deletion failed! Please try again.";
                        request.setAttribute("errorMessage", errorMessage);
                    }
                    RequestDispatcher dispatcher = request.getRequestDispatcher("bookings?page=view");
                    dispatcher.forward(request, response);
                }else{
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                }
            }else{
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
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
