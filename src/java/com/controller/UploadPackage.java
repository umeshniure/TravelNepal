/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.dao.CategoriesDAO;
import com.dao.PackagesDAO;
import com.model.Category;
import com.model.Packages;
import java.io.File;
import java.sql.Date;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 *
 * @author Umesh
 */
@WebServlet(name = "UploadPackage", urlPatterns = {"/uploadPackage"})

@MultipartConfig(fileSizeThreshold = 1024 * 1024, //2mb
        maxFileSize = 1024 * 1024 * 10, //10mb
        maxRequestSize = 1024 * 1024 * 50)

public class UploadPackage extends HttpServlet {

    CategoriesDAO categoryDao;
    PackagesDAO packageDAO;

    public void init() {
        categoryDao = new CategoriesDAO();
        packageDAO = new PackagesDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            if (session != null) {
                if (session.getAttribute("user_type") != null) {
                    if ((int) session.getAttribute("user_type") == 2) {

                        List<Category> categories = categoryDao.selectAllCategory();
                        System.out.println(categories.get(0));
                        RequestDispatcher rd = request.getRequestDispatcher("package_upload_page.jsp");
                        request.setAttribute("categories", categories);
                        rd.forward(request, response);

                    } else {
                        request.getSession(false).setAttribute("errorMessage", "Sorry, You are not allowed to access this page.");
                        response.sendRedirect("home");
                    }
                } else {
                    request.getSession(false).setAttribute("errorMessage", "Ohh! looks like you are not logged in yet. Please login first.");
                    response.sendRedirect("login");
                }
            } else {
                request.getSession(false).setAttribute("errorMessage", "Ohh! looks like you are not logged in yet. Please login first.");
                response.sendRedirect("login");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            if (session != null) {
                if (session.getAttribute("user_type") != null) {
                    if ((int) session.getAttribute("user_type") == 2) {

                        String title = request.getParameter("title");
                        double price = Double.parseDouble(request.getParameter("price"));
                        int duration = Integer.parseInt(request.getParameter("duration"));
                        int people = Integer.parseInt(request.getParameter("people"));
                        int category = Integer.parseInt(request.getParameter("category"));

                        String description = request.getParameter("description");
                        String location = request.getParameter("location");

                        int agencyid = (int) session.getAttribute("id");
                        Date updated_date = new java.sql.Date(System.currentTimeMillis());
                        System.out.println("puckage upload date is: " + updated_date);
                        System.out.println(System.getProperty("user.dir"));

                        try {
                            Part pic_part = null;
                            pic_part = request.getPart("picture");
                            //String fileName = validateVendor.extractFileName(pic_part);
                            String fileName = title + "-vendor" + agencyid + ".jpg";
                            //String contextPath = request.getContextPath();
                            String contextPath = new File("").getAbsolutePath();
                            System.out.println("Context Path: " + contextPath);
//                            String imageFolderPath = "C:\\Users\\Umesh\\OneDrive\\Documents\\NetBeansProjects\\TravelNepal\\web\\img\\package_photos\\" + session.getAttribute("id");                            
                            String imageFolderPath = "D:\\TravelNepal\\TravelNepal\\web\\img\\package_photos\\" + session.getAttribute("id");
                            File fileSaveDir = new File(imageFolderPath);
                            fileSaveDir.mkdir();
                            String imageSavePath = "D:\\TravelNepal\\TravelNepal\\web\\img\\package_photos\\" + session.getAttribute("id") + File.separator + fileName;
                            System.out.println("image save path: " + imageSavePath);
                            pic_part.write(imageSavePath + File.separator);
                            Packages newPackage = new Packages(title, category, description, location, people, duration, price, agencyid, fileName, updated_date);

                            if (packageDAO.insertPackage(newPackage)) {
                                request.getSession(false).setAttribute("successMessage", "Hurray! one package is successfully added.");
                                
                                RequestDispatcher rd=  request.getRequestDispatcher("packages?page=listPackage");
                                rd.include(request, response);
                            } else {
                                request.getSession(false).setAttribute("errorMessage", "Sorry, the package couldnot be added at the moment.");
                                response.sendRedirect("uploadPackage");
                            }

                        } catch (Exception e) {
                            System.out.println(e);
                        }

                    } else {
                        request.getSession(false).setAttribute("errorMessage", "Sorry, You are not allowed to access this page.");
                        response.sendRedirect("home");
                    }
                } else {
                    request.getSession(false).setAttribute("errorMessage", "Ohh! looks like you are not logged in yet. Please login first.");
                    response.sendRedirect("login");
                }
            } else {
                request.getSession(false).setAttribute("errorMessage", "Ohh! looks like you are not logged in yet. Please login first.");
                response.sendRedirect("login");
            }
        } catch (Exception e) {
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
