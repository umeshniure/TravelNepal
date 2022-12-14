<%-- 
    Document   : index
    Created on : Jun 7, 2022, 3:34:06 PM
    Author     : Umesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="allscripts.jsp"/>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-client_id" content="180318505646-2lvpct5e8m50rs5htitavjr408l65lqs.apps.googleusercontent.com">
        <title>Login Page</title>
    </head>
    <body>

        <!--navigation section-->
        <jsp:include page="navigation-bar.jsp"/>
        <!--navigation section ends-->

        <c:if test="${successMessage != null}">
            <div id="toast-success" class="flex absolute top-3 z-20 right-3 items-center p-4 mb-4 w-full max-w-lg text-white bg-green-400 rounded-lg shadow dark:text-gray-400 dark:bg-gray-800" role="alert">
                <div class="inline-flex flex-shrink-0 justify-center items-center w-8 h-8 text-green-500 bg-green-100 rounded-lg dark:bg-green-800 dark:text-green-200">
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path></svg>
                    <span class="sr-only">Check icon</span>
                </div>
                <div class="ml-3 text-sm font-normal"><c:out value="${successMessage}"/></div>
                <button type="button" class="ml-auto -mx-1.5 -my-1.5 text-gray-800 hover:text-red-500 rounded-lg p-1.5 inline-flex h-8 w-8 dark:text-gray-500 dark:hover:text-white dark:bg-gray-800 dark:hover:bg-gray-700" data-dismiss-target="#toast-success" aria-label="Close" title="Dismiss">
                    <span class="sr-only">Close</span>
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                </button>
            </div>
        </c:if> 

        <c:if test="${errorMessage != null}">
            <div id="toast-warning" class="flex absolute top-3 z-20 right-3 items-center p-4 w-full max-w-lg text-white bg-red-400 rounded-lg shadow dark:text-gray-400 dark:bg-gray-800" role="alert">
                <div class="inline-flex flex-shrink-0 justify-center items-center w-8 h-8 text-orange-600 bg-orange-100 rounded-lg dark:bg-orange-700 dark:text-orange-200">
                    <svg aria-hidden="true" class="w-8 h-8" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path></svg>
                    <span class="sr-only">Warning icon</span>
                </div>
                <div class="ml-3 text-sm font-normal w-auto"><c:out value="${errorMessage}"/></div>
                <button type="button" class="ml-auto -mx-1.5 -my-1.5 text-gray-800 hover:text-red-500 rounded-lg p-1.5 inline-flex h-8 w-8 dark:text-gray-500 dark:hover:text-white dark:bg-gray-800 dark:hover:bg-gray-700" data-dismiss-target="#toast-warning" aria-label="Close" title="Dismiss">
                    <span class="sr-only">Close</span>
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                </button>
            </div>
        </c:if>

        <section class="h-full gradient-form bg-gray-200">
            <div class="container py-12 px-6 h-full">
                <div class="flex justify-center items-center flex-wrap h-full g-6 text-gray-800">
                    <div class="block bg-white shadow-lg rounded-lg">
                        <div class="lg:flex g-0">

                            <div class="lg:w-12/12 px-4 md:px-0">
                                <div class="md:p-12 md:mx-6">
                                    <div class="text-center">
<!--                                        <img class="mx-auto w-28"
                                             src="./images/static/bookstack_logos/bookstack-logo.png"
                                             alt="Bookstack"
                                             />-->
                                        <h4 class="text-xl font-semibold mt-1 mb-12 pb-1">Welcome to Travel nepal.</h4>
                                    </div>

                                    <form action="login" method="post">
                                        <p class="mb-4">Please login to your account</p>
                                        <div class="mb-4">
                                            <input
                                                type="text"
                                                name="email" 
                                                class="form-control block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                                id="exampleFormControlInput1"
                                                placeholder="Email"
                                                value="${email}"
                                                />
                                        </div>
                                        <div class=" relative mb-4">
                                            <div class="absolute inset-y-0 right-0 flex items-center px-1">
                                                <input class="hidden js-password-toggle" id="toggle" type="checkbox"/>
                                                <label class="rounded px-2 py-1 text-sm text-gray-600 font-mono cursor-pointer js-password-label" for="toggle">
                                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                                </label>
                                            </div>
                                            <input type="password" name="password"
                                                   class="js-password appearance-none form-control block w-full px-3 py-1.5 text-base font-normal text-gray-700
                                                   bg-white bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700
                                                   focus:bg-white focus:border-blue-600 focus:outline-none"
                                                   id="password" autocomplete="off" placeholder="Password"/>
                                        </div>
                                        <input  type="hidden" name="loginType" value="normalLogin"/>

                                        <c:if test="${not empty message}">
                                            <div class="flex p-4 mb-4 text-sm text-red-700 bg-red-100 rounded-lg dark:bg-red-200 dark:text-red-800" role="alert">
                                                <svg aria-hidden="true" class="flex-shrink-0 inline w-5 h-5 mr-3" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path></svg>
                                                <span class="sr-only">Info</span>
                                                <div>
                                                    <span class="font-medium">${message}</span>
                                                </div>
                                            </div>
                                        </c:if>

                                        <div class="text-center pt-1 mb-12 pb-1">
                                            <button class="inline-block px-6 py-2.5 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-blue-700 hover:shadow-lg focus:shadow-lg focus:outline-none focus:ring-0 active:shadow-lg transition duration-150 ease-in-out w-full mb-3"
                                                    type="submit" data-mdb-ripple="true" data-mdb-ripple-color="light"
                                                    style=" background: linear-gradient(to right, #00c276, #00c276, #00c276, #00c276);">
                                                Log in
                                            </button>
                                            <a class="text-gray-500 hover:text-purple-600" href="forgotPassword">Forgot password?</a>
                                        </div>


                                        <div class="flex items-center justify-between pb-6">
                                            <p class="mb-0 mr-2">Don't have an account?</p>
                                            <a href ="signup" type="button" class="inline-block px-6 py-2 border-2 border-green-600 text-white-600 font-medium text-xs leading-tight uppercase rounded hover:bg-green-600 hover:text-white focus:outline-none focus:ring-0 transition duration-150 ease-in-out"
                                               data-mdb-ripple="true"
                                               data-mdb-ripple-color="light">
                                                Register
                                            </a>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>  

        <!--footer section-->
        <jsp:include page="footer.html"/>
        <!--footer section ends-->

    </body>

    <script>
        const passwordToggle = document.querySelector(".js-password-toggle");

        passwordToggle.addEventListener("click", function () {
            const password = document.querySelector(".js-password"),
                    passwordLabel = document.querySelector(".js-password-label");

            if (password.type === "password") {
                password.type = "text";
                passwordLabel.innerHTML = '<i class="fa fa-eye-slash" aria-hidden="true"></i>';
            } else {
                password.type = "password";
                passwordLabel.innerHTML = '<i class="fa fa-eye" aria-hidden="true"></i>';
            }

        });
    </script>

</html>











