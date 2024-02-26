<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link href="/MyPetClinic/css/styles.css" rel="stylesheet">
    <title>Add Vet</title>
</head>
<% RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
   rd.include(request, response);
%>
<body>
    <br>
    <div class="text-center">
        <h2 style="color: black;"><i>Add Vet</i></h2>
    </div>
    <section class="intro">
        <div class="gradient-custom-2 h-100">
            <div class="mask d-flex align-items-center h-100">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-5">
                            <div class="table-responsive">
                                <form action="registerVet" method="post">
                                    <table class="table table-dark table-bordered mb-0">
                                        <thead>
                                            <tr class='label'>
                                                <td style="color: yellow;">Vet Name</td>
                                                <td><input type="text" name="vetname" pattern="^[A-Za-z ]{5,30}$" title="letters only. Length between 5 and 30 characters." required></td>
                                            </tr>

                                            <tr class='label'>
                                                <td style="color: yellow;">Phone Number</td>
                                                <td><input type="text" name="vetphone" pattern="^[+]+[0-9]{9,11}$" title="Enter a valid phone number." required></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="text-center"><input type="submit" value="Register Vet"></td>
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
    <br>
</body>
</html>
