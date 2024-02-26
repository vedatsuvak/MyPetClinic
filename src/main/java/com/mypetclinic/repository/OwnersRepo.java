package com.mypetclinic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mypetclinic.model.Owners;

@Repository
public interface OwnersRepo extends JpaRepository<Owners, Integer> {

}
