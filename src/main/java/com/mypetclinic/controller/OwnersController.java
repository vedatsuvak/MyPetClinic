package com.mypetclinic.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mypetclinic.model.Owners;
import com.mypetclinic.service.OwnersService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
//spring boot app is open to gt accessed for any external applciation 
//@CrossOrigin(origins = "localhost:4200")
@CrossOrigin(origins = "*")
public class OwnersController {
	@Autowired
	OwnersService service;
	ModelAndView mv = new ModelAndView();
	Owners owner = new Owners();

	@RequestMapping("/")
	public ModelAndView defaultpage(HttpServletRequest request, HttpServletResponse response) {

		mv.setViewName("index.jsp");
		return mv;
	}

	// Done
	@PostMapping("/registerOwner")
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		List<Owners> owners = service.getAllOwners();
		Owners owner = new Owners();
		owner.setOwnerid(0);
		owner.setOwnername(request.getParameter("ownername"));
		owner.setOwnerphone(request.getParameter("ownerphone"));
		for (Owners singleOwner : owners) {
			if (owner.getOwnername() != null && owner.getOwnername().equals(singleOwner.getOwnername())) {
				String message = "Hey " + owner.getOwnername()
						+ ", already registered, please choose another Owner Name!!!";
				mv.setViewName("error.jsp");
				mv.addObject("message", message);
				return mv;
			}
		}
		service.register(owner);
		String message = "Hey " + owner.getOwnername() + ", Owner registered successfully!!";
		mv.addObject("message", message);
		mv.addObject("ownerslist", service.getAllOwners());
		mv.setViewName("/listOwners.jsp");
		return mv;
	}

	// Done
	@GetMapping("/getOwner/{ownerId}")
	public ModelAndView getOwner(@PathVariable int ownerId) {
		Owners owner = service.getOwnerById(ownerId);
		mv.addObject("owner", owner);
		mv.setViewName("/editOwner.jsp");
		return mv;
	}

	// Done
	@PostMapping("/updateOwner")
	public ModelAndView updateOwner(@RequestParam int ownerid, @RequestParam String ownername,
			@RequestParam String ownerphone) {
		Owners owner = new Owners();
		owner.setOwnerid(ownerid);
		owner.setOwnername(ownername);
		owner.setOwnerphone(ownerphone);
		service.updateOwner(owner);
		mv.addObject("ownerslist", service.getAllOwners());
		String message = "Owner: " + owner.getOwnername() + ", updated successfully!!";
		mv.addObject("message", message);
		mv.setViewName("listOwners.jsp");
		return mv;
	}

	// Done
	@GetMapping("/deleteOwnerById")
	public ModelAndView deleteById(@RequestParam int ownerid) {
		service.deleteById(ownerid);
		String message = "Owner deleted successfully";
		mv.addObject("message", message);
		mv.addObject("ownerslist", service.getAllOwners());
		mv.setViewName("listOwners.jsp");
		return mv;
	}

	// Done
	@GetMapping("/getAllOwners")
	public ModelAndView getAllVets(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, IOException {
		List<Owners> owners = service.getAllOwners();
		String message = "Owners listed:";
		mv.addObject("ownerslist", owners);
		mv.addObject("message", message);
		mv.setViewName("/listOwners.jsp");
		return mv;
	}

}
