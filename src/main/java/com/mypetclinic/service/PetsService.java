package com.mypetclinic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mypetclinic.model.Pets;
import com.mypetclinic.repository.PetsRepo;

@Service
public class PetsService {
	@Autowired
	private PetsRepo repo;

	// Insert a Pet
	public Pets register(Pets pet) {
		return repo.save(pet);
	}

	// Retrieve all Pets
	public List<Pets> getAllPets() {
		return repo.findAll();
	}

	// Retrieve all Pets
	public List<Pets> getOwnerPets(int ownerid) {
		return repo.getOwnerPets(ownerid);
	}

	// Retrieve an Pet by ID
	public Pets findPetbyId(int id) {
		return repo.findById(id).orElse(null);
	}

	// update Pet
	public Pets updatePet(Pets pet) {
		return repo.save(pet);
	}

	// Delete a Pet by ID
	public String deleteById(int id) {
		repo.deleteById(id);
		return "Deleted";
	}

}
