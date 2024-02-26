<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mypetclinic.model.Owners" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Owners</title>
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
    List<Owners> list = (List<Owners>) request.getAttribute("ownerslist");
    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
    rd.include(request, response);
    String message = (String) request.getAttribute("message");
%>
<br>
<h4><%= message %></h4>
<div>
    <h2 class="text-center text-black"><i>List of Owners</i></h2>
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
                                        <form action="addOwner.jsp" method="post">
                                            <input type="submit" value="Add a new Owner">
                                        </form>
                                    </th>
                                </tr>
                                <tr>
                                    <th>Owner Name</th>
                                    <th>Owner Phone</th>
                                    <th>Edit Action</th>
                                    <th>Delete Action</th>
                                    <th>Add Pet</th>
                                    <th>List Pets</th>
                                </tr>
                                <% for (Owners o : list) { %>
                                    <tr>
                                        <td><%= o.getOwnername() %></td>
                                        <td><%= o.getOwnerphone() %></td>
                                        <td>
                                            <form action="/getOwner/<%= o.getOwnerid() %>" method="get">
                                                <input type="hidden" name="ownerid" value="<%= o.getOwnerid() %>">
                                                <input type="submit" value="Edit Owner">
                                            </form>
                                        </td>
										<td>
											<button onclick="if(confirmDelete()) { window.location.href='/deleteOwnerById?ownerid=<%= o.getOwnerid() %>';}">Delete Owner</button>
										</td>
										<td>
                                            <form action="/addPetPage" method="get">
                                                <input type="hidden" name="ownerid" value="<%= o.getOwnerid() %>">
                                                <input type="submit" value="Add Pet">
                                            </form>
                                        </td>
                                        <td>
                                            <form action="/getOwnerPets/<%= o.getOwnerid() %>" method="get">
                                                <input type="hidden" name="ownerid" value="<%= o.getOwnerid() %>">
                                                <input type="submit" value="List Pets">
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