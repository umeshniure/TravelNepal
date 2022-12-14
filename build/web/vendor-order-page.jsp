<%-- 
    Document   : vendor-order-page
    Created on : Oct 4, 2022, 9:20:40 PM
    Author     : Umesh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="allscripts.jsp"/>
        <title>Orders</title>
    </head>
    <body>
        <!--aside navigation bar-->
        <jsp:include page="vendor-dashboard-aside.jsp"/>
        <!--aside navigation bar ends-->

        <div class="ml-auto mb-6 lg:w-[75%] xl:w-[80%] 2xl:w-[85%]">

            <!--vendor navigation bar-->
            <jsp:include page="vendor-dashboard-navbar.jsp"/>
            <!--vendor navigation bar ends-->

            <!-- Client Table -->
            <div class="mt-4 mx-4">
                <div class="w-full overflow-hidden rounded-lg shadow-xs">
                    <div class="w-full overflow-x-auto">
                        <table class="w-full">
                            <thead>
                                <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                    <th class="px-4 py-3">Order ID</th>
                                    <th class="px-4 py-3">Ordered By</th>
                                    <th class="px-4 py-3">Book Name</th>
                                    <th class="px-4 py-3">Quantity</th>
                                    <th class="px-4 py-3">Ordered Date</th>
                                    <th class="px-4 py-3">Phone</th>
                                    <th class="px-4 py-3">Status</th>
                                </tr>
                            </thead>

                            <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                                <c:if test="${orders.size() == 0}">
                                    <tr> <td>You have no orders yet to show! </td></tr>
                                </c:if>
                                <c:forEach var="order" items="${orders}">
                                    <tr class="bg-gray-50 dark:bg-gray-800 hover:bg-gray-100 dark:hover:bg-gray-900 text-gray-700 dark:text-gray-400">
                                        <td class="px-4 py-3 text-sm font-bold"><c:out value='${order.getId()}'/></td>
                                        <td class="px-4 py-3">
                                            <div class="flex items-center text-sm">
                                                <div>
                                                    <p class="font-semibold"><c:out value='${order.username}'/></p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3">
                                            <div class="flex items-center text-sm">
                                                <div>
                                                    <p class="font-semibold"><c:out value='${order.book_name}'/></p>
                                                    <p class="text-xs text-gray-600 dark:text-gray-400">By: ${order.book_author}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4 py-3 text-sm"><c:out value='${order.quantity}'/></td>
                                        <td class="px-4 py-3 text-sm"><c:out value='${order.order_date}'/></td>
                                        <td class="px-4 py-3 text-sm"><c:out value='${order.phone_number}'/></td>
                                        <td class="px-4 py-3 text-xs">
                                            <span class="px-2 py-1 font-semibold leading-tight text-yellow-700 bg-yellow-100 rounded-full dark:bg-yellow-700 dark:text-green-100"> Pending </span>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <c:if test="${orders.size() != 0}">
                        <div class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
                            <span class="flex items-center col-span-3"> Showing 21-30 of 100 </span>
                            <span class="col-span-2"></span>
                            <!-- Pagination -->

                            <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                                <nav aria-label="Table navigation">
                                    <ul class="inline-flex items-center">
                                        <li>
                                            <button class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple" aria-label="Previous">
                                                <svg aria-hidden="true" class="w-4 h-4 fill-current" viewBox="0 0 20 20">
                                                <path d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" fill-rule="evenodd"></path>
                                                </svg>
                                            </button>
                                        </li>
                                        <li>
                                            <button class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">1</button>
                                        </li>
                                        <li>
                                            <button class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">2</button>
                                        </li>
                                        <li>
                                            <button class="px-3 py-1 text-white dark:text-gray-800 transition-colors duration-150 bg-blue-600 dark:bg-gray-100 border border-r-0 border-blue-600 dark:border-gray-100 rounded-md focus:outline-none focus:shadow-outline-purple">3</button>
                                        </li>
                                        <li>
                                            <button class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">4</button>
                                        </li>
                                        <li>
                                            <span class="px-3 py-1">...</span>
                                        </li>
                                        <li>
                                            <button class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">8</button>
                                        </li>
                                        <li>
                                            <button class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">9</button>
                                        </li>
                                        <li>
                                            <button class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple" aria-label="Next">
                                                <svg class="w-4 h-4 fill-current" aria-hidden="true" viewBox="0 0 20 20">
                                                <path d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd" fill-rule="evenodd"></path>
                                                </svg>
                                            </button>
                                        </li>
                                    </ul>
                                </nav>
                            </span>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- ./Client Table -->
    </body>
</html>
