<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.mypetclinic.model.Pets" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Owner's Pet List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css"
          integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
          crossorigin="anonymous">
    <link href="/MyPetClinic/css/styles.css" rel="stylesheet">
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to Delete Owner?");
        }
    </script>
</head>
<body>
<%
    List<Pets> list = (List<Pets>) request.getAttribute("petlist");
    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
    rd.include(request, response);
    String message = (String) request.getAttribute("message");
    String ownername = (String) request.getAttribute("ownername");
    int ownerid = (Integer) request.getAttribute("ownerid");
%>
<br>
<h4><%= message %></h4>
<div>
    <h2 class="text-center text-black"><i>List of Owner <%=ownername %>'s Pets</i></h2>
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
                                        <form action="/addPetPage" method="get">
                                        	<input type="hidden" name="ownerid" value="<%= ownerid %>">
                                            <input type="submit" value="Add a new Pet">
                                        </form>
                                    </th>
                                </tr>
                                <tr>
                                    <th>Pet Name</th>
                                    <th>Pet Type</th>
                                    <th>Pet Breed</th>
                                    <th>Vet</th>
                                    <th>Edit Action</th>
                                    <th>Delete Pet</th>
                                    <th>Set Appointment</th>
                                    <th>Show Appointments</th>
                                </tr>
                                <% for (Pets p : list) { %>
                                    <tr>
                                        <td><%= p.getPetname() %></td>
                                        <td><%= p.getPettype() %></td>
                                        <td><%= p.getPetbreed() %></td>
                                        <td><%= p.getVetid() %></td>
                                        <td>
                                            <form action="/getPet/<%= p.getPetid() %>" method="get">
                                                <input type="hidden" name="petid" value="<%= p.getPetid() %>">
                                                <input type="submit" value="Edit Pet">
                                            </form>
                                        </td>
										<td>
											<button onclick="if(confirmDelete()) { window.location.href='/deletePetById?petid=<%= p.getPetid() %>';}">Delete Pet</button>
										</td>
										<td>
                                            <form action="/setAppointment" method="get">
                                                <input type="hidden" name="petid" value="<%= p.getPetid() %>">
                                                <input type="submit" value="Set Appointment">
                                            </form>
                                        </td>
                                        <td>
                                            <form action="/showAppointments" method="get">
                                                <input type="hidden" name="petid" value="<%= p.getPetid() %>">
                                                <input type="submit" value="Show Appointments">
                                            </form>
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