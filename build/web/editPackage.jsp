<%-- 
    Document   : editPackage
    Created on : Jun 28, 2023, 8:29:08 PM
    Author     : Subin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <jsp:include page="navbar.jsp" />
    <div class="container message-container" id="confirmationMessage">
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
                <form action="packages?page=editPackages" method="post">
                    <input type="hidden" name="packageId" value="${packag.id}" />
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="title">Title</label>
                            <input type="text" id="title" name="title" class="form-control" value="${packag.title}" required />
                        </div>
                        <div class="form-group col-md-6">
                            <label for="category">Category</label>
                            <select id="category" name="category" class="form-control" required>
                                <option value="">Select Category</option>
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.id}" <c:if test="${category.id == packag.category}"> selected</c:if>>
                                        ${category.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="location">Location</label>
                            <input type="text" id="location" name="location" class="form-control" value="${packag.location}" required />
                        </div>
                        <div class="form-group col-md-6">
                            <label for="people">People(no.)</label>
                            <input type="number" min="0"  id="people" name="people" class="form-control" value="${packag.people}" required />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="duration">Duration(in days)</label>
                            <input type="number" min="1" id="duration" name="duration" class="form-control" value="${packag.duration}" required />
                        </div>
                        <div class="form-group col-md-6">
                            <label for="price">Price</label>
                            <input type="currency" id="price" name="price" class="form-control" value="${packag.price}" required />
                        </div>
                    </div>
                        <input type="hidden" name="picture" value="${packag.picture}"/>
                    <input type="hidden" id="agencyId" name="agencyId" value="${packag.agencyid}" required />
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" rows="5" name="description" class="form-control" required>${packag.description}</textarea>
                    </div>
                    <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        <a href="packages?page=deletePackage&on=${packag.id}">
                            <input type="button" class="btn btn-outline-danger text-gray-400" value="Delete"/>
                        </a>
                    </div>
                </form>
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
        var messageContainer = document.getElementById("confirmationMessage") || document.getElementById("errorMessage");
        if (messageContainer) {
            setTimeout(function () {
                messageContainer.style.display = "none";
            }, 5000); // Adjust the timeout (in milliseconds) as needed
        }
    </script>
</body>
</html>
