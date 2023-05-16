/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.dao.PackagesDAO;
import com.model.Packages;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Umesh
 */
@WebServlet(name = "PackageUpload", urlPatterns = {"/packageUpload"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024, //2mb
        maxFileSize = 1024 * 1024 * 10, //10mb
        maxRequestSize = 1024 * 1024 * 50)

public class PackageUpload extends HttpServlet {

    PackagesDAO packageDAO;

    public void init() {
        packageDAO = new PackagesDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("package_upload.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String title = request.getParameter("title");
        double price = Double.parseDouble(request.getParameter("price"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        int people = Integer.parseInt(request.getParameter("people"));
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        Part pic_part = request.getPart("picture");
        int agencyid = (int) session.getAttribute("id");
        Date updated_date = new Date(System.currentTimeMillis());
        System.out.println("package update date: " + updated_date);

        String fileName = title + "-vendor" + agencyid + ".png";
        String imageFolderPath = "C:\\Users\\Umesh\\OneDrive\\Documents\\NetBeansProjects\\TravelNepal\\web\\img\\package_photos\\" + session.getAttribute("id");
        File fileSaveDir = new File(imageFolderPath);
        fileSaveDir.mkdir();
        String imageSavePath = "C:\\Users\\Umesh\\OneDrive\\Documents\\NetBeansProjects\\TravelNepal\\web\\img\\package_photos\\" + session.getAttribute("id") + File.separator + fileName;
        System.out.println("image save path: " + imageSavePath);
        pic_part.write(imageSavePath + File.separator);
        Packages newPackage = new Packages(title, description, location, people, duration, price, agencyid, imageSavePath, updated_date);
        try {
            packageDAO.insertPackage(newPackage);
            response.sendRedirect("packageUpload");
        } catch (SQLException ex) {
            Logger.getLogger(PackageUpload.class.getName()).log(Level.SEVERE, null, ex);
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
