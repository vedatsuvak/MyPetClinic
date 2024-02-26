<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mypetclinic.model.Vets" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Vets</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
          crossorigin="anonymous">
    <link href="/MyPetClinic/css/styles.css" rel="stylesheet">
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to Delete Vet?");
        }
    </script>
</head>

<%
    List<Vets> list = (List<Vets>) request.getAttribute("vetslist");
    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
    rd.include(request, response);
    String message = (String) request.getAttribute("message");
%>
<body>
<br>
<h4><%= message %></h4>
<div>
    <h2 class="text-center text-black"><i>List of Vets</i></h2>
</div>
<section class="intro">
    <div class="gradient-custom-2 h-100">
        <div class="mask d-flex align-items-center h-100">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-15">
                        <div class="table-responsive">
                            <table class="table table-dark table-bordered mb-0">
                                <thead>
                                <tr>
                                    <th scope="col" colspan='10' class="text-center">
                                        <form action="addVet.jsp" method="post">
                                            <input type="submit" value="Add a new Vet">
                                        </form>
                                    </th>
                                </tr>
                                <tr>
                                	<th>Vet ID</th>
                                    <th>Vet Name</th>
                                    <th>Vet Phone</th>
                                    <th>Edit Action</th>
                                    <th>Delete Action</th>
                                </tr>
                                <% for (Vets v : list) { %>
                                    <tr>
                                    	<td><%= v.getVetid() %></td>
                                        <td><%= v.getVetname() %></td>
                                        <td><%= v.getVetphone() %></td>
                                        <td>
                                            <form action="/getVet/<%= v.getVetid() %>" method="get">
                                                <input type="hidden" name="vetid" value="<%= v.getVetid() %>">
                                                <input type="submit" value="Edit Vet">
                                            </form>
                                        </td>
										<td>
											<button onclick="if(confirmDelete()) { window.location.href='deleteVetById?vetid=<%= v.getVetid() %>';}">Delete Vet</button>
										</td>
                                    </tr>
                                <% } %>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
