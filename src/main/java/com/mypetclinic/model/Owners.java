package com.mypetclinic.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Owners {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ownerid;
	private String ownername;
	private String ownerphone;
}
