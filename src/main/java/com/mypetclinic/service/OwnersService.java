package com.mypetclinic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mypetclinic.model.Owners;
import com.mypetclinic.repository.OwnersRepo;

@Service
public class OwnersService {
	@Autowired
	private OwnersRepo repo;

	// Insert a Owner
	public Owners register(Owners owner) {
		return repo.save(owner);
	}

	// Retrieve all Owner
	public List<Owners> getAllOwners() {
		return repo.findAll();
	}

	// Retrieve an Owner by ID
	public Owners getOwnerById(int id) {
		return repo.findById(id).orElse(null);
	}

	// update Owner
	public Owners updateOwner(Owners owner) {
		return repo.save(owner);
	}

	// Delete a Owner by ID
	public String deleteById(int id) {
		repo.deleteById(id);
		return "Deleted";
	}

}
