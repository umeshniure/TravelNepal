<%-- 
    Document   : index
    Created on : May 2, 2023, 10:33:54 AM
    Author     : Umesh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TRAVELNEPAL</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <style>
            html { scroll-behavior: smooth; } 
        </style>
    </head>

    <body>

        <jsp:include page="navbar.jsp"/>

        <!-- Carousel Start -->
        <div class="container-fluid p-0">
            <div id="header-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="w-100" src="img/carousel-1.jpg" alt="Image">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 900px;">
                                <h4 class="text-white text-uppercase mb-md-3">Tours & Travel</h4>
                                <h1 class="display-3 text-white mb-md-4">Let's Discover The World Together</h1>
                                <a href="packages?page=listPackage" class="btn btn-primary py-md-3 px-md-5 mt-2">Choose Package</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="w-100" src="img/carousel-2.jpg" alt="Image">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 900px;">
                                <h4 class="text-white text-uppercase mb-md-3">Tours & Travel</h4>
                                <h1 class="display-3 text-white mb-md-4">Discover Amazing Places With Us</h1>
                                <a href="packages?page=listPackage" class="btn btn-primary py-md-3 px-md-5 mt-2">Choose Package</a>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                    <div class="btn btn-dark" style="width: 45px; height: 45px;">
                        <span class="carousel-control-prev-icon mb-n2"></span>
                    </div>
                </a>
                <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                    <div class="btn btn-dark" style="width: 45px; height: 45px;">
                        <span class="carousel-control-next-icon mb-n2"></span>
                    </div>
                </a>
            </div>
        </div>
        <!-- Carousel End -->


        <!-- Booking Start -->
        <div class="container-fluid booking mt-5 pb-5">
            <div class="container pb-5">
                <div class="bg-light shadow" style="padding: 30px;">
                    <form action="packages?page=bookPackage" method = "POST" id="bookingFOrm">
                        <div class="form-row align-items-center">
                            <div class="col-md-3 form-group">
                                <label class="col-form-label">Destination:</label>
                                <select name ="packageId" class="custom-select px-4 form-control" id="destination" style="height: 47px;">
                                    <option value="">Select Destination</option>
                                    <c:forEach var="model" items="${packages}">
                                        <option value="${model.id}" data-location="${model.location}" data-price="${model.price}" data-time="${model.duration}" data-people="${model.people}">${model.title}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-2 form-group">
                                <label class="col-form-label">Depart Date:</label>
                                <div class="date" id="date1" data-target-input="nearest">
                                    <input type="text" class="form-control p-4 datetimepicker-input" placeholder="Depart Date" data-target="#date1" data-toggle="datetimepicker" id="departure-date" required/>
                                </div>
                            </div>
                            <div class="col-md-2 form-group">
                                <label class="col-form-label">Location:</label>
                                <input type="text" class="form-control" placeholder="Location" id="location" readonly/>
                            </div>
                            <div class="col-md-2 form-group">
                                <label class="col-form-label">Duration:</label>
                                <input type="text" class="form-control" placeholder="Duration" id="duration" readonly/>
                            </div>
                            <div class="col-md-1 form-group">
                                <label class="col-form-label">Price:</label>
                                <input type="text" class="form-control" placeholder="Price" id="price" readonly/>
                            </div>
                            <div class="col-md-2 form-group">
                                <label class="col-form-label">People:</label>
                                <input type="number" class="form-control"  name="numberOfPeople" placeholder="People" id="num-people" readonly/>
                            </div>
                            <div class="col-md-3 form-group">
                                <button class="btn btn-primary btn-block" type="button" style="height: 47px; margin-top: 33px;" onclick="submitForm()">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Booking End -->


        <!-- About Start -->
        <div class="container-fluid py-5">
            <div class="container pt-5">
                <div class="row">
                    <div class="col-lg-6" style="min-height: 500px;">
                        <div class="position-relative h-100">
                            <img class="position-absolute w-100 h-100" src="img/about.jpg" style="object-fit: cover;">
                        </div>
                    </div>
                    <div class="col-lg-6 pt-5 pb-lg-5"  id="about">
                        <div class="about-text bg-white p-4 p-lg-5 my-lg-5">
                            <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">About Us</h6>
                            <h1 class="mb-3">We Provide Best Tour Packages In Your Budget</h1>
                            <p>
                                Your gateway to unforgettable travel experiences, cultural immersion, and breathtaking adventures. 
                                Trust us to create lifelong memories and help you explore the beauty of every destination.
                            </p>
                            <div class="row mb-4">
                                <div class="col-6">
                                    <img class="img-fluid" src="img/about-1.jpg" alt="">
                                </div>
                                <div class="col-6">
                                    <img class="img-fluid" src="img/about-2.jpg" alt="">
                                </div>
                            </div>
                            <a href="" class="btn btn-primary mt-1">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- Feature Start -->
        <div class="container-fluid pb-5">
            <div class="container pb-5">
                <div class="row">
                    <div class="col-md-4">
                        <div class="d-flex mb-4 mb-lg-0">
                            <div class="d-flex flex-shrink-0 align-items-center justify-content-center bg-primary mr-3" style="height: 100px; width: 100px;">
                                <i class="fa fa-2x fa-money-check-alt text-white"></i>
                            </div>
                            <div class="d-flex flex-column">
                                <h5 class="">Competitive Pricing</h5>
                                <p class="m-0"> Offering unbeatable prices for top-quality products and services</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="d-flex mb-4 mb-lg-0">
                            <div class="d-flex flex-shrink-0 align-items-center justify-content-center bg-primary mr-3" style="height: 100px; width: 100px;">
                                <i class="fa fa-2x fa-award text-white"></i>
                            </div>
                            <div class="d-flex flex-column">
                                <h5 class="">Best Services</h5>
                                <p class="m-0"> Delivering exceptional service that exceeds expectations</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="d-flex mb-4 mb-lg-0">
                            <div class="d-flex flex-shrink-0 align-items-center justify-content-center bg-primary mr-3" style="height: 100px; width: 100px;">
                                <i class="fa fa-2x fa-globe text-white"></i>
                            </div>
                            <div class="d-flex flex-column">
                                <h5 class="">Worldwide Coverage</h5>
                                <p class="m-0">Extensive global reach for seamless service wherever you are</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Feature End -->


        <!-- Destination Start -->
        <div class="container-fluid py-5">
            <div class="container pt-5 pb-3">
                <div class="text-center mb-3 pb-3">
                    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Destination</h6>
                    <h1>Explore Top Destination</h1>
                </div>
                <div class="row">
                    <c:forEach var="model" items="${hotLocations}">
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="destination-item position-relative overflow-hidden mb-2">
                                <img class="img-fluid" src="img/package_photos/${model.picture.substring(model.picture.length() - 5, model.picture.length() - 4)}/${model.picture}" alt="">
                                <a class="destination-overlay text-white text-decoration-none" href="">
                                    <h5 class="text-white">${model.location}</h5>
                                    <span>${model.number} locations</span>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Destination Start -->


        <!-- Service Start -->
        <div class="container-fluid py-5" id="service">
            <div class="container pt-5 pb-3">
                <div class="text-center mb-3 pb-3">
                    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Services</h6>
                    <h1>Tours & Travel Services</h1>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="service-item bg-white text-center mb-2 py-5 px-4">
                            <i class="fa fa-2x fa-route mx-auto mb-4"></i>
                            <h5 class="mb-2">Travel Guide</h5>
                            <p class="m-0">
                                Expert advice and recommendations for your memorable travel experience
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="service-item bg-white text-center mb-2 py-5 px-4">
                            <i class="fa fa-2x fa-ticket-alt mx-auto mb-4"></i>
                            <h5 class="mb-2">Ticket Booking</h5>
                            <p class="m-0">
                                Convenient and hassle-free booking of tickets for your desired destinations
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="service-item bg-white text-center mb-2 py-5 px-4">
                            <i class="fa fa-2x fa-hotel mx-auto mb-4"></i>
                            <h5 class="mb-2">Hotel Booking</h5>
                            <p class="m-0">
                                Effortless reservation of comfortable accommodations to suit your travel needs
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Service End -->


        <!-- Packages Start -->
        <div class="container-fluid py-5" id="packages">
            <div class="container pt-5 pb-3">
                <div class="text-center mb-3 pb-3">
                    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Packages</h6>
                    <h1>Pefect Tour Packages</h1>
                </div>
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
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="d-flex justify-content-center">
                    <a href="packages?page=listPackage" class="btn btn-primary justify-center">View All</a>
                </div>
            </div>
        </div>
        <!-- Packages End -->


        <!-- Registration Start -->
        <div class="container-fluid bg-registration py-5" style="margin: 90px 0;">
            <div class="container py-5">
                <div class="row align-items-center">
                    <div class="col-lg-7 mb-5 mb-lg-0">
                        <div class="mb-4">
                            <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Mega Offer</h6>
                            <h1 class="text-white"><span class="text-primary">30% OFF</span> For Honeymoon</h1>
                        </div>
                        <p class="text-white">Invidunt lorem justo sanctus clita. Erat lorem labore ea, justo dolor lorem ipsum ut sed eos,
                            ipsum et dolor kasd sit ea justo. Erat justo sed sed diam. Ea et erat ut sed diam sea ipsum est
                            dolor</p>
                        <ul class="list-inline text-white m-0">
                            <li class="py-2"><i class="fa fa-check text-primary mr-3"></i>Labore eos amet dolor amet diam</li>
                            <li class="py-2"><i class="fa fa-check text-primary mr-3"></i>Etsea et sit dolor amet ipsum</li>
                            <li class="py-2"><i class="fa fa-check text-primary mr-3"></i>Diam dolor diam elitripsum vero.</li>
                        </ul>
                    </div>
                    <div class="col-lg-5">
                        <div class="card border-0">
                            <div class="card-header bg-primary text-center p-4">
                                <h1 class="text-white m-0">Sign Up Now</h1>
                            </div>
                            <div class="card-body rounded-bottom bg-white p-5">
                                <form>
                                    <div class="form-group">
                                        <input type="text" class="form-control p-4" placeholder="Your name" required="required" />
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control p-4" placeholder="Your email" required="required" />
                                    </div>
                                    <div class="form-group">
                                        <select class="custom-select px-4" style="height: 47px;">
                                            <option selected>Select a destination</option>
                                            <option value="1">destination 1</option>
                                            <option value="2">destination 1</option>
                                            <option value="3">destination 1</option>
                                        </select>
                                    </div>
                                    <div>
                                        <button class="btn btn-primary btn-block py-3" type="submit">Sign Up Now</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Registration End -->


        <!-- Team Start -->
        <div class="container-fluid py-5" id ="guides">
            <div class="container pt-5 pb-3">
                <div class="text-center mb-3 pb-3">
                    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Guides</h6>
                    <h1>Our Travel Guides</h1>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-2">
                        <div class="team-item bg-white mb-4">
                            <div class="team-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="img/team-1.jpg" alt="">
                                <div class="team-social">
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-instagram"></i></a>
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-linkedin-in"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <h5 class="text-truncate">Sona Khatri</h5>
                                <p class="m-0">TravelNepal Guide</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-2">
                        <div class="team-item bg-white mb-4">
                            <div class="team-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="img/team-2.jpg" alt="">
                                <div class="team-social">
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-instagram"></i></a>
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-linkedin-in"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <h5 class="text-truncate">Subash Kandel</h5>
                                <p class="m-0">Guide</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-2">
                        <div class="team-item bg-white mb-4">
                            <div class="team-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="img/team-3.jpg" alt="">
                                <div class="team-social">
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-instagram"></i></a>
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-linkedin-in"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <h5 class="text-truncate">Anisha Rana Magar</h5>
                                <p class="m-0">Guide</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 pb-2">
                        <div class="team-item bg-white mb-4">
                            <div class="team-img position-relative overflow-hidden">
                                <img class="img-fluid w-100" src="img/team-4.jpg" alt="">
                                <div class="team-social">
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-instagram"></i></a>
                                    <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-linkedin-in"></i></a>
                                </div>
                            </div>
                            <div class="text-center py-4">
                                <h5 class="text-truncate">Siddhartha Oli</h5>
                                <p class="m-0">Hospitality Director</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Team End -->


        <!-- Testimonial Start -->
        <div class="container-fluid py-5" id="testimonials">
            <div class="container py-5">
                <div class="text-center mb-3 pb-3">
                    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Testimonial</h6>
                    <h1>What Say Our Clients</h1>
                </div>
                <div class="owl-carousel testimonial-carousel">
                    <div class="text-center pb-4">
                        <img class="img-fluid mx-auto" src="img/testimonial-1.jpg" style="width: 100px; height: 100px;" >
                        <div class="testimonial-text bg-white p-4 mt-n5">
                            <p class="mt-5">
                                Absolutely breathtaking! My trip to Nepal was an unforgettable adventure filled with stunning landscapes, vibrant culture, and warm-hearted locals.
                            </p>
                            <h5 class="text-truncate">John Chlay</h5>
                            <span>Writer</span>
                        </div>
                    </div>
                    <div class="text-center">
                        <img class="img-fluid mx-auto" src="img/testimonial-2.jpg" style="width: 100px; height: 100px;" >
                        <div class="testimonial-text bg-white p-4 mt-n5">
                            <p class="mt-5">
                                An exceptional trip that left us awestruck with breathtaking destinations, seamless organization, and unforgettable memories. From start to finish, it was an enchanting journey beyond our expectations.
                            </p>
                            <h5 class="text-truncate">Shripal Ole</h5>
                        </div>
                    </div>
                    <div class="text-center">
                        <img class="img-fluid mx-auto" src="img/testimonial-3.jpg" style="width: 100px; height: 100px;" >
                        <div class="testimonial-text bg-white p-4 mt-n5">
                            <p class="mt-5">
                                An impeccably organized and memorable trip. The diverse destinations, seamless logistics, and friendly guides made it an unforgettable experience
                            </p>
                            <h5 class="text-truncate">Christoper Nolan</h5>
                            <span>Doctor</span>
                        </div>
                    </div>
                    <div class="text-center">
                        <img class="img-fluid mx-auto" src="img/testimonial-4.jpg" style="width: 100px; height: 100px;" >
                        <div class="testimonial-text bg-white p-4 mt-n5">
                            <p class="mt-5">
                                An unforgettable journey through Nepal's breathtaking landscapes and rich cultural heritage, offering a perfect blend of adventure and serenity.
                            </p>
                            <h5 class="text-truncate">Trisha Chettri</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->


        <jsp:include page="footer.jsp"/>


        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                            $(document).ready(function () {
                                // Define the number of items per page
                                var itemsPerPage = 3;

                                // Get the total number of items
                                var totalItems = ${packages.size()};

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
                                    $('.card').hide();

                                    // Show the items for the current page
                                    $('.card').slice(startIndex, endIndex).show();
                                }
                                displayItems(currentPage);
                            });
        </script>

        <script>
            // Function to update the displayed details based on the selected destination
            function updateDestinationDetails() {
                const destinationSelect = document.getElementById("destination");
                const locationField = document.getElementById("location");
                const timeField = document.getElementById("duration");
                const numPeopleField = document.getElementById("num-people");
                const priceField = document.getElementById("price");

                const selectedOption = destinationSelect.options[destinationSelect.selectedIndex];
                const location = selectedOption.getAttribute("data-location");
                const time = selectedOption.getAttribute("data-time");
                const numPeople = selectedOption.getAttribute("data-people");
                const price = selectedOption.getAttribute("data-price");

                locationField.value = location;
                timeField.value = time;
                numPeopleField.value = numPeople;
                priceField.value = price;
            }

            // Function to handle form submission
            function submitForm() {
                formElem = document.getElementById("bookingFOrm");
                const destinationSelect = document.getElementById("destination");
                const departureDateInput = document.getElementById("departure-date");
                const numPeopleField = document.getElementById("num-people");

                const selectedOption = destinationSelect.options[destinationSelect.selectedIndex];
                const destinationId = selectedOption.value;
                const departureDate = departureDateInput.value;
                const numPeople = numPeopleField.value;
                const price = selectedOption.getAttribute("data-price");
                console.log(destinationId,departureDate,numPeople,price)
                formElem.submit()
                
            }

            // Attach event listener to destination select to update the details when a destination is chosen
            document.getElementById("destination").addEventListener("change", updateDestinationDetails);
        </script>
    </body>

</html>