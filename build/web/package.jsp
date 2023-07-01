<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Package Detail</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .details p {
            margin-bottom: 0.5rem; 
        }
        
        .message-container {
            position: relative;
            margin-bottom: 1rem;
        }

        .message {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            padding: 0.75rem 1.25rem;
            border-radius: 0.25rem;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp"/>
    <div class="container message-container"  id="confirmationMessage">
        <%-- Display confirmation message or error message --%>
        <% if (request.getAttribute("confirmationMessage") != null) { %>
        <h1>Confirmation</h1>
        <div class="alert alert-success">
            ${confirmationMessage}
        </div>
        <% } else if (request.getAttribute("errorMessage") != null) { %>
        <div class="alert alert-danger">
            <h1>Error</h1>
            ${errorMessage}
        </div>
        <% } %>

    </div>
    <div class="container">
        <h1>Package Detail</h1>

        <div class="row">
            <div class="col-md-8">
                <img src="img/package_photos/${packag.picture.substring(packag.picture.length() - 5, packag.picture.length() - 4)}/${packag.picture}" class="img-fluid package-image" alt="Package Image">
            </div>
            <div class="col-md-4 details">
                <h2>${packag.title}</h2>
                <p>Last Updated: ${packag.updated_date}</p>
                <p>Category: ${category}</p>
                <p>Location: ${packag.location}</p>
                <p>People: ${packag.people}</p>
                <p>Duration: ${packag.duration} days</p>
                <p>Price: Rs.${packag.price}</p>
                <p>Agency ID: ${packag.agencyid}</p>
                <p>Description: ${packag.description}</p>
                <%if ((session.getAttribute("user_type")!=null)){%>
                    <%if ((session.getAttribute("user_type").toString().equals("1"))){%>
                        <form action="packages?page=bookPackage" method="post" onsubmit="return validateForm()">
                            <input type="hidden" name="packageId" value="${packag.id}"/>
                            <div class="form-group">
                                <label for="bookingDate">Select Date:</label>
                                <input type="date" class="form-control" id="bookingDate" name="bookingDate">
                            </div>
                            <div class="form-group">
                                <label for="numberOfPeople">Number of People:</label>
                                <input type="number" class="form-control" id="numberOfPeople" name="numberOfPeople" value="1" min="1" max="${packag.people}">
                            </div>
                            <div class="d-flex justify-content-between">
                                <button type="submit" class="btn btn-primary">Book Package</button>
                                <a href="#">
                                    <button class="btn btn-outline-info text-gray-400">Like Package</button>
                                </a>
                            </div>
                        </form>
                    <%}%>
                <%}%>
            </div>
        </div>

        <hr>

        <!-- Rest of the content -->
    </div>
    <jsp:include page="footer.jsp"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function validateForm() {
            var bookingDate = document.getElementById("bookingDate").value;

            if (new Date(bookingDate) < new Date()) {
                alert("Please select a date on or after the current date.");
                return false;
            }


            return true;
        }
        
        var messageContainer = document.getElementById("confirmationMessage") || document.getElementById("errorMessage");

        if (messageContainer) {
            setTimeout(function() {
                messageContainer.style.display = "none";
            }, 5000); // Adjust the timeout (in milliseconds) as needed
        }
    </script>
</body>
</html>
