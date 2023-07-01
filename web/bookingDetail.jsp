<%--
    Document   : bookingDetail
    Created on : Jun 29, 2023, 7:19:55 PM
    Author     : Subin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .image-container {
            text-align: center;
        }

        .image-container img {
            max-width: 100%;
            max-height: 100%;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />

    <div class="container">
        <h2>Booking Details</h2>

        <div class="row">
            
            <div class="col-md-6">
                <%-- Display the package image --%>
                <div class="image-container">
                    <img src="img/package_photos/${packags.picture.substring(packags.picture.length() - 5, packags.picture.length() - 4)}/${packags.picture}" class="img-fluid package-image" alt="Package Image">
                </div>
            </div>
            <div class="col-md-6">
                <%-- Display booking details --%>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">${packags.title}</h5>
                        <p>Customer Name: ${booking.customerName}</p>
                        <p>Tour Date: ${booking.bookingDate}</p>
                        <%-- Retrieve the corresponding package details using the packageId --%>
                        <h5 class="card-title">Package Details</h5>
                        <p>Category:${categoy}</p>
                        <p>Location: ${packags.location}</p>
                        <p>People: ${booking.numberOfPeople}</p>
                        <p>Duration: ${packags.duration} days</p>
                        <p>Price: Rs. ${packags.price}</p>
                        <p>Description: ${packags.description}</p>
                    </div>
                </div>
            </div>
        </div>

        <%-- Add more sections or details as needed --%>

    </div>
    <jsp:include page="footer.jsp"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
