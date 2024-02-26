package com.mypetclinic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mypetclinic.model.Vets;
import com.mypetclinic.repository.VetsRepo;

@Service
public class VetsService {
	@Autowired
	private VetsRepo repo;

	// Insert a Vet
	public Vets register(Vets vet) {
		return repo.save(vet);
	}

	// Retrieve all Vets
	public List<Vets> getAllVets() {
		return repo.findAll();
	}

	// Retrieve an Vet by ID
	public Vets findVet(int vetid) {
		Vets result = repo.findById(vetid).orElse(null);
		return result;
	}

	// update Vet
	public Vets updateVet(Vets owner) {
		return repo.save(owner);
	}

	// Delete a Vet by ID
	public String deleteById(int id) {
		repo.deleteById(id);
		return "Deleted";
	}

}
