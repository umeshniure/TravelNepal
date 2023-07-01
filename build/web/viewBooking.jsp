<%-- 
    Document   : viewBooking
    Created on : Jun 29, 2023, 4:34:58 PM
    Author     : Subin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>View Bookings</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .booking-card {
                margin-bottom: 20px;
            }

            .booking-card img {
                max-width: 100%;
                height: auto;
            }
        </style>
    </head>
    <body>
        <jsp:include page="navbar.jsp" />

        <div class="container">

            <%-- Check user type and display relevant bookings --%>
            <c:if test="${userType == 1}">
                <%-- Display bookings for normal users (type 1) --%>
                <h2>Your Bookings</h2>
                <%-- Iterate over the bookings for the current user --%>
                <c:forEach var="booking" items="${userBookings}">
                    <div class="card booking-card">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <c:forEach var="packag" items="${packages}">
                                    <c:if test="${booking.packageId == packag.id}">
                                        <img src="img/package_photos/${packag.picture.substring(packag.picture.length() - 5, packag.picture.length() - 4)}/${packag.picture}" class="img-fluid package-image" alt="Package Image">
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <c:forEach var="packag" items="${packages}">
                                        <c:if test="${booking.packageId == packag.id}">
                                            <h5 class="card-title">${packag.title}</h5>
                                            <small>${packag.location}</small>
                                            <p>Date for: ${booking.bookingDate}</p>
                                            <p>Duration: ${packag.duration} days</p>
                                        </c:if>
                                    </c:forEach>

                                    <%-- Add more booking details here --%>
                                    <div class="d-flex justify-content-between">
                                        <a href="bookings?page=detail&get=${booking.id}" class="btn btn-primary">View Details</a>
                                        <a href="bookings?page=delete&get=${booking.id}" class="btn btn-outline-danger">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                </c:forEach>
            </c:if>

            <c:if test="${userType == 2}">
                <%-- Display bookings for vendors (type 2) --%>
                <h2>Bookings for Packages You Uploaded</h2>
                <%-- Iterate over the bookings for packages uploaded by the vendor --%>
                <c:forEach var="booking" items="${vendorBookings}">
                    <div class="card booking-card">
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img src="img/package_photos/${booking.packages.picture.substring(booking.packages.picture.length() - 5, booking.packages.picture.length() - 4)}/${booking.packages.picture}" class="img-fluid booking.packagese-image" alt="Package Image">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <p>${booking.packages.title}</p>
                                    </h5>
                                    <small><p>${booking.packages.location}</p></small>
                                    <%-- Display other booking details --%>
                                    <p>Bought By: ${booking.customerName}</p>
                                    <p>Booked For: ${booking.bookingDate}</p>
                                    <%-- Add more booking details here --%>
                                    <div class="d-flex justify-content-between">
                                        <a href="bookings?page=detail&get=${booking.id}" class="btn btn-primary">View Details</a>
                                        <a href="deleteBooking.jsp?bookingId=${booking.id}" class="btn btn-outline-danger">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                </c:forEach>
            </c:if>

        </div>
        <nav>
            <ul class="pagination justify-content-center"></ul>
        </nav>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                // Define the number of items per page
                var itemsPerPage = 5;

                // Get the total number of items
                var totalItems = ${userBookings.size()};

                // Calculate the number of pages
                var totalPages = Math.ceil(totalItems / itemsPerPage);

                // Set the initial page to 1
                var currentPage = 1;

                // Function to display the items for the current page
                function displayItems(page) {
                    // Calculate the starting and ending item indices
                    var startIndex = (page - 1) * itemsPerPage;
                    var endIndex = startIndex + itemsPerPage;

                    // Hide all items
                    $('.booking-card').hide();

                    // Show the items for the current page
                    $('.booking-card').slice(startIndex, endIndex).show();
                }

                // Function to generate the pagination links
                function generatePaginationLinks() {
                    // Clear the existing pagination links
                    $('.pagination').empty();

                    // Generate the pagination links
                    for (var i = 1; i <= totalPages; i++) {
                        var link = '<li class="page-item';

                        // Add the "active" class to the current page link
                        if (i === currentPage) {
                            link += ' active';
                        }

                        // Add the page number and closing tags for the link
                        link += '"><a class="page-link" href="#">' + i + '</a></li>';

                        // Append the link to the pagination ul
                        $('.pagination').append(link);
                    }
                }

                // Initial display of items and pagination links
                displayItems(currentPage);
                generatePaginationLinks();

                // Handle pagination link clicks
                $(document).on('click', '.pagination .page-link', function (e) {
                    e.preventDefault();

                    // Get the clicked page number
                    var clickedPage = parseInt($(this).text());

                    // Update the current page and display the items
                    currentPage = clickedPage;
                    displayItems(currentPage);

                    // Generate the new pagination links
                    generatePaginationLinks();
                });
            });
        </script>

    </body>
</html>
