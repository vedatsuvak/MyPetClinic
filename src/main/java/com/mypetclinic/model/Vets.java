package com.mypetclinic.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Vets {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int vetid;
	private String vetname;
	private String vetphone;
}
