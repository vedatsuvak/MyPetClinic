package com.mypetclinic.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Pets {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int petid;
	private String petname;
	private String pettype;
	private String petbreed;
	private int ownerid;
	private int vetid;

}
