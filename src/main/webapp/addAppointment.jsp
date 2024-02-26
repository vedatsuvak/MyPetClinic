<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Set Appointment</title>
</head>
<%

RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
rd.include(request, response);
int petid = (Integer) request.getAttribute("petid");
%>
<h4><%=petid %></h4>
<body>
    <br>
    <div class="text-center">
        <h2 style="color: black;"><i>Set Appointment</i></h2>
    </div>
    <section class="intro">
        <div class="gradient-custom-2 h-100">
            <div class="mask d-flex align-items-center h-100">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-5">
                            <div class="table-responsive">
                                <form action="/saveAppointment" method="post">
                                    <table class="table table-dark table-bordered mb-0">
                                        <tbody>
                                            <tr class='label'>
                                                <td style="color: yellow;">Appointment Date</td>
                                                <td><input type="date" name="date" required></td>
                                            </tr>
                                            <tr class='label'>
                                                <td style="color: yellow;">Appointment Time</td>
                                                <td><input type="time" name="time" required></td>
                                            </tr>
                                            <tr class='label'>
                                                <td style="color: yellow;"></td>
                                                <td><input type="hidden" name="petid" value="<%= petid %>" required></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" class="text-center"><input type="submit" value="Save Appointment"></td>
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