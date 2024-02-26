<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.mypetclinic.model.Owners"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"></head>
<link href="/MyPetClinic/css/styles.css" rel="stylesheet"></link>
<title>Edit Owner</title>
</head>
<%
Owners o =(Owners) request.getAttribute("owner");
RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
rd.include(request, response);

%>
<body>
<br>
	<div>
		<h2 class="text-center text-black"><i>Edit Owner</i></h2>
	</div>
	<section class="intro">
		<div class="gradient-custom-2 h-100">
			<div class="mask d-flex align-items-center h-100">
				<div class="container">
		        	<div class="row justify-content-center">
		          		<div class="col-15">
		            		<div class="table-responsive">
		            		<form action="/updateOwner" method="post">
		              			<table class="table table-dark table-bordered mb-0">
									<thead>
		                				
										<tr>
											<th>Owner ID</th>
											<th>Owner Name</th>
											<th>Owner Phone</th>
										</tr>
										<tr>
									    	<td><%= o.getOwnerid() %><input type="hidden" name="ownerid" value="<%= o.getOwnerid() %>"></td>
									    	<td><input type="text" name="ownername" value="<%= o.getOwnername() %>"></td>
									        <td><input type="text" name="ownerphone" value="<%= o.getOwnerphone() %>"></td>
									    </tr>
									    <tr>
											<td colspan="3"><button type="submit">Update Owner</button></td>										
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