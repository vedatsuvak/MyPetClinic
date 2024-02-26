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

import com.mypetclinic.model.Owners;
import com.mypetclinic.model.Pets;
import com.mypetclinic.model.Vets;
import com.mypetclinic.service.OwnersService;
import com.mypetclinic.service.PetsService;
import com.mypetclinic.service.VetsService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
//spring boot app is open to gt accessed for any external applciation 
//@CrossOrigin(origins = "localhost:4200")
@CrossOrigin(origins = "*")
public class PetsController {
	@Autowired
	PetsService service;
	@Autowired
	VetsService vetservice;
	@Autowired
	OwnersService ownerservice;
	ModelAndView mv = new ModelAndView();
	Pets pet = new Pets();

	// Done
	@PostMapping("/registerPet")
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		pet.setPetid(0);
		pet.setPetname(request.getParameter("petname"));
		pet.setPetbreed(request.getParameter("petbreed"));
		pet.setPettype(request.getParameter("pettype"));
		pet.setOwnerid(Integer.parseInt(request.getParameter("ownerid")));
		pet.setVetid(Integer.parseInt(request.getParameter("vetid")));
		service.register(pet);
		String message = "Hey " + pet.getPetname() + ", Pet registered successfully!!";
		mv.addObject("message", message);
		mv.addObject("petlist", service.getOwnerPets(pet.getOwnerid()));
		mv.setViewName("/listPets.jsp");
		return mv;
	}

	// Done
	@GetMapping("/getPet/{petid}")
	public ModelAndView getPet(@PathVariable int petid) {
		Pets pet = service.findPetbyId(petid);
		mv.addObject("pet", pet);
		List<Vets> vetlist = vetservice.getAllVets();
		mv.addObject("vetlist", vetlist);
		mv.setViewName("/editPet.jsp");
		return mv;
	}

	// Done
	@PostMapping("/updatePet")
	public ModelAndView updatePet(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		pet.setPetid(Integer.parseInt(request.getParameter("petid")));
		pet.setPetname(request.getParameter("petname"));
		pet.setPetbreed(request.getParameter("petbreed"));
		pet.setPettype(request.getParameter("pettype"));
		pet.setOwnerid(Integer.parseInt(request.getParameter("ownerid")));
		pet.setVetid(Integer.parseInt(request.getParameter("vetid")));
		service.updatePet(pet);
		String message = "Hey " + pet.getPetname() + ", Pet updated successfully!!";
		mv.addObject("message", message);
		mv.addObject("petslist", service.getOwnerPets(pet.getOwnerid()));
		mv.setViewName("/listPets.jsp");
		return mv;
	}

	//
	@GetMapping("/deletePetById")

	public ModelAndView deleteById(@RequestParam int petid) {
		service.deleteById(petid);
		String message = "Pet deleted successfully";
		mv.addObject("message", message);
		mv.addObject("petslist", service.getAllPets());
		mv.setViewName("listPets.jsp");
		return mv;
	}

	//
	@GetMapping("/getAllPets")
	public List<Pets> getAllPets() {
		return service.getAllPets();
	}

	@GetMapping("/getOwnerPets/{ownerid}")
	public ModelAndView getOwnerPets(@PathVariable int ownerid) {
		List<Pets> petlist = service.getOwnerPets(ownerid);
		Owners owner = ownerservice.getOwnerById(ownerid);
		String message = owner.getOwnername() + "'s Pets listed";
		mv.addObject("ownername", owner.getOwnername());
		mv.addObject("ownerid", owner.getOwnerid());
		mv.addObject("message", message);
		mv.addObject("petlist", petlist);
		mv.setViewName("/listPets.jsp");
		return mv;
	}

	// Done
	@GetMapping("/addPetPage")
	public ModelAndView getAllVets(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		int ownerid = Integer.parseInt(request.getParameter("ownerid"));
		List<Vets> vetlist = vetservice.getAllVets();
		mv.addObject("vetlist", vetlist);
		mv.addObject("ownerid", ownerid);
		mv.setViewName("/addPet.jsp");
		return mv;
	}
}
