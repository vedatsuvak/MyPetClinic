package com.mypetclinic.controller;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mypetclinic.model.Appointments;
import com.mypetclinic.service.AppointmentsService;
import com.mypetclinic.service.OwnersService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
//spring boot app is open to gt accessed for any external applciation 
//@CrossOrigin(origins = "localhost:4200")
@CrossOrigin(origins = "*")
public class AppointmentController {
	@Autowired
	AppointmentsService service;
	@Autowired
	OwnersService ownersservice;
	ModelAndView mv = new ModelAndView();
	Appointments appointment = new Appointments();

	@PostMapping("/saveAppointment")
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		appointment.setAppointmentid(0);
		appointment.setDate(request.getParameter("date"));
		appointment.setTime(request.getParameter("time"));
		appointment.setPetid(Integer.parseInt(request.getParameter("petid")));

		service.register(appointment);
		String message = "Hey, appointment saved successfully!!";
		mv.addObject("message", message);
		mv.addObject("ownerslist", ownersservice.getAllOwners());
		mv.setViewName("/listOwners.jsp");
		return mv;
	}

	@GetMapping("/setAppointment")
	public ModelAndView setAppointment(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		int petid = Integer.parseInt(request.getParameter("petid"));
		mv.addObject("petid", petid);
		mv.setViewName("/addAppointment.jsp");
		return mv;
	}

	@GetMapping("/showAppointments")
	public ModelAndView showAppointment(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		int petid = Integer.parseInt(request.getParameter("petid"));
		mv.addObject("list", service.getAppointmentByPetid(petid));
		mv.addObject("petid", petid);
		mv.setViewName("/showAppointments.jsp");
		return mv;
	}

}
