<%-- 
    Document   : login
    Created on : May 3, 2023, 5:26:43 PM
    Author     : Umesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <section class="vh-120 bg-image"
                 style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
            <jsp:include page="navbar.jsp"/>
            <div class="mask d-flex align-items-center h-100 gradient-custom-3">
                <div class="container h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                            <div class="card mt-5 mb-5" style="border-radius: 15px;">
                                <div class="card-body p-5">
                                    <h4 class="text-uppercase text-center mb-5">Welcome back, Login here.</h4>

                                    <form method="POST" action="login">

                                        <div class="form-outline mb-4">
                                            <input type="email" name="email" id="form3Example3cg" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Your Email</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="password" name="password" id="form3Example3cg" class="form-control form-control-lg" required/>
                                            <label class="form-label" for="form3Example3cg">Password</label>
                                        </div>                                        

                                        <div class="d-flex justify-content-center">
                                            <button type="submit"
                                                    class="btn btn-success btn-block btn-lg text-white">Login</button>
                                        </div>

                                        <p class="text-center text-muted mt-5 mb-0">Do not have an account? <a href="userRegistration"
                                                                                                                class="fw-bold text-body"><u>Register here</u></a></p>

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
