package com.mypetclinic.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mypetclinic.model.Pets;

@Repository
public interface PetsRepo extends JpaRepository<Pets, Integer> {

	String query1 = "select pet from Pets pet where pet.ownerid = ?1";

	@Query(query1)
	List<Pets> getOwnerPets(int ownerid);
}
