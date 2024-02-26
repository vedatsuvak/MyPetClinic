package com.mypetclinic.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mypetclinic.model.Vets;
import com.mypetclinic.service.VetsService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
//spring boot app is open to gt accessed for any external applciation 
//@CrossOrigin(origins = "localhost:4200")
@CrossOrigin(origins = "*")
public class VetsController {
	@Autowired
	VetsService service;

	ModelAndView mv = new ModelAndView();
	Vets vet = new Vets();

	@GetMapping("/")
	public ModelAndView defaultpage(HttpServletRequest request, HttpServletResponse response) {
		mv.setViewName("index.jsp");
		return mv;
	}

	// Done
	@PostMapping("/registerVet")
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		List<Vets> vets = service.getAllVets();
		vet = new Vets();
		vet.setVetid(0);
		vet.setVetname(request.getParameter("vetname"));
		vet.setVetphone(request.getParameter("vetphone"));

		for (Vets singleVet : vets) {
			if (vet.getVetname() != null && vet.getVetname().equals(singleVet.getVetname())) {
				mv.setViewName("error.jsp");
				String message = "Hey " + vet.getVetname() + ", already registered, please choose another Vet Name!!!";
				mv.addObject("message", message);
				return mv;
			}
		}
		service.register(vet);
		String message = "Hey " + vet.getVetname() + ", Vet registered successfully!!";
		mv.addObject("message", message);
		mv.addObject("vetslist", service.getAllVets());
		mv.setViewName("/listVet.jsp");
		return mv;
	}

	// Done
	@GetMapping("/getVet/{vetid}")
	public ModelAndView findVet(@PathVariable int vetid) {
		vet = service.findVet(vetid);
		mv.addObject("vet", vet);
		mv.setViewName("/editVet.jsp");
		return mv;
	}

	// Done
	@PostMapping("/updateVet")
	public ModelAndView updateVet(@RequestParam int vetid, @RequestParam String vetname,
			@RequestParam String vetphone) {
		vet.setVetid(vetid);
		vet.setVetname(vetname);
		vet.setVetphone(vetphone);
		service.updateVet(vet);
		System.out.println(vet);
		mv.addObject("vetslist", service.getAllVets());
		String message = "Vet: " + vet.getVetname() + ", updated successfully!!";
		mv.addObject("message", message);
		mv.setViewName("listVet.jsp");
		return mv;
	}

	// Done
	@GetMapping("/deleteVetById")
	public ModelAndView deleteById(@RequestParam int vetid) {
		service.deleteById(vetid);
		String message = "Vet deleted successfully";
		mv.addObject("message", message);
		mv.addObject("vetslist", service.getAllVets());
		mv.setViewName("listVet.jsp");
		return mv;
	}

	// Done
	@GetMapping("/getAllVets")
	public ModelAndView getAllVets(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		List<Vets> vetslist = service.getAllVets();
		String message = "Vets listed:";
		mv.addObject("vetslist", vetslist);
		mv.addObject("message", message);
		mv.setViewName("listVet.jsp");
		return mv;
	}
}
