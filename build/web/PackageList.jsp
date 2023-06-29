<%-- 
    Document   : PackageList.jsp
    Created on : Jun 27, 2023, 2:55:08 PM
    Author     : Subin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Package List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .card-img {
            height: 200px; /* Adjust the height as per your requirements */
            object-fit: cover;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    <div class="container">
        <h1>Packages Available</h1>

        <div class="row">
            <c:forEach var="model" items="${packages}">
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="card mb-3">
                        <img  src="img/package_photos/${model.picture.substring(model.picture.length() - 5, model.picture.length() - 4)}/${model.picture}" class="card-img-top card-img" alt="Model Image">
                        <div class="card-body">
                            <h5 class="card-title">${model.title}</h5>
                            <small>${model.location}</small>
                            <p class="card-text">Duration: ${model.duration} days</p>
                            <p class="card-text">Price: Rs.${model.price}</p>
                            <p class="card-text">Description: ${model.description.substring(0,10)}...</p>
                            <div class="d-flex justify-content-around">
                                <a href="packages?page=getPackage&get=${model.id}" class="btn btn-primary justify-center">View More</a>
                                <%if ((session.getAttribute("user_type")!=null)){%>

                                    <%if ((session.getAttribute("user_type").toString().equals("3")) || (session.getAttribute("user_type").toString().equals("2"))){%>
                                        <a href="packages?page=editPackage&get=${model.id}" class="btn btn-outline-info justify-center">Edit</a>
                                    <%}%>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

