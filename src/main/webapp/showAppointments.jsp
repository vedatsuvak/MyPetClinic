<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.mypetclinic.model.Appointments" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
rd.include(request, response);
int petid = (Integer) request.getAttribute("petid");
List<Appointments> list =(List<Appointments>) request.getAttribute("list");
%>

</head>
<body>
    <br>
    <div class="text-center">
        <h2 style="color: black;"><i>Show Appointments for Pet:<%=petid%></i></h2>
    </div>
    <section class="intro">
        <div class="gradient-custom-2 h-100">
            <div class="mask d-flex align-items-center h-100">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-5">
                            <div class="table-responsive">
                                    <table class="table table-dark table-bordered mb-0">
                                        <tbody>
                                        <% for (Appointments a : list){ %>
                                            <tr class='label'>
                                                <td style="color: yellow;">Appointment Date</td>
                                                <td><%=a.getDate() %></td>
                                            </tr>
                                            <tr class='label'>
                                                <td style="color: yellow;">Appointment Time</td>
                                                <td><%=a.getTime() %></td>
                                            </tr>
                                            <tr class='label'>
                                                <td style="color: yellow;"></td>
                                                <td><input type="hidden" name="petid" value="<%= petid %>" required></td>
                                            </tr>
                                             <% } %>
                                        </tbody>
                                    </table>
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