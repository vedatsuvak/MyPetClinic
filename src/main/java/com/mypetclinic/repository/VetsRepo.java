package com.mypetclinic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mypetclinic.model.Vets;

@Repository
public interface VetsRepo extends JpaRepository<Vets, Integer> {

}
