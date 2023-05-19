<%-- 
    Document   : package_upload_page
    Created on : May 19, 2023, 12:29:48 PM
    Author     : Umesh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Package upload</title>
        <style>
            .gradient-custom-3 {
                /* fallback for old browsers */
                background: #84fab0;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5))
            }
            .gradient-custom-4 {
                /* fallback for old browsers */
                background: #84fab0;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))
            }
        </style>
    </head>
    <body>

        <section class="vh-110 bg-image"
                 style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
            <jsp:include page="navbar.jsp"/>
            <div class="mask d-flex align-items-center h-100 gradient-custom-3">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="card mt-5" style="border-radius: 15px;">
                                <div class="card-body p-5">
                                    <h2 class="text-uppercase text-center mb-5">Package upload form</h2>

                                    <form method="POST" action="uploadPackage" enctype='multipart/form-data'>

                                        <div class="form-outline mb-4">
                                            <input type="text" name="title" id="form3Example1cg" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example1cg">Title</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <Select name="category" class="form-control form-control-lg">
                                                <c:forEach var="category" items="${categories}">
                                                    <option value="${category.id}">${category.name}</option>
                                                </c:forEach>
                                            </select>
                                            <label class="form-label" for="category">Package category</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="text" name="location" id="form3Example3cg" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Location</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="number" name="duration" id="form3Example3cg" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Duration (in Days)</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="number" name="people" id="form3Example3cg" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">number of People</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="currency" name="price" id="form3Example3cg" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Price (NRS.)</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="file" name="picture" id="form3Example3cg" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Upload Image</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <textarea name="description" id="form3Example4cg" class="form-control form-control-lg" required></textarea>
                                            <label class="form-label" for="form3Example4cg">Description</label>
                                        </div>

                                        <div class="form-check d-flex mb-5">
                                            <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3cg" required/>
                                            <label class="form-check-label" for="form2Example3g">
                                                I agree all statements in <a href="#!" class="text-body"><u>Terms of service</u></a>
                                            </label>
                                        </div>

                                        <div class="d-flex justify-content-center">
                                            <button type="submit"
                                                    class="btn btn-success btn-block btn-lg text-white">Upload</button>
                                        </div>

                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>