<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mypetclinic.service.VetsService" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mypetclinic.model.Vets" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link href="/MyPetClinic/css/styles.css" rel="stylesheet">
    <title>Add Pet</title>
    <% 
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.include(request, response);
        int ownerid = (int) request.getAttribute("ownerid");
        VetsService service = new VetsService();
        List<Vets> vetlist =(List<Vets>) request.getAttribute("vetlist");
    %>
</head>
<body>
    <br>
    <div class="text-center">
        <h2 style="color: black;"><i>Add Pet</i></h2>
    </div>
    <section class="intro">
        <div class="gradient-custom-2 h-100">
            <div class="mask d-flex align-items-center h-100">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-5">
                            <div class="table-responsive">
                                <form action="registerPet" method="post">
                                    <table class="table table-dark table-bordered mb-0">
                                        <tbody>
                                            <tr class='label'>
                                                <td style="color: yellow;">Pet Name</td>
                                                <td><input type="text" name="petname" pattern="^[A-Za-z ]{2,30}$" title="Letters only. Length between 5 and 30 characters." required></td>
                                            </tr>
                                            <tr class='label'>
                                                <td style="color: yellow;">Pet Type</td>
                                                <td><input type="text" name="pettype" pattern="^[A-Za-z ]{2,30}$" title="Letters only. Length between 5 and 30 characters." required></td>
                                            </tr>
                                            <tr class='label'>
                                                <td style="color: yellow;">Pet Breed</td>
                                                <td><input type="text" name="petbreed" pattern="^[A-Za-z ]{2,30}$" title="Letters only. Length between 5 and 30 characters." required></td>
                                            </tr>
                                            <tr class='label'>
                                                <td style="color: yellow;"></td>
                                                <td><input type="hidden" name="ownerid" value="<%= ownerid %>" required></td>
                                            </tr>
                                            <tr class='label'>
                                                <td style="color: yellow;">Vet</td>
                                                <td>
                                                    <select name="vetid" required>
                                                        <option value="" disabled selected>Select Vet</option>
                                                        <% for (Vets vet : vetlist) { %>
                                                            <option value="<%= vet.getVetid() %>"><%= vet.getVetname() %></option>
                                                        <% } %>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="text-center"><input type="submit" value="Save Pet"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <br>
</body>
</html>
