<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.mypetclinic.model.Pets"%>
    <%@ page import="com.mypetclinic.model.Vets"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Pet</title>
</head>
<%
Pets p =(Pets) request.getAttribute("pet");
RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
rd.include(request, response);
List<Vets> vetlist =(List<Vets>) request.getAttribute("vetlist");

%>
<body>
<br>
	<div>
		<h2 class="text-center text-black"><i>Edit Pet</i></h2>
	</div>
	<section class="intro">
		<div class="gradient-custom-2 h-100">
			<div class="mask d-flex align-items-center h-100">
				<div class="container">
		        	<div class="row justify-content-center">
		          		<div class="col-15">
		            		<div class="table-responsive">
		            		<form action="/updatePet" method="post">
		              			<table class="table table-dark table-bordered mb-0">
									<thead>
		                				
										<tr class='label'>
                                                <td style="color: yellow;">Pet Name</td>
                                                <td><input type="text" name="petname" value="<%=p.getPetname() %>" pattern="^[A-Za-z ]{2,30}$" title="Letters only. Length between 5 and 30 characters." required></td>
                                            </tr>
                                            <tr class='label'>
                                                <td style="color: yellow;">Pet Type</td>
                                                <td><input type="text" name="pettype" value="<%=p.getPettype() %>" pattern="^[A-Za-z ]{2,30}$" title="Letters only. Length between 5 and 30 characters." required></td>
                                            </tr>
                                            <tr class='label'>
                                                <td style="color: yellow;">Pet Breed</td>
                                                <td><input type="text" name="petbreed" value="<%=p.getPetbreed() %>" pattern="^[A-Za-z ]{2,30}$" title="Letters only. Length between 5 and 30 characters." required></td>
                                            </tr>
                                            <tr class='label'>
                                                <td style="color: yellow;"></td>
                                                <td><input type="hidden" name="ownerid" value="<%= p.getOwnerid() %>" required></td>
                                            </tr>
                                            <tr class='label'>
                                                <td style="color: yellow;"></td>
                                                <td><input type="hidden" name="petid" value="<%= p.getPetid() %>" required></td>
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
									</thead>
			 					</table>
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