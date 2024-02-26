<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mypetclinic.model.Vets"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"></head>
<link href="/MyPetClinic/css/styles.css" rel="stylesheet"></link>
<title>Edit Vet</title>
</head>
<%
Vets v =(Vets) request.getAttribute("vet");
RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
rd.include(request, response);

%>
<body>
<br>
	<div>
		<h2 class="text-center text-black"><i>Edit Vet</i></h2>
	</div>
	<section class="intro">
		<div class="gradient-custom-2 h-100">
			<div class="mask d-flex align-items-center h-100">
				<div class="container">
		        	<div class="row justify-content-center">
		          		<div class="col-15">
		            		<div class="table-responsive">
		            		<form action="/updateVet" method="post">
		              			<table class="table table-dark table-bordered mb-0">
									<thead>
		                				
										<tr>
											<th>Vet ID</th>
											<th>Vet Name</th>
											<th>Vet Phone</th>
										</tr>
										<tr>
									    	<td><%= v.getVetid() %><input type="hidden" name="vetid" value="<%= v.getVetid() %>"></td>
									    	<td><input type="text" name="vetname" value="<%= v.getVetname() %>"></td>
									        <td><input type="text" name="vetphone" value="<%= v.getVetphone() %>"></td>
									    </tr>
									    <tr>
											<td colspan="3"><button type="submit">Edit Vet</button></td>										
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