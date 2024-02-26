<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link href="/MyPetClinic/css/styles.css" rel="stylesheet">
    <style>
        /* Additional styles for horizontal list */
        .horizontal-list {
            display: flex;
            list-style: none;
            padding: 0;
        }

        .horizontal-list li {
            margin-right: 15px; /* Adjust the spacing between items */
        }
    </style>
    <title>My Pet Clinic</title>
</head>
<body>
    <h1>Welcome to My Pet Clinic</h1>
    <h3>Choose One of The Actions Below:</h3>
		<ul class="horizontal-list">
		    <li><button class="nav-link bg-light" onclick="window.location.href='/addVet.jsp';">Add Vet</button></li>
		    <li><button class="nav-link bg-light" onclick="window.location.href='/getAllVets';">List all Vets</button></li>
		    <li><button class="nav-link bg-light" onclick="window.location.href='/addOwner.jsp';">Add Owner To the system</button></li>
		    <li><button class="nav-link bg-light" onclick="window.location.href='/getAllOwners';">Manage Owners and Pets</button></li>
		</ul>

</body>
</html>
