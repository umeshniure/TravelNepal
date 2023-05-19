<%-- 
    Document   : package_upload
    Created on : May 2, 2023, 10:29:28 PM
    Author     : Umesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Packages</title>
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="flex w-auto align-items-center justify-content-end">
            <div class="container px-5 align-items-center">
                <div class="container px-5 align-items-center border">
                    <form class="m-5 px-5 border" method="POST" action="uploadPackage">
                        <div class="form-group">
                            <label for="inputTitle">Package Title</label>
                            <input type="text" name="title" class="form-control" id="inputTitle" placeholder="eg. Travel package to Japan">
                        </div>



                        <div class="form-group">
                            <Select name="category">Package category
                                <option value="1">text</option>
                                <option value="1">text1</option>
                                <option value="1">text2</option>
                            </select>
                        </div>



                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="inputPrice">Price</label>
                                <input type="number" name="price" class="form-control" id="inputPrice">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="inputDuration">Duration</label>
                                <input type="number" name="duration" class="form-control" id="inputDuration">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="inputPeople">People</label>
                                <input type="number" name="people" class="form-control" id="inputPeople">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-8">
                                <label for="inputLocation">Location</label>
                                <input type="text" name="location" class="form-control" id="inputLocation">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputAddress2">Description</label>
                            <textarea class="form-control" name="description" id="inputAddress2" rows="4"></textarea>                        
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlFile1">Select image for your package</label>
                            <input type="file" name="picture" class="form-control-file" id="exampleFormControlFile1">
                        </div>
                        <button type="submit" class="btn btn-primary">Add Package</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
